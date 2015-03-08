//
//  MLCalendarPopup.h
//  ModernLookOSX
//
//  Created by András Gyetván on 2015. 03. 08..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MLCalendarView : NSViewController
@property (nonatomic, copy) NSColor* backgroundColor;
@property (nonatomic, copy) NSColor* textColor;
@property (nonatomic, copy) NSColor* selectionColor;
@property (nonatomic, copy) NSColor* todayMarkerColor;
@property (nonatomic, copy) NSColor* dayMarkerColor;

@property (nonatomic, strong) NSDate* date;
@end
