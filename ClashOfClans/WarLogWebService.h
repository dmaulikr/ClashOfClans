//
//  WarLogWebService.h
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/30/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "Service.h"
#import "WarLogJSONSerializer.h"
@interface WarLogWebService : AFHTTPRequestOperationManager<Service>
+ (WarLogWebService *)getSharedInstance;
@end
