//
//  MembersDetailViewController.h
//  ClashOfClans
//
//  Created by Victor Roldan on 7/25/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "MembersModel.h"
#import "ClansModel.h"

@interface MembersDetailViewController : UIViewController

@property (strong, nonatomic) MembersModel *Member;
@property (strong, nonatomic) ClansModel *ClanInfo;

@property (weak, nonatomic) IBOutlet UILabel *leagueNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *trophiesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *leagueIcon;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tagLabel;
@property (weak, nonatomic) IBOutlet UIImageView *clanIcon;

@property (weak, nonatomic) IBOutlet UILabel *expLevelLabel;
@property (weak, nonatomic) IBOutlet UILabel *roleLabel;

@property (weak, nonatomic) IBOutlet UILabel *donationsLabel;
@property (weak, nonatomic) IBOutlet UILabel *donationsReceivedLabel;
@property (weak, nonatomic) IBOutlet UIView *BackgorundView;

@end
