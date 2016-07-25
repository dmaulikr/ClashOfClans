//
//  ClansListWebService.h
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/24/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "Service.h"

@interface ClansListWebService : AFHTTPRequestOperationManager<Service>
+ (ClansListWebService *)getSharedInstance;
@end
