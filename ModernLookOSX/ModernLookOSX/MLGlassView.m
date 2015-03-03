//
//  PBGlassView.m
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 19..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "MLGlassView.h"

@interface MLGlassView ()
@end

@implementation MLGlassView

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
//	self.wantsLayer = true;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
}


@end
