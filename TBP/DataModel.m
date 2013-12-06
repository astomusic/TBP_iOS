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
    NSDictionary* _itemDictionary;
    NSMutableDictionary* _loginData;
}

- (id)init
{
    self = [super init];
    if (self) {
        //_itemArray = @[@"apple", @"MS", @"linux"];
        _itemArray = [@[
                        @{@"text":@"text1", @"content":@"content1", @"image":@"1.jpeg"},
                        @{@"text":@"text2", @"content":@"content2", @"image":@"2.jpg"},
                        @{@"text":@"text3", @"content":@"content3", @"image":@"3.jpg"}
                        ] mutableCopy];
        _itemDictionary = @{@"name":@"sunjin", @"age":@4, @"female":@YES, @"array":_itemArray};
        
        //NSMutableArray* _newArray = [@[@"apple"] mutableCopy]; //
        _loginData = [[NSMutableDictionary alloc] initWithCapacity:2];
    }
    return self;
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
@end
