//
//  GLBHelper.m
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/31/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import "GLBHelper.h"

@implementation GLBHelper

+ (void) displayAlertMessage:(NSString*)title message:(NSString*)message {
    
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


@end
