//
//  TestDelegate.m
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 13..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "MLComboField.h"
#import "MLPopupWindowManager.h"

@implementation MLComboField

- (void) selectText:(id)sender {
	[super selectText:sender];
	NSInteger insertionPoint = self.stringValue.length;
	NSRange r;
	r.length = 0;
	r.location = insertionPoint;
	NSText* textEditor = [self.window fieldEditor:YES forObject:self];
	textEditor.selectedRange = r;
}

- (void) hidePopup {
	[[MLPopupWindowManager popupManager] hidePopup];
}

-(void)textDidEndEditing:(NSNotification *)notification {
	[[MLPopupWindowManager popupManager] hidePopup];
	NSInteger insertionPoint = self.stringValue.length;
	NSRange r;
	r.length = 0;
	r.location = insertionPoint;
	NSText* textEditor = [self.window fieldEditor:YES forObject:self];
	textEditor.selectedRange = r;
	
	[super textDidEndEditing:notification];
}

@end
