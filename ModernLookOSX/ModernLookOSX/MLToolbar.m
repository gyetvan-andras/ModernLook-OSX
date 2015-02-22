//
//  PBToolbar.m
//  ModernLook
//
//  Created by András Gyetván on 2015. 02. 18..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "MLToolbar.h"
#import "MLMainWindow.h"

@implementation MLToolbar

- (void) commonInit {
	[super commonInit];
	NSButton *closeButton = [NSWindow standardWindowButton:NSWindowCloseButton forStyleMask:NSTitledWindowMask];
	NSButton *minimizeButton = [NSWindow standardWindowButton:NSWindowMiniaturizeButton forStyleMask:NSTitledWindowMask];
	NSButton *maximizeButton = [NSWindow standardWindowButton:NSWindowZoomButton forStyleMask:NSTitledWindowMask];
	
	NSRect b = self.bounds;
	CGFloat y = b.size.height;
	
	CGFloat bh = closeButton.bounds.size.height;
	y = y - bh - 5;
	
	CGFloat x = 8;
	[closeButton setFrameOrigin:NSMakePoint(x, y)];
	[minimizeButton setFrameOrigin:NSMakePoint(x, y-bh-2)];
	[maximizeButton setFrameOrigin:NSMakePoint(x, y-bh-2-bh-2)];
	
	[self addSubview:closeButton];
	[self addSubview:minimizeButton];
	[self addSubview:maximizeButton];
}

- (void)drawRect:(NSRect)dirtyRect {
	
	[NSGraphicsContext saveGraphicsState];
	
	NSRect bounds = [self bounds];
	NSRect lowerBounds = bounds;
	lowerBounds.size.height -= 10;
	
	NSBezierPath *borderPath = [NSBezierPath bezierPathWithRoundedRect: bounds xRadius: ML_MAIN_WINDOW_ROUNDED_RECT_RADIUS yRadius: ML_MAIN_WINDOW_ROUNDED_RECT_RADIUS];
	[borderPath appendBezierPathWithRect:lowerBounds];
	[self.backgroundColor set];
	[borderPath fill];

	
	[[NSColor blackColor] set];
	NSBezierPath *bottomLine = [NSBezierPath bezierPath];
	NSPoint p = bounds.origin;
	[bottomLine moveToPoint:p];
	p.x += bounds.size.width;
	[bottomLine lineToPoint:p];
	[bottomLine stroke];

	NSBezierPath *sepLine = [NSBezierPath bezierPath];
	p = bounds.origin;
	p.x += 29;
	[sepLine moveToPoint:p];
	p.y += bounds.size.height;
	[sepLine lineToPoint:p];
	sepLine.lineWidth = 0.4;
	[sepLine stroke];
	[NSGraphicsContext restoreGraphicsState];
	
	[super drawRect:dirtyRect];
	
}

@end
