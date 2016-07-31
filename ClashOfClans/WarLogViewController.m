//
//  WarLogViewController.m
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/30/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import "WarLogViewController.h"
#import <KVNProgress/KVNProgress.h>
#import "GLBHelper.h"

@interface WarLogViewController (){
    WarLogWebService *warLogWebService;
}

@end

@implementation WarLogViewController
@synthesize clanTagSelected, warLogList, WarLogTableView, SinResultadosLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    warLogWebService = [WarLogWebService getSharedInstance];
    warLogList = [[NSMutableArray alloc] init];
    self.automaticallyAdjustsScrollViewInsets = NO;

    [WarLogTableView setSeparatorColor:[UIColor colorWithRed:0.35 green:0.35 blue:0.35 alpha:1.0]];
    [self searchClanLog];
    NSLog(@"clanTag: %@", clanTagSelected);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)searchClanLog{
    [KVNProgress showWithStatus:@"Cargando..."];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    
    [parameters setObject:clanTagSelected forKey:@"clanTag"];
    
    [warLogWebService callService:parameters withCompletionBlock:^(NSArray *resultArray, NSError *error) {
        [KVNProgress dismiss];
        if(error){
            [SinResultadosLabel setHidden:NO];
            [GLBHelper displayAlertMessage:[error localizedDescription] message:@"Error consulta"];
        }else{
            if([resultArray count]>0){
                [SinResultadosLabel setHidden:YES];
                for (NSDictionary *result2 in resultArray) {
                    [warLogList addObject:result2];
                }
                [WarLogTableView reloadData];
                
            }else{
                [SinResultadosLabel setHidden:NO];
            }
        }
    }];
    
}


#pragma mark - UITableView Delegate & Source methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [warLogList count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    
    cell = (WarLogCell*) [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[WarLogCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    [(WarLogCell*)cell loadCellData:(WarLogModel*)[warLogList objectAtIndex:indexPath.row]];
    [GLBHelper BackgroundColorCell:cell];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
