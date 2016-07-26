//
//  MembersCell.m
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/23/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import "MembersCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation MembersCell
@synthesize xpIcon, xpLabel, memeberNameLabel, ligaIcon, trophiesLabel;

- (void)loadCellData:(MembersModel *)members {
    
    xpLabel.text = members.expLevel;
    
    [ligaIcon sd_setImageWithURL:members.leagueIconSmall
                placeholderImage:nil
                       completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                           //something after load
                       }];

    memeberNameLabel.text = members.name;
    trophiesLabel.text  = [NSString stringWithFormat:@" %@",members.trophies];
    trophiesLabel.layer.cornerRadius = 10;
    trophiesLabel.layer.masksToBounds = YES;
}

@end
