//
//  ClanByTagJSONSerializer.m
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/30/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import "ClanByTagJSONSerializer.h"
#import "ClansModel.h"

@implementation ClanByTagJSONSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error {
    
    NSMutableArray *retArray = [[NSMutableArray alloc] init];
    NSDictionary *json = [super responseObjectForResponse:response data:data error:error];
    
    
    //if ([[json valueForKey:@"code"] integerValue] == 200) {
    ClansModel *Clans = [[ClansModel alloc] initWithDictionary:json];
    [retArray addObject:Clans];
    
    return retArray;
    /*
    } else {
        return nil;
    }
    */
}

@end
