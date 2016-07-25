//
//  ViewController.h
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/23/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClansWebService.h"
#import "ClansModel.h"
#import "GLBDefinitions.h"
#import "ClansListViewController.h"
#import "ClansListWebService.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *clanName;
//@property ClansModel *clanList;
@property (nonatomic, strong) NSMutableArray *ClanList;
@end

