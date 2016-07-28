//
//  ServiceLayerFacade.m
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/23/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import "ServiceLayerFacade.h"

@implementation ServiceLayerFacade

+ (ServiceLayerFacade*)getSharedInstance {
    static ServiceLayerFacade *sharedInstance = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        sharedInstance = [[ServiceLayerFacade alloc] init];
    });
    
    return sharedInstance;
}

- (id<Service>)getClans {
    return [ClansListWebService getSharedInstance];
}
- (id<Service>)getMembers {
    return [MembersWebService getSharedInstance];
}

- (id<Service>)getLocations {
    return [LocationsWebService getSharedInstance];
}
@end
