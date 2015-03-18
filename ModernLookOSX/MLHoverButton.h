//
//  MLHooverButton.h
//  ModernLookOSX
//
//  Created by András Gyetván on 17/03/15.
//  Copyright (c) 2015 DroidZONE. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MLHoverButton : NSButton
@property (nonatomic, copy) NSColor* backgroundColor;
@property (nonatomic, copy) NSColor* hoveredBackgroundColor;
@property (nonatomic, copy) NSColor* foregroundColor;
@property (nonatomic, copy) NSColor* hoveredForegroundColor;
@end
