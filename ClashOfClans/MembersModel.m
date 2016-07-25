//
//  MembersModel.m
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/23/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import "MembersModel.h"

@implementation MembersModel
@synthesize
tag,name,role,expLevel,leagueName
,leagueId,leagueIconSmall,leagueIconTiny
,leagueIconMedium,trophies,clanRank,previousClanRank
,donations,donationsReceived;

-(id) initWithDictionary:(NSDictionary *)dict{
  
    self.tag = [dict valueForKey:@"tag"];
    self.name = [dict valueForKey:@"name"];
    self.role = [dict valueForKey:@"role"];
    self.expLevel = [NSString stringWithFormat:@"%@",[dict valueForKey:@"expLevel"] ];
    self.leagueName = [dict valueForKey:@"league"][@"name"];
    self.leagueId = [NSString stringWithFormat:@"%@",[dict valueForKey:@"league"][@"id"]];
    
    self.leagueIconTiny = [NSURL URLWithString:[dict valueForKey:@"league"][@"iconUrls"][@"tiny"]];
    self.leagueIconSmall = [NSURL URLWithString:[dict valueForKey:@"league"][@"iconUrls"][@"small"]];
    self.leagueIconMedium = [NSURL URLWithString:[dict valueForKey:@"league"][@"iconUrls"][@"medium"]];
    
    self.trophies = [NSString stringWithFormat:@"%@",[dict valueForKey:@"trophies"]];
    self.clanRank = [NSString stringWithFormat:@"%@",[dict valueForKey:@"clanRank"]];
    self.previousClanRank = [NSString stringWithFormat:@"%@",[dict valueForKey:@"previousClanRank"]];
    self.donations = [NSString stringWithFormat:@"%@",[dict valueForKey:@"donations"]];
    self.donationsReceived = [NSString stringWithFormat:@"%@",[dict valueForKey:@"donationsReceived"]];
    
    return self;
}
@end
