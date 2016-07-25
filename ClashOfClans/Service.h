//
//  Service.h
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/23/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Service <NSObject>

- (void)callService:(NSDictionary*)parameters withCompletionBlock:(void(^)(NSArray *resultArray, NSError *error))completionBlock;

@end
