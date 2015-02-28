//
//  TestDelegate.h
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 13..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MLTextField.h"

@interface MLComboField : MLTextField
@property (nonatomic,weak) id selectedItem;
- (void) hidePopup;
@end
