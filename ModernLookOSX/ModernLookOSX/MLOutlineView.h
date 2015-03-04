//
//  PBOutlineView.h
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 20..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MLOutlineView : NSOutlineView
@property (nonatomic,copy) NSColor* selectionColor;
- (void) saveTreeState;
- (void) restoreTreeState;

@end
