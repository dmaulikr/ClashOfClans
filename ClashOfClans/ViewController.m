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
    LocationsWebService *locationsWebService;
    NSString *LocationSelected;
}


@end

@implementation ViewController
@synthesize clanName, ClanList, locationId,minMembers, maxMembers, minClanPoints, minClanLevel, LocationsList, LocationsListObjects;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    clanWebService = [ClansWebService getSharedInstance];
    clansListWebService = [ClansListWebService getSharedInstance];
    locationsWebService = [LocationsWebService getSharedInstance];
    
    ClanList = [[NSMutableArray alloc] init];
    [self loadLocations];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchClan:(id)sender {
    NSLog(@"buscar clan");
  
    if(clanName.text.length <3){
        return [self showMessage:@"La búsqueda debe contener mínimo 3 caracters." withTitle:@"Error de validación"];
    }
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    
    [parameters setObject:clanName.text forKey:@"name"];
    
    if(![locationId.text isEqualToString:@""]){
        [parameters setObject:locationId.text forKey:@"locationId"];
    }
    if(![minMembers.text isEqualToString:@""]){
        [parameters setObject:minMembers.text forKey:@"minMembers"];
    }
    if(![maxMembers.text isEqualToString:@""]){
        [parameters setObject:maxMembers.text forKey:@"maxMembers"];
    }
    if(![minClanPoints.text isEqualToString:@""]){
        [parameters setObject:minClanPoints.text forKey:@"minClanPoints"];
    }
    if(![minClanLevel.text isEqualToString:@""]){
        [parameters setObject:minClanLevel.text forKey:@"minClanLevel"];
    }
    if(![minMembers.text isEqualToString:@""]){
        [parameters setObject:minMembers.text forKey:@"minMembers"];
    }
    
    ClanList = [[NSMutableArray alloc] init];
    [clansListWebService callService:parameters withCompletionBlock:^(NSArray *resultArray, NSError *error) {
        if(error){
            [self showMessage:[error localizedDescription] withTitle:@"Error consulta"];
            
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

-(void)loadLocations{
    
    LocationsList = [[NSMutableArray alloc] init];
    [locationsWebService callService:nil withCompletionBlock:^(NSArray *resultArray, NSError *error) {
        if(error){
            [self showMessage:[error localizedDescription] withTitle:@"Error consulta"];
            
        }else{
            //[GLBHelper hideActivityIndicator];
            //clanList = [[NSMutableArray alloc] initWithArray: resultArray];
            
            for (NSDictionary *result2 in resultArray) {
                //NSLog(@"%@", result2[@"name"]);
                [LocationsList addObject:result2];
            }
            [_locationPicker reloadAllComponents];
            LocationsListObjects = (LocationsModel*)LocationsList;
            for(LocationsModel *locations in LocationsList){
                NSLog(@"%@->%@", locations._id, locations.name);
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

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // TODO: Change current event for selected date in calendar
    
    if ([segue.identifier isEqualToString:@"ClanListSegue"]) {
        ClansListViewController *destination = (ClansListViewController*) segue.destinationViewController;
        destination.ClanList = ClanList;
    }
    
}


// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [LocationsList count];
}
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    LocationsListObjects = [LocationsList objectAtIndex:row];
    return LocationsListObjects.name;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    LocationsListObjects = [LocationsList objectAtIndex:row];
    NSLog(@"selección: %@=%@", LocationsListObjects._id, LocationsListObjects.name);
    LocationSelected = LocationsListObjects._id;
    locationId.text = LocationSelected;
}





@end
