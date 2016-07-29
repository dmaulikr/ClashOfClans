//
//  ClanByTagWebService.m
//  ClashOfClans
//
//  Created by Victor Roldan on 7/29/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "ClanByTagWebService.h"
#import "ClansJSONSerializer.h"
#import "GLBDefinitions.h"

@implementation ClanByTagWebService


+ (ClanByTagWebService*)getSharedInstance {
    static ClanByTagWebService *sharedInstance = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        sharedInstance = [[ClanByTagWebService alloc] initWithBaseURL:[NSURL URLWithString: baseUrl]];
        sharedInstance.responseSerializer = [ClansJSONSerializer serializer];
    });
    
    return sharedInstance;
}


- (void)callService:(NSDictionary*)parameters withCompletionBlock:(void(^)(NSArray *resultArray, NSError *error))completionBlock {
    
    //Add request/response serializers and request header
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObject: httpContentTypeJson];

    [self.requestSerializer setValue:AuthPassword forHTTPHeaderField:AuthUser];
    
    NSString *clanTag = [parameters[@"clanTag"] stringByReplacingOccurrencesOfString:@"#" withString:@"%"];
    NSString *urlRequest = [NSString stringWithFormat:clansInfoUrl, clanTag];
    
    //Send Request
    [self GET:urlRequest parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completionBlock(responseObject, nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completionBlock(operation.responseObject, error);
    }];
    
}

@end
