//
//  ClansListWebService.m
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/24/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClansListWebService.h"
#import "ClansJSONSerializer.h"
#import "GLBDefinitions.h"

@implementation ClansListWebService
+ (ClansListWebService*)getSharedInstance {
    static ClansListWebService *sharedInstance = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        sharedInstance = [[ClansListWebService alloc] initWithBaseURL:[NSURL URLWithString: baseUrl]];
        sharedInstance.responseSerializer = [ClansJSONSerializer serializer];
    });
    
    return sharedInstance;
}


- (void)callService:(NSDictionary*)parameters withCompletionBlock:(void(^)(NSArray *resultArray, NSError *error))completionBlock {
    
    //Add request/response serializers and request header
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObject: httpContentTypeJson];
    
    [self.requestSerializer setValue:AuthPassword forHTTPHeaderField:AuthUser];
    
    NSString *urlRequest = [NSString stringWithFormat:clansUrl];
    
    //Send Request
    [self GET:urlRequest parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completionBlock(responseObject, nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completionBlock(operation.responseObject, error);
    }];
    
}
@end
