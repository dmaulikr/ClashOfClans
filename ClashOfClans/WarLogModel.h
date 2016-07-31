//
//  WarLogModel.h
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/30/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WarLogModel : NSObject

//general
@property (nonatomic, strong) NSString *result;
@property (nonatomic, strong) NSString *endTime;
@property (nonatomic, strong) NSString *teamSize;

//clan
@property (nonatomic, strong) NSString *clanTag;
@property (nonatomic, strong) NSString *clanName;
@property (nonatomic, strong) NSURL *clanBadgeUrlsSmall;
@property (nonatomic, strong) NSURL *clanBadgeUrlsLarge;
@property (nonatomic, strong) NSURL *clanBadgeUrlsMedium;
@property (nonatomic, strong) NSString *clanClanLevel;
@property (nonatomic, strong) NSString *clanAttacks;
@property (nonatomic, strong) NSString *clanStars;
@property (nonatomic, strong) NSString *clanDestructionPercentage;
@property (nonatomic, strong) NSString *clanExpEarned;

//opponent
@property (nonatomic, strong) NSString *opponentTag;
@property (nonatomic, strong) NSString *opponentName;
@property (nonatomic, strong) NSURL *opponentBadgeUrlsSmall;
@property (nonatomic, strong) NSURL *opponentBadgeUrlsLarge;
@property (nonatomic, strong) NSURL *opponentBadgeUrlsMedium;
@property (nonatomic, strong) NSString *opponentClanLevel;
@property (nonatomic, strong) NSString *opponentStars;
@property (nonatomic, strong) NSString *opponentDestructionPercentage;


-(id) initWithDictionary:(NSDictionary *)dict;

@end
