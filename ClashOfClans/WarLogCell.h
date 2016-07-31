//
//  WarLogCell.h
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/31/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WarLogModel.h"

@interface WarLogCell : UITableViewCell

//general
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *teamSizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *destructionPercentageLabel;
@property (weak, nonatomic) IBOutlet UILabel *clanStarsLabel;

//clan
@property (weak, nonatomic) IBOutlet UILabel *clanTagLabel;
@property (weak, nonatomic) IBOutlet UILabel *clanNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *clanBadgeMediumImage;
@property (weak, nonatomic) IBOutlet UILabel *clanLevelLabel;
@property (weak, nonatomic) IBOutlet UILabel *clanExpEarnedLabel;


//opponent
@property (weak, nonatomic) IBOutlet UILabel *opponentTagLabel;
@property (weak, nonatomic) IBOutlet UILabel *opponentNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *opponentBadgeMediumImage;
@property (weak, nonatomic) IBOutlet UILabel *opponentClanLevelLabel;

- (void)loadCellData:(WarLogModel *)WarLog;

@end
