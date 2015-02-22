//
//  PBGlassView.h
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 19..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <QuartzCore/QuartzCore.h>

@interface MLGlassView : NSView

@property (nonatomic, strong) NSColor* backgroundColor;

- (void) commonInit;

@end
