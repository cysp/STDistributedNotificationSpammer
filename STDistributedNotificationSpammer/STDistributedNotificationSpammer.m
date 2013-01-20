//
//  STDistributedNotificationSpammer.m
//  STDistributedNotificationSpammer
//
//  Copyright (c) 2013 Scott Talbot. All rights reserved.
//

#import "STDistributedNotificationSpammer.h"


@interface STDistributedNotificationSpammer ()
- (void)notification:(NSNotification *)note;
@end

@implementation STDistributedNotificationSpammer {
@private
	NSDistributedNotificationCenter *_dnc;
	NSFileHandle *_outputFileHandle;
}

- (id)init {
	return [self initWithDistributedNotificationCenter:nil outputFileHandle:nil];
}

- (id)initWithDistributedNotificationCenter:(NSDistributedNotificationCenter *)notificationCenter outputFileHandle:(NSFileHandle *)outputFileHandle {
	if ((self = [super init])) {
		_dnc = notificationCenter;
		_outputFileHandle = outputFileHandle;

		[_dnc addObserver:self selector:@selector(notification:) name:nil object:nil suspensionBehavior:NSNotificationSuspensionBehaviorCoalesce];
	}
	return self;
}

- (void)dealloc {
	[_dnc removeObserver:self name:nil object:nil];
}


- (void)notification:(NSNotification *)note {
	NSMutableDictionary * const noteDict = [NSMutableDictionary dictionaryWithCapacity:3];
	{
		NSString * const noteName = note.name;
		if (noteName) {
			noteDict[@"name"] = noteName;
		}
	}
	{
		id const noteObject = note.object;
		if (noteObject) {
			noteDict[@"object"] = noteObject;
		}
	}
	{
		NSDictionary * const noteUserInfo = note.userInfo;
		if (noteUserInfo) {
			noteDict[@"userInfo"] = noteUserInfo;
		}
	}

	NSString * const noteDescription = [noteDict description];
	NSData * const noteDescriptionData = [noteDescription dataUsingEncoding:NSUTF8StringEncoding];

	[_outputFileHandle writeData:noteDescriptionData];
	[_outputFileHandle writeData:[NSData dataWithBytesNoCopy:"\n" length:1 freeWhenDone:NO]];
}

@end
