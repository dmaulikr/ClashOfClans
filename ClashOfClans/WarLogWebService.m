//
//  WarLogWebService.m
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/30/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//




//#import "MembersJSONSerializer.h"

#import <Foundation/Foundation.h>
#import "WarLogWebService.h"
#import "WarLogWebService.h"
#import "GLBDefinitions.h"

@implementation WarLogWebService

+ (WarLogWebService*)getSharedInstance {
    static WarLogWebService *sharedInstance = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        sharedInstance = [[WarLogWebService alloc] initWithBaseURL:[NSURL URLWithString: baseUrl]];
        sharedInstance.responseSerializer = [WarLogJSONSerializer serializer];
    });
    
    return sharedInstance;
}


- (void)callService:(NSDictionary*)parameters withCompletionBlock:(void(^)(NSArray *resultArray, NSError *error))completionBlock {
    
    //Add request/response serializers and request header
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObject: httpContentTypeJson];
    
    [self.requestSerializer setValue:AuthPassword forHTTPHeaderField:AuthUser];
    NSString *str = parameters[@"clanTag"];
    
    NSString *unescaped = str;
    NSString *escapedString = [unescaped stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    
    NSString *urlRequest = [NSString stringWithFormat:clansWarLogUrl, escapedString];
    
    //Send Request
    [self GET:urlRequest parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completionBlock(responseObject, nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completionBlock(operation.responseObject, error);
    }];
    
}
@end
