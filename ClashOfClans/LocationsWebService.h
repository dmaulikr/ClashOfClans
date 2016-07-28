//
//  LocationsWebService.h
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/27/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "Service.h"
@interface LocationsWebService : AFHTTPRequestOperationManager<Service>
+ (LocationsWebService *)getSharedInstance;
@end
