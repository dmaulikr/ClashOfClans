//
//  MembersModel.h
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/23/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MembersModel : NSObject

@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *role;
@property (nonatomic, strong) NSString *expLevel;
@property (nonatomic, strong) NSString *leagueName;
@property (nonatomic, strong) NSString *leagueId;

@property (nonatomic, strong) NSURL *leagueIconSmall;
@property (nonatomic, strong) NSURL *leagueIconTiny;
@property (nonatomic, strong) NSURL *leagueIconMedium;

@property (nonatomic, strong) NSString *trophies;
@property (nonatomic, strong) NSString *clanRank;
@property (nonatomic, strong) NSString *previousClanRank;
@property (nonatomic, strong) NSString *donations;
@property (nonatomic, strong) NSString *donationsReceived;

-(id) initWithDictionary:(NSDictionary *)dict;

@end
