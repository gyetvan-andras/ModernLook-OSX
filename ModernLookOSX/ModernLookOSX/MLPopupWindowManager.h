//
//  PBPopupManager.h
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 14..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface MLPopupWindowManager : NSObject
+ (MLPopupWindowManager*) popupManager;

- (BOOL) showPopupForControl:(NSControl*)control withContent:(NSView*)content;
- (void) hidePopup;
@end
