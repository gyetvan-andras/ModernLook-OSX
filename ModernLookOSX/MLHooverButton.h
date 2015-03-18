//
//  MLHooverButton.h
//  ModernLookOSX
//
//  Created by András Gyetván on 17/03/15.
//  Copyright (c) 2015 DroidZONE. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MLHooverButton : NSButton
@property (nonatomic, copy) NSColor* backgroundColor;
@property (nonatomic, copy) NSColor* hooverBackgroundColor;
@property (nonatomic, copy) NSColor* foregroundColor;
@property (nonatomic, copy) NSColor* hooveredForegroundColor;
@end
