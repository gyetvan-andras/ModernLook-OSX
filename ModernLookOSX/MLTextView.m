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

@end
