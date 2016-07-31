//
//  WarLogJSONSerializer.m
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/30/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import "WarLogJSONSerializer.h"
#import "WarLogModel.h"

@implementation WarLogJSONSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error {
    
    NSMutableArray *retArray = [[NSMutableArray alloc] init];
    NSDictionary *json = [super responseObjectForResponse:response data:data error:error];
    NSArray *arrData = json[@"items"];
    
    //if ([[json valueForKey:@"code"] integerValue] == 200) {
    for (NSUInteger i = 0 ; i < arrData.count; i++)
    {
        WarLogModel *arrWarLog = [[WarLogModel alloc] initWithDictionary:[arrData objectAtIndex:i]];
        [retArray addObject:arrWarLog];
    }
    return retArray;
    /*} else {
     return nil;
     }
     */
    
}

@end
