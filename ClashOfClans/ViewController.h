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
#import "LocationsWebService.h"
#import "LocationsModel.h"
#import "ClanByTagWebService.h"
#import "GLBHelper.h"

@interface ViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource, UIGestureRecognizerDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *clanName;
@property (weak, nonatomic) IBOutlet UITextField *locationId;
@property (weak, nonatomic) IBOutlet UITextField *minMembers;
@property (weak, nonatomic) IBOutlet UITextField *maxMembers;
@property (weak, nonatomic) IBOutlet UITextField *minClanPoints;
@property (weak, nonatomic) IBOutlet UITextField *minClanLevel;
@property (weak, nonatomic) IBOutlet UIPickerView *locationPicker;
@property (weak, nonatomic) IBOutlet UITextField *clanTag;



//@property ClansModel *clanList;
@property (nonatomic, strong) NSMutableArray *ClanList;

@property (nonatomic, strong) NSMutableArray *LocationsList;
@property (nonatomic, strong) NSMutableArray *Clan;
@property (nonatomic, strong) LocationsModel *LocationsListObjects;

@end

