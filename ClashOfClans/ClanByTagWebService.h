//
//  ClanByTagWebService.h
//  ClashOfClans
//
//  Created by Victor Roldan on 7/29/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "Service.h"
@interface ClanByTagWebService : AFHTTPRequestOperationManager<Service>
+ (ClanByTagWebService *)getSharedInstance;
@end
