//
//  ClansWebService.m
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/23/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClansJSONSerializer.h"
#import "ClansWebService.h"
#import "GLBDefinitions.h"

@implementation ClansWebService

+ (ClansWebService*)getSharedInstance {
    static ClansWebService *sharedInstance = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        sharedInstance = [[ClansWebService alloc] initWithBaseURL:[NSURL URLWithString: baseUrl]];
        sharedInstance.responseSerializer = [ClansJSONSerializer serializer];
    });
    
    return sharedInstance;
}


- (void)callService:(NSDictionary*)parameters withCompletionBlock:(void(^)(NSArray *resultArray, NSError *error))completionBlock {
    
    //Add request/response serializers and request header
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObject: httpContentTypeJson];
    
    //NSString *authStr = [NSString stringWithFormat:@"%@:%@", AuthUser, AuthPassword];
    //NSData *authData = [authStr dataUsingEncoding:NSUTF8StringEncoding];
    //NSString *authValue = [NSString stringWithFormat:@"Basic %@", [authData base64EncodedStringWithOptions:0]];
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
