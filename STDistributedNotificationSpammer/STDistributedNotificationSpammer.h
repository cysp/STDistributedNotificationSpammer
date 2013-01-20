//
//  STDistributedNotificationSpammer.h
//  STDistributedNotificationSpammer
//
//  Copyright (c) 2013 Scott Talbot. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface STDistributedNotificationSpammer : NSObject

- (id)initWithDistributedNotificationCenter:(NSDistributedNotificationCenter *)notificationCenter outputFileHandle:(NSFileHandle *)outputFileHandle;

@end
