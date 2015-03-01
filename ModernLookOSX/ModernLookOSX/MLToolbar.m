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

@property (nonatomic, strong) NSTrackingArea* trackingArea;

@end

@implementation MLToolbar

- (instancetype)initWithFrame: (NSRect)frameRect
{
	if(frameRect.size.height > 20) {
		_verticalButtons = YES;
	} else {
		_verticalButtons = NO;
	}
	
	self = [super initWithFrame: frameRect];
	
	return self;
}

//- (instancetype)initWithCoder:(NSCoder *)coder {
//	self = [super initWithCoder:coder];
//	if(self) {
//		[self commonInit];
//	}
//	return self;
//}

- (void) setHiddenButtons:(BOOL)hiddenButtons {
	_hiddenButtons = hiddenButtons;
	if(_hiddenButtons) {
		[self.closeButton removeFromSuperviewWithoutNeedingDisplay];
		[self.minimizeButton removeFromSuperviewWithoutNeedingDisplay];
		[self.maximizeButton removeFromSuperviewWithoutNeedingDisplay];
		self.closeButton = nil;
		self.minimizeButton = nil;
		self.maximizeButton = nil;
	}
	[self createTrackingArea];
}

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
	[self createTrackingArea];
}

- (void) createTrackingArea {
	if(self.trackingArea) {
		[self removeTrackingArea:self.trackingArea];
	}
	if(_hiddenButtons) return;
	NSRect buttonsRect = NSZeroRect;
	NSRect b = self.bounds;
	
	if(self.verticalButtons) {
		CGFloat y = b.size.height;
		
		CGFloat bh = self.closeButton.bounds.size.height;
		CGFloat bw = self.closeButton.bounds.size.width;
		
		y = y - bh - 5;
		
		CGFloat x = 8;
		buttonsRect.origin = NSMakePoint(x, y-bh-3-bh-3);
		buttonsRect.size = NSMakeSize(bw, bh+3+bh+3+bh);
	} else {
		CGFloat y = b.size.height;
		
		CGFloat bh = self.closeButton.bounds.size.height;
		CGFloat bw = self.closeButton.bounds.size.width;
		
		y = y - bh - 5;
		
		CGFloat x = 8;
		buttonsRect.origin = NSMakePoint(x, y);
		buttonsRect.size = NSMakeSize(bw+2+bw+bw,bh);
	
	}
	
	self.trackingArea = [[NSTrackingArea alloc] initWithRect:buttonsRect
            options: (NSTrackingMouseEnteredAndExited | NSTrackingActiveAlways )
												  owner:self userInfo:nil];
	[self addTrackingArea:self.trackingArea];
	
}

- (void)mouseEntered:(NSEvent *)theEvent {
	self.closeButton.highlighted = YES;
	self.minimizeButton.highlighted = YES;
	self.maximizeButton.highlighted = YES;
}

- (void)mouseExited:(NSEvent *)theEvent {
	self.closeButton.highlighted = NO;
	self.minimizeButton.highlighted = NO;
	self.maximizeButton.highlighted = NO;
}

- (void) commonInit {
	[super commonInit];
	_hiddenButtons = NO;
	if(!self.hiddenButtons) {
		NSUInteger mask = NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask;
		self.closeButton = [NSWindow standardWindowButton:NSWindowCloseButton forStyleMask:mask];
		self.minimizeButton = [NSWindow standardWindowButton:NSWindowMiniaturizeButton forStyleMask:mask];
		self.maximizeButton = [NSWindow standardWindowButton:NSWindowZoomButton forStyleMask:mask];
		
		[self.closeButton setButtonType:NSMomentaryChangeButton];
		
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
	[self createTrackingArea];
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

	if(self.verticalButtons && !self.hiddenButtons) {
		NSBezierPath *sepLine = [NSBezierPath bezierPath];
		p = bounds.origin;
		p.x += 29;
		[sepLine moveToPoint:p];
		p.y += bounds.size.height;
		[sepLine lineToPoint:p];
		sepLine.lineWidth = 0.4;
		[sepLine stroke];
	}
	
//	[[NSColor redColor] set];
//	NSFrameRect(self.trackingArea.rect);
	
	[NSGraphicsContext restoreGraphicsState];
	
//	[super drawRect:dirtyRect];
	
}

@end
