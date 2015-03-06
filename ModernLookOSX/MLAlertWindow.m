//
//  MLAlertWindow.m
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 28..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "MLAlertWindow.h"
#import "MLAlert.h"

@implementation MLAlertWindow
- (void) cancelOperation:(id)sender {
	[NSApp stopModalWithCode:MLALERT_CANCEL];
}

- (BOOL)canBecomeMainWindow {
	return NO;
}

@end
