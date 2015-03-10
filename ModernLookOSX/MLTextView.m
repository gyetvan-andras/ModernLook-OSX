//
//  MLTextView.m
//  ModernLookOSX
//
//  Created by András Gyetván on 10/03/15.
//  Copyright (c) 2015 DroidZONE. All rights reserved.
//

#import "MLTextView.h"

@implementation MLTextView

-(instancetype) init {
	self = [super init];
	if(self) {
		self.fieldEditor = YES;
		[super setFocusRingType:NSFocusRingTypeNone];
	}
	return self;
}

- (void) setDrawsBackground:(BOOL)drawsBackground {
	[super setDrawsBackground:NO];
}

- (void) setFocusRingType:(NSFocusRingType)focusRingType {
	[super setFocusRingType:NSFocusRingTypeNone];
}

- (void) drawRect:(NSRect)dirtyRect {
	if(self.fieldEditorMarker) {
		NSRect bounds = [self bounds];
		[self.fieldEditorMarker set];
		
		NSBezierPath *bottomLine = [NSBezierPath bezierPath];
		NSPoint p = NSZeroPoint;//bounds.origin;
		p.y = bounds.size.height - 1;
		[bottomLine moveToPoint:p];
		p.x += bounds.size.width;
		[bottomLine lineToPoint:p];
		bottomLine.lineWidth = 2.0f;
		[bottomLine stroke];
	}
	[super drawRect:dirtyRect];
}

@end
