//
//  ApplicationController.m
//  as3Debugger
//
//  Created by Lucas Dupin on 8/12/09.
//  Copyright 2009 Gringo. All rights reserved.
//

#import "ApplicationController.h"


@implementation ApplicationController

- (void)awakeFromNib
{
}

- (void)applicationWillTerminate: (NSNotification *)note
{
	[traceController stopTask];
	[debuggingViewController stopTask];
}

#pragma mark Applescript handling
- (BOOL)application:(NSApplication *)sender 
 delegateHandlesKey:(NSString *)key
{
	NSLog(key);
    if ([key isEqual:@"flexPath"] || [key isEqual:@"projectPath"] || [key isEqual:@"flashlogPath"]) {
        return YES;
    } else {
        return NO;
    }
}

//Flashlog
- (NSString *)flashlogPath
{
    return [[[NSUserDefaultsController sharedUserDefaultsController] values] valueForKey: @"flashLogPath"];
}
- (void)setFlashlogPath:(NSString *)text
{
    [[[NSUserDefaultsController sharedUserDefaultsController] values] setValue:text forKey: @"flashLogPath"];
	[traceController stopTask];
	[traceController startTask];
}

//Project path
- (NSString *)projectPath
{
    return [[[NSUserDefaultsController sharedUserDefaultsController] values] valueForKey: @"flashProjectPath"];
}
- (void)setProjectPath:(NSString *)text
{
    [[[NSUserDefaultsController sharedUserDefaultsController] values] setValue:text forKey: @"flashProjectPath"];
}

//SDK
- (NSString *)flexPath
{
    return [[[NSUserDefaultsController sharedUserDefaultsController] values] valueForKey: @"flexSDKPath"];
}
- (void)setFlexPath:(NSString *)text
{
    [[[NSUserDefaultsController sharedUserDefaultsController] values] setValue:text forKey: @"flexSDKPath"];
}

#pragma mark Showing windows
- (IBAction) showLogViewer: (id)sender
{
	[[traceController getWindow] orderFront: self]; 
}
- (IBAction) showDebuggingView: (id)sender
{
	NSLog(@"%@ window", debugWindow);
	[[debuggingViewController getWindow] makeKeyAndOrderFront:self];
	
//	NSWindow* win = ;
//	[win makeKeyAndOrderFront:self];
}

@end
