//
//  MembersDetailViewController.m
//  ClashOfClans
//
//  Created by Victor Roldan on 7/25/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import "MembersDetailViewController.h"
#import "SABlurImageView.h"
#import "UIImage+BlurEffect.h"
#import <Accelerate/Accelerate.h>
#import <QuartzCore/QuartzCore.h>

@interface MembersDetailViewController ()

@end

@implementation MembersDetailViewController
@synthesize Member,leagueNameLabel,trophiesLabel,leagueIcon
,nameLabel,tagLabel,clanIcon,expLevelLabel,roleLabel
,donationsLabel,donationsReceivedLabel, ClanInfo, clanNameLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadMemberSelected];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadMemberSelected{
    leagueNameLabel.text = Member.leagueName;
    trophiesLabel.text = Member.trophies;
    nameLabel.text = Member.name;
    tagLabel.text = Member.tag;
    expLevelLabel.text = Member.expLevel;
    roleLabel.text = Member.role;
    donationsLabel.text = Member.donations;
    donationsReceivedLabel.text = Member.donationsReceived;
    clanNameLabel.text = ClanInfo.clanName;
    
    [leagueIcon sd_setImageWithURL:Member.leagueIconMedium
                placeholderImage:nil
                       completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                           //something after load
                       }];
    
    [clanIcon sd_setImageWithURL:ClanInfo.badgeUrlsMedium
                  placeholderImage:nil
                         completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                             //something after load
                             
                         }];
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
