//
//  MLColoredButton.m
//  ModernLookOSX
//
//  Created by András Gyetván on 2015. 03. 06..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#define ML_COLORED_BUTTON_ROUNDED_RECT_RADIUS 5
#import "MLColoredButton.h"

@implementation MLColoredButton

- (instancetype)initWithFrame: (NSRect)frameRect
{
	self = [super initWithFrame: frameRect];
	if (self != nil) {
		[self commonInit];
	}
	
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
	self = [super initWithCoder:coder];
	if(self) {
		[self commonInit];
	}
	return self;
}

- (void) commonInit {
	self.backgroundColor = [NSColor clearColor];
	self.textColor = [NSColor blackColor];
	self.bordered = NO;
}

- (void)drawRect:(NSRect)dirtyRect {

	[NSGraphicsContext saveGraphicsState];
	
	NSRect bounds = [self bounds];
	
	bounds = NSInsetRect(bounds, 0.5f, 0.5f);
	
	NSBezierPath *borderPath = [NSBezierPath bezierPathWithRoundedRect: bounds xRadius: ML_COLORED_BUTTON_ROUNDED_RECT_RADIUS yRadius: ML_COLORED_BUTTON_ROUNDED_RECT_RADIUS];
	if(self.isHighlighted) {
		[[NSColor grayColor] set];
	} else {
		[self.backgroundColor set];
	}
	[borderPath fill];

	
	NSMutableParagraphStyle * aParagraphStyle = [[NSMutableParagraphStyle alloc] init];
	[aParagraphStyle setLineBreakMode:NSLineBreakByWordWrapping];
	[aParagraphStyle setAlignment:self.alignment];
	
	NSDictionary *attrs = @{NSParagraphStyleAttributeName: aParagraphStyle,NSFontAttributeName: self.font,NSForegroundColorAttributeName: self.textColor};
	[self.title drawInRect:bounds withAttributes:attrs];
	
	[[NSColor lightGrayColor] set];
	borderPath.lineWidth = 0.3f;
	[borderPath stroke];
	
	[NSGraphicsContext restoreGraphicsState];
//	[super drawRect:dirtyRect];
}

@end
