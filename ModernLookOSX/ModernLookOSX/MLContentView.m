//
//  PBAppContentView.m
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 17..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "MLContentView.h"
#import "MLMainWindow.h"

@implementation MLContentView

- (void)drawRect: (NSRect)rect
{
	[NSGraphicsContext saveGraphicsState];
	
	NSRect bounds = [self bounds];
	NSRect upperBounds = bounds;
	upperBounds.size.height -= 10;
	upperBounds.origin.y += 10;
	
	NSBezierPath *borderPath = [NSBezierPath bezierPathWithRoundedRect: bounds xRadius: ML_MAIN_WINDOW_ROUNDED_RECT_RADIUS yRadius: ML_MAIN_WINDOW_ROUNDED_RECT_RADIUS];
	[borderPath appendBezierPathWithRect:upperBounds];
	[self.backgroundColor set];
	[borderPath fill];
	
//	NSBezierPath *borderPath = [NSBezierPath bezierPathWithRoundedRect: bounds xRadius: 5 yRadius: 5];
//	[self.backgroundColor set];
//	[borderPath fill];
	
	[NSGraphicsContext restoreGraphicsState];
}

@end
