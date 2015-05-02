//
//  TestDelegate.m
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 13..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "MLComboField.h"
#import "MLPopupWindowManager.h"
#import "MLComboFieldDelegate.h"

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

- (void) mouseDown:(NSEvent *)theEvent {
	[super mouseDown:theEvent];
	if([self.delegate respondsToSelector:@selector(handleMouseClick:)]) {
		MLComboFieldDelegate* d = (MLComboFieldDelegate*)self.delegate;
		[d handleMouseClick:self];
	}
	NSLog(@"Mouse down!");
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
