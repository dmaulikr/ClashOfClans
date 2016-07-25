//
//  ClansModel.m
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/23/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import "ClansModel.h"

@implementation ClansModel

@synthesize locationCountry,locationCountryCode,clanType, clanName,
clanTag,clanLevel,clanPoints,requiredTrophies,warFrequency
,warWinStreak,warWins,warTies,warLosses,isWarLogPublic
,members,badgeUrlsSmall,badgeUrlsLarge,badgeUrlsMedium;

-(id) initWithDictionary:(NSDictionary *)dict{
    self.locationCountry = [dict valueForKey:@"location"][@"name"];
    self.locationCountryCode = [dict valueForKey:@"location"][@"countryCode"];
    
    self.clanType = [dict valueForKey:@"type"];
    self.clanName = [dict valueForKey:@"name"];
    self.clanTag = [dict valueForKey:@"tag"];
    self.clanLevel = [NSString stringWithFormat:@"%@",[dict valueForKey:@"clanLevel"]];
    self.clanPoints = [NSString stringWithFormat:@"%@",[dict valueForKey:@"clanPoints"]];
    self.requiredTrophies = [NSString stringWithFormat:@"%@",[dict valueForKey:@"requiredTrophies"]];
    self.warFrequency = [dict valueForKey:@"warFrequency"];
    self.warWinStreak = [NSString stringWithFormat:@"%@",[dict valueForKey:@"warWinStreak"]];
    self.warWins = [NSString stringWithFormat:@"%@",[dict valueForKey:@"warWins"]];
    self.warTies = [NSString stringWithFormat:@"%@",[dict valueForKey:@"warTies"]];
    self.warLosses = [NSString stringWithFormat:@"%@",[dict valueForKey:@"warLosses"]];
    self.isWarLogPublic = [NSString stringWithFormat:@"%@",[dict valueForKey:@"isWarLogPublic"]];
    self.members = [NSString stringWithFormat:@"%@",[dict valueForKey:@"members"]];
    
    //self.imageLink = [NSURL URLWithString:dict[@"attributes"][@"image_url"]];
    
    self.badgeUrlsMedium = [NSURL URLWithString:[dict valueForKey:@"badgeUrls"][@"large"]];
    self.badgeUrlsLarge = [dict valueForKey:@"badgeUrls"][@"large"];
    self.badgeUrlsSmall = [dict valueForKey:@"badgeUrls"][@"small"];
    
    return self;
}

@end
