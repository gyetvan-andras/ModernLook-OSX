//
//  PBToolbar.m
//  ModernLook
//
//  Created by András Gyetván on 2015. 02. 18..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "MLToolbar.h"
#import "MLMainWindow.h"

@interface MLToolbar ()
@property (nonatomic, weak) NSButton *closeButton;
@property (nonatomic, weak) NSButton *minimizeButton;
@property (nonatomic, weak) NSButton *maximizeButton;

@end

@implementation MLToolbar

- (instancetype)initWithFrame: (NSRect)frameRect
{
	self = [super initWithFrame: frameRect];
	if (self != nil) {
		NSRect b = self.bounds;
		if(b.size.height > 20) {
			self.verticalButtons = YES;
		} else {
			self.verticalButtons = NO;
		}
		[self commonInit];
	}
	
	return self;
}

//- (instancetype)initWithCoder:(NSCoder *)coder {
//	self = [super initWithCoder:coder];
//	if(self) {
//		[self commonInit];
//	}
//	return self;
//}

- (void) setVerticalButtons:(BOOL)verticalButtons {
	_verticalButtons = verticalButtons;
	NSRect b = self.bounds;
	if(self.verticalButtons) {
		CGFloat y = b.size.height;
		
		CGFloat bh = self.closeButton.bounds.size.height;
		y = y - bh - 5;
		
		CGFloat x = 8;
		[self.closeButton setFrameOrigin:NSMakePoint(x, y)];
		[self.minimizeButton setFrameOrigin:NSMakePoint(x, y-bh-3)];
		[self.maximizeButton setFrameOrigin:NSMakePoint(x, y-bh-3-bh-3)];
	} else {
		CGFloat y = b.size.height;
		
		CGFloat bh = self.closeButton.bounds.size.height;
		CGFloat bw = self.closeButton.bounds.size.width;
		
		y = y - bh - 5;
		
		CGFloat x = 8;
		[self.closeButton setFrameOrigin:NSMakePoint(x, y)];
		[self.minimizeButton setFrameOrigin:NSMakePoint(x+2+bw, y)];
		[self.maximizeButton setFrameOrigin:NSMakePoint(x+2+bw+2+bw, y)];
	}
}

- (void) commonInit {
	[super commonInit];
	self.closeButton = [NSWindow standardWindowButton:NSWindowCloseButton forStyleMask:NSTitledWindowMask];
	self.minimizeButton = [NSWindow standardWindowButton:NSWindowMiniaturizeButton forStyleMask:NSTitledWindowMask];
	self.maximizeButton = [NSWindow standardWindowButton:NSWindowZoomButton forStyleMask:NSTitledWindowMask];
	
	NSRect b = self.bounds;
	CGFloat y = b.size.height;
	
	CGFloat bh = self.closeButton.bounds.size.height;
	CGFloat bw = self.closeButton.bounds.size.width;
	
	y = y - bh - 5;
	
	CGFloat x = 8;
	[self.closeButton setFrameOrigin:NSMakePoint(x, y)];
	[self.minimizeButton setFrameOrigin:NSMakePoint(x+2+bw, y)];
	[self.maximizeButton setFrameOrigin:NSMakePoint(x+2+bw+2+bw, y)];
	
	[self addSubview:self.closeButton];
	[self addSubview:self.minimizeButton];
	[self addSubview:self.maximizeButton];
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

	if(self.verticalButtons) {
		NSBezierPath *sepLine = [NSBezierPath bezierPath];
		p = bounds.origin;
		p.x += 29;
		[sepLine moveToPoint:p];
		p.y += bounds.size.height;
		[sepLine lineToPoint:p];
		sepLine.lineWidth = 0.4;
		[sepLine stroke];
	}
	
	[NSGraphicsContext restoreGraphicsState];
	
//	[super drawRect:dirtyRect];
	
}

@end
