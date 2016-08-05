//
//  ServiceLayerFacade.h
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/23/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Service.h"
#import "ClansWebService.h"
#import "MembersWebService.h"
#import "ClansListWebService.h"
#import "LocationsWebService.h"
#import "ClanByTagWebService.h"
#import "WarLogWebService.h"

@interface ServiceLayerFacade : NSObject

+ (ServiceLayerFacade*)getSharedInstance;

- (id<Service>)getClans;
- (id<Service>)getMembers;
- (id<Service>)getLocations;
- (id<Service>)getClanInfo;
- (id<Service>)getWarLog;

@end
