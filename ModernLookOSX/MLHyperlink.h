//
//  MLHyperlink.h
//  ModernLookOSX
//
//  Created by András Gyetván on 19/03/15.
//  Copyright (c) 2015 DroidZONE. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MLHyperlink : NSTextField
@property (nonatomic, copy) NSColor* hoveredTextColor;
@property (nonatomic) BOOL hasUnderline;
@end
