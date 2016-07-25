//
//  MembersWebService.h
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/23/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "Service.h"

@interface MembersWebService : AFHTTPRequestOperationManager<Service>
+ (MembersWebService *)getSharedInstance;
@end
