//
//  main.m
//  STDistributedNotificationSpammer
//
//  Copyright (c) 2013 Scott Talbot. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "STDistributedNotificationSpammer.h"


int main(int argc, const char * argv[]) {
	@autoreleasepool {
		NSFileHandle * const stdoutFileHandle = [NSFileHandle fileHandleWithStandardOutput];

		NSDistributedNotificationCenter * const dnc = [NSDistributedNotificationCenter defaultCenter];
		STDistributedNotificationSpammer * const logger = [[STDistributedNotificationSpammer alloc] initWithDistributedNotificationCenter:dnc outputFileHandle:stdoutFileHandle];

		[[NSRunLoop mainRunLoop] runUntilDate:[NSDate distantFuture]];

		(void)logger;
	}
    return 0;
}
