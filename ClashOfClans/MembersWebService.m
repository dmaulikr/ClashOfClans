//
//  MembersWebService.m
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/23/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MembersWebService.h"
#import "MembersJSONSerializer.h"
#import "GLBDefinitions.h"


@implementation MembersWebService

+ (MembersWebService*)getSharedInstance {
    static MembersWebService *sharedInstance = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        sharedInstance = [[MembersWebService alloc] initWithBaseURL:[NSURL URLWithString: baseUrl]];
        sharedInstance.responseSerializer = [MembersJSONSerializer serializer];
    });
    
    return sharedInstance;
}


- (void)callService:(NSDictionary*)parameters withCompletionBlock:(void(^)(NSArray *resultArray, NSError *error))completionBlock {
    
    //Add request/response serializers and request header
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObject: httpContentTypeJson];
    
    [self.requestSerializer setValue:AuthPassword forHTTPHeaderField:AuthUser];
    NSString *str = parameters[@"memberTag"];
    
    NSString *unescaped = str;
    NSString *escapedString = [unescaped stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    
    NSString *urlRequest = [NSString stringWithFormat:clansMembersUrl, escapedString];
    
    //Send Request
    [self GET:urlRequest parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completionBlock(responseObject, nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completionBlock(operation.responseObject, error);
    }];
    
}

@end
