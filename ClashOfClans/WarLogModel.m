//
//  WarLogModel.m
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/30/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import "WarLogModel.h"


@implementation WarLogModel
@synthesize result,endTime,teamSize
//clan
,clanTag
,clanName,clanBadgeUrlsSmall,clanBadgeUrlsLarge,clanBadgeUrlsMedium
,clanClanLevel,clanAttacks,clanStars,clanDestructionPercentage,clanExpEarned
//opponent
,opponentTag,opponentName,opponentBadgeUrlsSmall,opponentBadgeUrlsLarge,opponentBadgeUrlsMedium
,opponentClanLevel,opponentStars,opponentDestructionPercentage;


-(id) initWithDictionary:(NSDictionary *)dict{
    self.result = [dict valueForKey:@"result"];
    self.endTime = [dict valueForKey:@"endTime"];
    self.teamSize = [dict valueForKey:@"teamSize"];
    
    //clan
    self.clanTag = [dict valueForKey:@"clan"][@"tag"];
    self.clanName = [dict valueForKey:@"clan"][@"name"];
    self.clanBadgeUrlsSmall = [NSURL URLWithString:[dict valueForKey:@"clan"][@"badgeUrls"][@"small"]];
    self.clanBadgeUrlsLarge = [NSURL URLWithString:[dict valueForKey:@"clan"][@"badgeUrls"][@"large"]];
    self.clanBadgeUrlsMedium = [NSURL URLWithString:[dict valueForKey:@"clan"][@"badgeUrls"][@"medium"]];
    self.clanClanLevel = [NSString stringWithFormat:@"%@",[dict valueForKey:@"clan"][@"clanLevel"]];
    self.clanAttacks = [NSString stringWithFormat:@"%@",[dict valueForKey:@"clan"][@"attacks"]];
    self.clanStars = [NSString stringWithFormat:@"%@",[dict valueForKey:@"clan"][@"stars"]];
    
    NSString* clanDestruction = [NSString stringWithFormat:@"%.02f", [[dict valueForKey:@"clan"][@"destructionPercentage"] floatValue]];

    self.clanDestructionPercentage = clanDestruction;
    self.clanExpEarned = [NSString stringWithFormat:@"%@",[dict valueForKey:@"clan"][@"expEarned"]];
    
    
    
    
    //opponent
    self.opponentTag = [dict valueForKey:@"opponent"][@"tag"];
    self.opponentName = [dict valueForKey:@"opponent"][@"name"];
    self.opponentBadgeUrlsSmall = [NSURL URLWithString:[dict valueForKey:@"opponent"][@"badgeUrls"][@"small"]];
    self.opponentBadgeUrlsLarge = [NSURL URLWithString:[dict valueForKey:@"opponent"][@"badgeUrls"][@"large"]];
    self.opponentBadgeUrlsMedium = [NSURL URLWithString:[dict valueForKey:@"opponent"][@"badgeUrls"][@"medium"]];
    self.opponentClanLevel = [NSString stringWithFormat:@"%@",[dict valueForKey:@"opponent"][@"clanLevel"]];
    self.opponentStars = [NSString stringWithFormat:@"%@",[dict valueForKey:@"opponent"][@"stars"]];
    
    NSString* opponentDestruction = [NSString stringWithFormat:@"%.02f", [[dict valueForKey:@"opponent"][@"destructionPercentage"] floatValue]];
    self.opponentDestructionPercentage = opponentDestruction;

    
    return self;
}

@end
