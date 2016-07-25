//
//  ClansListCell.h
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/24/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClansModel.h"

@interface ClansListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *clanLogo;
@property (weak, nonatomic) IBOutlet UIImageView *clanTrophyIcon;
@property (weak, nonatomic) IBOutlet UILabel *clanTrophyLabel;
@property (weak, nonatomic) IBOutlet UILabel *clanNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *clanType;

- (void)loadCellData:(ClansModel *)clans;

@end
