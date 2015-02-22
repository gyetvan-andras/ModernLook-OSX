//
//  PBRadioGroupView.h
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 19..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MLRadioGroupManager : NSControl
@property (nonatomic) NSInteger selectedItem;
- (IBAction)buttonClicked:(NSButton *)sender;

@property (weak) IBOutlet NSView *groupView;
@end
