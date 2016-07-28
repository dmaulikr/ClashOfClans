//
//  LocationsModel.h
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/27/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LocationsModel : NSObject

@property (nonatomic, strong) NSString *_id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *isCountry;
@property (nonatomic, strong) NSString *countryCode;

-(id) initWithDictionary:(NSDictionary *)dict;

@end
