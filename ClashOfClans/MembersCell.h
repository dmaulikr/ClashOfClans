//
//  MembersCell.h
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/23/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MembersModel.h"

@interface MembersCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *xpIcon;
@property (weak, nonatomic) IBOutlet UILabel *xpLabel;
@property (weak, nonatomic) IBOutlet UIImageView *ligaIcon;
@property (weak, nonatomic) IBOutlet UILabel *memeberNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *trophiesLabel;
- (void)loadCellData:(MembersModel *)members;
@end
