//
//  MLColoredButton.h
//  ModernLookOSX
//
//  Created by András Gyetván on 2015. 03. 06..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MLColoredButton : NSButton
@property (nonatomic, strong) NSColor* backgroundColor;
@property (nonatomic, strong) NSColor* textColor;
- (void) commonInit;
@end
