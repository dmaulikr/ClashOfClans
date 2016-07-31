//
//  WarLogViewController.h
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/30/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import "ViewController.h"
#import "WarLogModel.h"
#import "WarLogCell.h"
#import "WarLogWebService.h"

@interface WarLogViewController : ViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSString *clanTagSelected;
@property (nonatomic, strong) NSMutableArray *warLogList;
@property (weak, nonatomic) IBOutlet UITableView *WarLogTableView;

@end
