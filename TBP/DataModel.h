//
//  DataModel.h
//  TBP
//
//  Created by SunJin, Choi on 2013. 12. 4..
//  Copyright (c) 2013년 NHNNEXT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject <NSURLConnectionDataDelegate>
@property UITableViewController* tableContoller;

-(void)saveID:(NSString*)userid withPassword:(NSString*)password;
-(NSDictionary*)objectAtIndex:(NSUInteger)index;
-(void)addItem:(NSDictionary*)item;
-(NSInteger)numberOfData;

-(NSString*)getID;
-(NSString*)getPassword;
-(BOOL)authenticateID:(NSString*)userID withPassword:(NSString*)password;

@end
