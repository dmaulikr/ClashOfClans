//
//  ClansJSONSerializer.m
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/23/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import "ClansJSONSerializer.h"
#import "ClansModel.h"

@implementation ClansJSONSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error {
    
    NSMutableArray *retArray = [[NSMutableArray alloc] init];
    NSDictionary *json = [super responseObjectForResponse:response data:data error:error];
    NSArray *arrData = json[@"items"];
    
    //if ([[json valueForKey:@"code"] integerValue] == 200) {
        for (NSUInteger i = 0 ; i < arrData.count; i++)
        {
            ClansModel *Clans = [[ClansModel alloc] initWithDictionary:[arrData objectAtIndex:i]];
            [retArray addObject:Clans];
        }
    
        return retArray;
    /*} else {
        return nil;
    }
     */
    
}

@end
