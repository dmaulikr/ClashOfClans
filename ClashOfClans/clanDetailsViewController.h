//
//  clanDetails.h
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/23/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClansModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "MembersWebService.h"
#import "MembersModel.h"
#import "GLBDefinitions.h"



@interface clanDetailsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet UILabel *clanPointsLabel;

@property (weak, nonatomic) IBOutlet UILabel *warWinsLabel;

@property (weak, nonatomic) IBOutlet UILabel * warWinStreakLabel;
@property (weak, nonatomic) IBOutlet UILabel * membersLabel;
@property (weak, nonatomic) IBOutlet UILabel * typeLabel;
@property (weak, nonatomic) IBOutlet UILabel * requiredTrophiesLabel;
@property (weak, nonatomic) IBOutlet UILabel * warFrequencyLabel;

@property (weak, nonatomic) IBOutlet UILabel * locationNameLabel;
@property (weak, nonatomic) IBOutlet UILabel * clanNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *clanIcon;
@property (weak, nonatomic) IBOutlet UILabel *clanLevelLabel;

@property (strong, nonatomic) ClansModel *Clan;
@property (nonatomic, strong) NSMutableArray *MembersList;
@property (nonatomic, strong) NSMutableArray *ClanList;
@property (nonatomic, strong) NSMutableArray *ClanDetails;


@property (weak, nonatomic) IBOutlet UITableView *membersTableView;

@end
