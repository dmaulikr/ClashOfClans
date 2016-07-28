//
//  LocationsModel.m
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/27/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import "LocationsModel.h"

@implementation LocationsModel
@synthesize _id,name,isCountry,countryCode;

-(id) initWithDictionary:(NSDictionary *)dict{
    self._id = [NSString stringWithFormat:@"%@",[dict valueForKey:@"id"]];
    self.name = [dict valueForKey:@"name"];
    self.isCountry = [NSString stringWithFormat:@"%@",[dict valueForKey:@"isCountry"]];
    self.countryCode = [dict valueForKey:@"countryCode"];
    
    return self;
}

@end
