//
//  ViewController.m
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/23/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import "ViewController.h"
#import "clanDetailsViewController.h"
#import "MembersCell.h"

@interface ViewController (){
    ClansWebService *clanWebService;
    ClansListWebService *clansListWebService;
}


@end

@implementation ViewController
@synthesize clanName, ClanList;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    clanWebService = [ClansWebService getSharedInstance];
    clansListWebService = [ClansListWebService getSharedInstance];
    
    ClanList = [[NSMutableArray alloc] init];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchClan:(id)sender {
    NSLog(@"buscar clan");
  
    NSDictionary *parameters = [[NSDictionary alloc] init];
    NSLog(@"string: %@", self.clanName.text);
    parameters = @{@"name":self.clanName.text};
    ClanList = [[NSMutableArray alloc] init];
    [clansListWebService callService:parameters withCompletionBlock:^(NSArray *resultArray, NSError *error) {
        if(error){
            [self showMessage:[error localizedDescription] withTitle:@"Error consulta"];
            //[[[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
            
        }else{
            //[GLBHelper hideActivityIndicator];
            //clanList = [[NSMutableArray alloc] initWithArray: resultArray];
            
            for (NSDictionary *result2 in resultArray) {
                [ClanList addObject:result2];
            }
            
            //clanList = (ClansModel*) [resultArray objectAtIndex:0];
            
            [self performSegueWithIdentifier:@"ClanListSegue" sender:self];
            
            NSLog(@"%@", ClanList);
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

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // TODO: Change current event for selected date in calendar
    
    if ([segue.identifier isEqualToString:@"ClanListSegue"]) {
        ClansListViewController *destination = (ClansListViewController*) segue.destinationViewController;
        destination.ClanList = ClanList;
    }
    
}

@end
