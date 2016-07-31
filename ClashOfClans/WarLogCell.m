//
//  WarLogCell.m
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/31/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import "WarLogCell.h"
#import "WarLogModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
@implementation WarLogCell

@synthesize
resultLabel
,teamSizeLabel
,destructionPercentageLabel
,clanStarsLabel
//clan
,clanTagLabel
,clanNameLabel
,clanBadgeMediumImage
,clanLevelLabel
,clanExpEarnedLabel
//opponent
,opponentTagLabel
,opponentNameLabel
,opponentBadgeMediumImage
,opponentClanLevelLabel;


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


//- (void)loadCellData:(WarLogModel *)warLogList;

- (void)loadCellData:(WarLogModel *)WarLog {
    
    
    if([WarLog.result isEqualToString:@"lose"]){
        resultLabel.text = @"Derrota";
    }else{
        resultLabel.text = @"Victoria";
    }
    
    
    
    clanStarsLabel.text = [NSString stringWithFormat:@"%@ - %@",WarLog.clanStars, WarLog.opponentStars];
    destructionPercentageLabel.text = [NSString stringWithFormat:@"%@ - %@",WarLog.clanDestructionPercentage, WarLog.opponentDestructionPercentage];
    
    teamSizeLabel.text = [NSString stringWithFormat:@"%@ contra %@",WarLog.teamSize, WarLog.teamSize];
    
    if([WarLog.result isEqualToString:@"lose"]){
        [resultLabel setTextColor:[UIColor redColor]];
    }else{
        [resultLabel setTextColor:[UIColor greenColor]];
    }
    //clan
    clanTagLabel.text = WarLog.clanTag;
    clanNameLabel.text = WarLog.clanName;
    clanLevelLabel.text = WarLog.clanClanLevel;
    clanExpEarnedLabel.text = [NSString stringWithFormat:@"+%@",WarLog.clanExpEarned];
    [clanBadgeMediumImage sd_setImageWithURL:WarLog.clanBadgeUrlsMedium
                                placeholderImage:nil
                                       completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                           //something after load
                                       }];
    
    
    //opponent
    opponentNameLabel.text = WarLog.opponentName;
    opponentTagLabel.text = WarLog.opponentTag;
    opponentClanLevelLabel.text = WarLog.opponentClanLevel;
    
    [opponentBadgeMediumImage sd_setImageWithURL:WarLog.opponentBadgeUrlsMedium
                placeholderImage:nil
                       completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                           //something after load
                       }];
    
}
@end
