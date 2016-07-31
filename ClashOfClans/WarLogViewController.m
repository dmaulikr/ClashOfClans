//
//  WarLogViewController.m
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/30/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import "WarLogViewController.h"

@interface WarLogViewController (){
    WarLogWebService *warLogWebService;
}

@end

@implementation WarLogViewController
@synthesize clanTagSelected, warLogList, WarLogTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    warLogWebService = [WarLogWebService getSharedInstance];
    
    [self searchClanLog];
    NSLog(@"clanTag: %@", clanTagSelected);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)searchClanLog{
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    
    [parameters setObject:clanTagSelected forKey:@"clanTag"];
    
    warLogList = [[NSMutableArray alloc] init];
    [warLogWebService callService:parameters withCompletionBlock:^(NSArray *resultArray, NSError *error) {
        if(error){
            [self showMessage:[error localizedDescription] withTitle:@"Error consulta"];
            
        }else{
            if([resultArray count]>0){
                for (NSDictionary *result2 in resultArray) {
                    [warLogList addObject:result2];
                }
                [WarLogTableView reloadData];
                
            }else{
                [self showMessage:@"No existe el clan ingresado" withTitle:@"Consulta"];
            }
        }
    }];
    
}

-(void)showMessage:(NSString*)message withTitle:(NSString *)title
{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:title
                                  message:message
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        //do something when click button
    }];
    [alert addAction:okAction];
    UIViewController *vc = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [vc presentViewController:alert animated:YES completion:nil];
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
