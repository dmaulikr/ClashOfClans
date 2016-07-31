//
//  ClansModel.h
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/23/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ClansModel : NSObject

@property (nonatomic, strong) NSString *locationCountry;
@property (nonatomic, strong) NSString *locationCountryCode;
@property (nonatomic, strong) NSString *clanType;
@property (nonatomic, strong) NSString *clanName;
@property (nonatomic, strong) NSString *clanTag;
@property (nonatomic, strong) NSString *clanLevel;
@property (nonatomic, strong) NSString *clanPoints;
@property (nonatomic, strong) NSString *requiredTrophies;
@property (nonatomic, strong) NSString *warFrequency;
@property (nonatomic, strong) NSString *warWinStreak;
@property (nonatomic, strong) NSString *warWins;
@property (nonatomic, strong) NSString *warTies;
@property (nonatomic, strong) NSString *warLosses;
@property (nonatomic, strong) NSString *isWarLogPublic;
@property (nonatomic, strong) NSString *members;
@property (nonatomic, strong) NSURL * badgeUrlsSmall;
@property (nonatomic, strong) NSURL * badgeUrlsLarge;
@property (nonatomic, strong) NSURL * badgeUrlsMedium;



-(id) initWithDictionary:(NSDictionary *)dict;

@end
