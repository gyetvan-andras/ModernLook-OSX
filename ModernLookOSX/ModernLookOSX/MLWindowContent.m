//
//  PBWindowContent.m
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 18..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "MLWindowContent.h"
#import "MLMainWindow.h"

@interface MLWindowContent ()
@end

@implementation MLWindowContent
- (void)drawRect: (NSRect)rect
{
	[NSGraphicsContext saveGraphicsState];
	
	NSRect bounds = [self bounds];
	
	NSBezierPath *borderPath = [NSBezierPath bezierPathWithRoundedRect: bounds xRadius: ML_MAIN_WINDOW_ROUNDED_RECT_RADIUS yRadius: ML_MAIN_WINDOW_ROUNDED_RECT_RADIUS];
	[self.backgroundColor set];
	[borderPath fill];
	
	[NSGraphicsContext restoreGraphicsState];
}

@end
