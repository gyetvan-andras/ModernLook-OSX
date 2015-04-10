//
//  MLWindow.m
//  Predicitve Budget
//
//  Created by András Gyetván on 10/04/15.
//  Copyright (c) 2015 DroidZONE. All rights reserved.
//

#import "MLCenteredWindow.h"

@implementation MLCenteredWindow

- (BOOL)canBecomeMainWindow {
	return NO;
}

- (void) center {
	NSRect mr = [NSApplication sharedApplication].mainWindow.frame;
	NSPoint mp = NSMakePoint(NSMidX(mr), NSMidY(mr));
	
	NSRect r = self.frame;
	NSPoint wo = NSMakePoint(mp.x - (r.size.width/2.0f),mp.y - (r.size.height/2.0f));
	r.origin = wo;
	[self setFrameOrigin:wo];
}

@end
