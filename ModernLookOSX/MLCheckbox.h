//
//  MLCheckbox.h
//  ModernLookOSX
//
//  Created by András Gyetván on 18/04/15.
//  Copyright (c) 2015 DroidZONE. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MLCheckbox : NSButton
@property (nonatomic, copy) NSColor* backgroundColor;
@property (nonatomic, copy) NSColor* hoveredBackgroundColor;
@property (nonatomic, copy) NSColor* foregroundColor;
@property (nonatomic, copy) NSColor* hoveredForegroundColor;
@property (nonatomic, assign) CGFloat  circleBorder;
@property (strong) NSImage *onImage;

@end
