//
//  DataModel.m
//  TBP
//
//  Created by SunJin, Choi on 2013. 12. 4..
//  Copyright (c) 2013년 NHNNEXT. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel
{
    NSArray* _itemArray;
    NSArray* _itemArray2;
    NSDictionary* _itemDictionary;
    NSMutableDictionary* _loginData;
    NSMutableData* _responseData;
}

- (id)init
{
    self = [super init];
    if (self) {
        //_itemArray = @[@"apple", @"MS", @"linux"];
        _itemArray2 = [@[
                        @{@"text":@"Drop of Water", @"content":@"Drop of Water on blue thing", @"image":@"http://www.ilikewallpaper.net/iphone-5-wallpapers/download/4938/Blue-Drops-iphone-5-wallpaper-ilikewallpaper_com.jpg"},
                        @{@"text":@"Dew", @"content":@"Dew on pink flower", @"image":@"http://webtoolfeed.files.wordpress.com/2012/10/tumblr_mc04thy3br1rhztfto1_1280.jpg"},
                        @{@"text":@"Valley", @"content":@"Valley in winter mountain", @"image":@"http://www.animhut.com/wp-content/uploads//2012/09/Download-iPhone5-Retina-HD-Wallpapers-12.jpg"},
                        @{@"text":@"Drop of Water", @"content":@"Drop of Water on blue thing", @"image":@"http://www.ilikewallpaper.net/iphone-5-wallpapers/download/4938/Blue-Drops-iphone-5-wallpaper-ilikewallpaper_com.jpg"},
                        @{@"text":@"Dew", @"content":@"Dew on pink flower", @"image":@"http://webtoolfeed.files.wordpress.com/2012/10/tumblr_mc04thy3br1rhztfto1_1280.jpg"},
                        @{@"text":@"Valley", @"content":@"Valley in winter mountain", @"image":@"http://www.animhut.com/wp-content/uploads//2012/09/Download-iPhone5-Retina-HD-Wallpapers-12.jpg"}
                        ] mutableCopy];
        _itemDictionary = @{@"name":@"sunjin", @"age":@4, @"female":@YES, @"array":_itemArray2};
        
        //NSMutableArray* _newArray = [@[@"apple"] mutableCopy]; //
        _loginData = [[NSMutableDictionary alloc] initWithCapacity:2];
        
        _responseData = [[NSMutableData alloc] initWithCapacity:10];
        //NSString *aURLString = @"http://1.234.2.8/board.php";
        NSString *aURLString = @"http://localhost:8080/board/list.json";
        NSURL *aURL = [NSURL URLWithString:aURLString];
        NSURLRequest *aRequest = [NSMutableURLRequest requestWithURL:aURL];
        NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:aRequest delegate:self startImmediately:YES];
    }
    return self;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:
(NSData *)data
{
    [_responseData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSDictionary* resultDic = [NSJSONSerialization
                            JSONObjectWithData:_responseData
                            options:NSJSONReadingMutableContainers error:nil];
    //NSLog(@"result json = %@", resultDic);
    _itemArray = [resultDic objectForKey:@"boardlist"];
    
    [_tableContoller.tableView reloadData];
    //NSLog(@"item array = %@", _itemArray);
}

-(void)saveID:(NSString*)userid withPassword:(NSString*)password
{
    [_loginData setObject:userid forKey:@"userid"];
    [_loginData setObject:password forKey:@"password"];
}

-(NSString*)getID
{
    return _loginData[@"userid"];
}

-(NSString*)getPassword
{
    return _loginData[@"password"];
}

-(NSDictionary*)objectAtIndex:(NSUInteger)index
{
    return _itemArray[index];
}

-(NSInteger)numberOfData
{
    return [_itemArray count];
}

-(void)addItem:(NSDictionary*)item
{
    
}

- (NSString*) description
{
    return _loginData.description;
}

- (BOOL)authenticateID:(NSString*)userID withPassword:(NSString*)password
{
//    NSString *aURLString = @"http://1.234.2.8/login.php";
//    NSString *aFormData = [NSString stringWithFormat:@"id=%@&passwd=%@", userID, password];
    NSString *aURLString = @"http://localhost:8080/login/get.json";
    NSString *aFormData = [NSString stringWithFormat:@"userid=%@&password=%@", userID, password];
    NSURL *aURL = [NSURL URLWithString:aURLString];
    NSMutableURLRequest *aRequest = [NSMutableURLRequest requestWithURL:aURL];
    [aRequest setHTTPMethod:@"POST"];
    [aRequest setHTTPBody:[aFormData dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSHTTPURLResponse *aResponse;
    NSError *aError;
    NSData *aResultData = [NSURLConnection
                           sendSynchronousRequest:aRequest
                           returningResponse:&aResponse error:&aError];
    
    NSDictionary *dataDictionary = [NSJSONSerialization
                          JSONObjectWithData:aResultData
                          options:NSJSONReadingMutableContainers
                          error:nil];
    
    NSLog(@"login response = %@", aResultData);
    NSLog(@"login response = %d", aResponse.statusCode);
    NSLog(@"login result = %@", dataDictionary);
    
    if ([dataDictionary[@"code"] isEqualToNumber:@200]) {
        return YES;
    } else {
        return NO;
    }

}
@end