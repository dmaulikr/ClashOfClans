//
//  ClansListViewController.m
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/24/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import "ClansListViewController.h"
#import "clanDetailsViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ClansListViewController (){
    
}
@end

@implementation ClansListViewController
@synthesize ClanList, ClansTableView, ClanSelected, ClanNameTagSearch;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [ClansTableView setSeparatorColor:[UIColor colorWithRed:0.35 green:0.35 blue:0.35 alpha:1.0]];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegate & Source methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [ClanList count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    
    cell = (ClansListCell*) [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (cell == nil) {
        
        cell = [[ClansListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    [(ClansListCell*)cell loadCellData:[ClanList objectAtIndex:indexPath.row]];
    
    [GLBHelper BackgroundColorCell:cell];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    ClanSelected = [ClanList objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"ClanDetailsSegue" sender:self];
}


-(NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section   {
    
    NSString *message = @"";
    NSInteger numberOfRowsInSection = [self tableView:ClansTableView numberOfRowsInSection:section ];
    
    if (numberOfRowsInSection == 0) {
        message = @"Sin Resultados";
    }
    
    return message;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"ClanListSegue"]) {
        ClansListViewController *destination = (ClansListViewController*) segue.destinationViewController;
        destination.ClanList = ClanList;
    }else if([segue.identifier isEqualToString:@"ClanDetailsSegue"]){
        clanDetailsViewController *destination = (clanDetailsViewController*) segue.destinationViewController;
        destination.Clan = (ClansModel*)ClanSelected;
    }
    
}



@end
