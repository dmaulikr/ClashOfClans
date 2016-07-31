//
//  clanDetails.m
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/23/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import "clanDetailsViewController.h"
#import "MembersCell.h"
#import <KVNProgress/KVNProgress.h>
#import "GLBHelper.h"

@interface clanDetailsViewController (){
    MembersWebService *memberWebService;
    
}
@end

@implementation clanDetailsViewController
@synthesize Clan, clanPointsLabel, warWinsLabel, warWinStreakLabel, membersLabel
, typeLabel, requiredTrophiesLabel, warFrequencyLabel, locationNameLabel
, clanNameLabel, clanIcon, clanLevelLabel, MembersList, membersTableView, ClanDetails, MembersSelected, clanTagLabel;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    memberWebService = [MembersWebService getSharedInstance];
    MembersList = [[NSMutableArray alloc] init];
    [membersTableView setSeparatorColor:[UIColor colorWithRed:0.35 green:0.35 blue:0.35 alpha:1.0]];
    
    [self loadClanDetails];
    [self callMembers];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadClanDetails{
    clanNameLabel.text      = [Clan.clanName uppercaseString];
    clanPointsLabel.text    = Clan.clanPoints;
    warWinsLabel.text       = Clan.warWins;
    membersLabel.text       = Clan.members;
    typeLabel.text          = Clan.clanType;
    requiredTrophiesLabel.text = Clan.requiredTrophies;
    warFrequencyLabel.text  = Clan.warFrequency;
    locationNameLabel.text  = Clan.locationCountry;
    warWinStreakLabel.text  = Clan.warWinStreak;
    clanLevelLabel.text     = Clan.clanLevel;
    clanTagLabel.text       = Clan.clanTag;
    
    [clanIcon sd_setImageWithURL:Clan.badgeUrlsSmall
                                  placeholderImage:nil
                                         completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                             clanLevelLabel.hidden = NO;
                                         }];
}

- (void)callMembers{
    [KVNProgress showWithStatus:@"Cargando Miembros del Clan" onView:_membersView];
    
    NSDictionary *parameters = [[NSDictionary alloc] init];
    parameters = @{@"memberTag":Clan.clanTag};
    
    [memberWebService callService:parameters withCompletionBlock:^(NSArray *resultArray, NSError *error) {
        [KVNProgress dismiss];
        if(error){
            [GLBHelper displayAlertMessage:[error localizedDescription] message:@"Error consulta"];
        }else{
            for (NSDictionary *result2 in resultArray) {
                [MembersList addObject:result2];
            }
            [membersTableView reloadData];
        }
    }];
}


- (IBAction)showWarLog:(id)sender {
    [self performSegueWithIdentifier:@"WarLogSegue" sender:self];
}


#pragma mark - UITableView Delegate & Source methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [MembersList count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    
    cell = (MembersCell*) [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (cell == nil) {
        
        cell = [[MembersCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    [(MembersCell*)cell loadCellData:[MembersList objectAtIndex:indexPath.row]];
    [GLBHelper BackgroundColorCell:cell];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MembersSelected = [MembersList objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"MemberDetailSegue" sender:self];
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"MemberDetailSegue"]) {
        MembersDetailViewController *destination = (MembersDetailViewController*) segue.destinationViewController;
        destination.Member = (MembersModel*)MembersSelected;
        destination.ClanInfo = Clan;
    }else if ([segue.identifier isEqualToString:@"WarLogSegue"]) {
        WarLogViewController *destination2 = (WarLogViewController*) segue.destinationViewController;
        destination2.clanTagSelected = Clan.clanTag;
        
    }
        
    
}

@end
