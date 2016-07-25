//
//  ClansListCell.m
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/24/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import "ClansListCell.h"
#import "ClansModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
@implementation ClansListCell
@synthesize
clanLogo,
clanTrophyIcon,
clanTrophyLabel,
clanNameLabel,
clanType;

- (void)loadCellData:(ClansModel *)clans {
    
    
    clanTrophyLabel.text = [NSString stringWithFormat:@"  %@",clans.clanPoints];
    clanNameLabel.text = clans.clanName;
    
    [clanLogo sd_setImageWithURL:clans.badgeUrlsMedium
                placeholderImage:nil
                       completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                           //something after load
                       }];
    
    clanType.text = clans.clanType;
    
    
}

@end
