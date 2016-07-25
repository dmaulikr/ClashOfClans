//
//  ClansListViewController.h
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/24/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClansListWebService.h"
#import "ClansModel.h"
#import "ClansListCell.h"

@interface ClansListViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *ClanList;
@property (nonatomic, strong) NSMutableArray *ClanSelected;
@property (strong, nonatomic) IBOutlet UITableView *ClansTableView;
@property (strong, nonatomic) NSString *ClanNameTagSearch;
@end
