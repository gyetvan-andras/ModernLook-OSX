//
//  MLHyperlink.m
//  ModernLookOSX
//
//  Created by András Gyetván on 19/03/15.
//  Copyright (c) 2015 DroidZONE. All rights reserved.
//

#import "MLHyperlink.h"

@interface MLHyperlink ()
@property (nonatomic, strong) NSTrackingArea* trackingArea;
@property (nonatomic) BOOL hoovered;
@end

@implementation MLHyperlink

- (instancetype) initWithCoder:(NSCoder *)coder {
	self = [super initWithCoder:coder];
	if(self) {
		NSFont* fnt = self.font;
		NSFont* regular = [NSFont systemFontOfSize:0];
		BOOL restoreFont = NO;
		if(regular != self.font) restoreFont = YES;
		[self commonInit];
		if(restoreFont) self.font = fnt;
	}
	return self;
}

- (instancetype) initWithFrame:(NSRect)frameRect {
	self = [super initWithFrame:frameRect];
	if(self) {
		[self commonInit];
	}
	return self;
}

- (void) viewDidEndLiveResize {
	[self createTrackingArea];
}

- (void) commonInit {
	self.font = [NSFont fontWithName:@"Helvetica Neue Thin" size:16.0];
	self.bordered = false;
	self.focusRingType = NSFocusRingTypeNone;
	[self createTrackingArea];
	self.hoovered = NO;
	self.hoveredTextColor = [NSColor blueColor] ;
	self.backgroundColor = [NSColor clearColor];
}

- (void) createTrackingArea {
	if(self.trackingArea) {
		[self removeTrackingArea:self.trackingArea];
	}
	self.trackingArea = [[NSTrackingArea alloc] initWithRect:self.bounds
													 options: (NSTrackingMouseEnteredAndExited | NSTrackingActiveInActiveApp)
													   owner:self userInfo:nil];
	[self addTrackingArea:self.trackingArea];
	
}

- (void)mouseEntered:(NSEvent *)theEvent {
	self.hoovered = YES;
	self.needsDisplay = YES;
}

- (void)mouseExited:(NSEvent *)theEvent {
	self.hoovered = NO;
	self.needsDisplay = YES;
}

- (void) mouseDown:(NSEvent *)theEvent {
	[self sendAction:self.action to:self.target];
}

- (void)drawRect:(NSRect)dirtyRect {
	[NSGraphicsContext saveGraphicsState];
	
	NSRect bounds = [self bounds];
	
	NSColor* drawColor = nil;
	
	if(self.hoovered) {
		drawColor = self.hoveredTextColor;
	} else {
		if(self.stringValue != nil && self.stringValue.length > 0) {
			drawColor = self.textColor;
		} else {
			drawColor = [NSColor tertiaryLabelColor];
		}
	}
	
	NSString* text = @"";
	if(self.stringValue != nil && self.stringValue.length > 0) {
		text = self.stringValue;
	} else {
		text = self.placeholderString;
	}
	
	NSMutableParagraphStyle * aParagraphStyle = [[NSMutableParagraphStyle alloc] init];
	[aParagraphStyle setLineBreakMode:NSLineBreakByWordWrapping];
	[aParagraphStyle setAlignment:self.alignment];
	NSDictionary *attrs = @{NSParagraphStyleAttributeName: aParagraphStyle,NSFontAttributeName: self.font,NSForegroundColorAttributeName: drawColor};
	
	[text drawInRect:self.bounds withAttributes:attrs];

	if(self.hasUnderline) {
		NSRect bounds = [self bounds];
		[self.textColor set];
		
		NSBezierPath *bottomLine = [NSBezierPath bezierPath];
		NSPoint p = NSZeroPoint;//bounds.origin;
		p.y = bounds.size.height;
		[bottomLine moveToPoint:p];
		p.x += bounds.size.width;
		[bottomLine lineToPoint:p];
		[bottomLine stroke];
	} else if(self.hoovered) {
		NSSize size = [text sizeWithAttributes:attrs];

		CGFloat x1 = 0.0f;
		CGFloat x2 = 0.0f;
		switch(self.alignment) {
			case NSNaturalTextAlignment:
			case NSJustifiedTextAlignment:
			case NSLeftTextAlignment:
				x1 = 0;
				x2 = size.width;
				break;
			case NSRightTextAlignment:
				x2 = self.bounds.size.width;
				x1 = x2 - size.width;
				break;
			case NSCenterTextAlignment:
				x1 = (self.bounds.size.width - size.width)/2.0f;
				x2 = x1+size.width;
				break;
		}
		
		NSBezierPath *bottomLine = [NSBezierPath bezierPath];
		NSPoint p = NSZeroPoint;//bounds.origin;
		p.y = bounds.size.height;
		p.x = x1;
		[bottomLine moveToPoint:p];
		p.x = x2;
		[bottomLine lineToPoint:p];
		[bottomLine stroke];
		
	}
	[NSGraphicsContext restoreGraphicsState];
}


@end
