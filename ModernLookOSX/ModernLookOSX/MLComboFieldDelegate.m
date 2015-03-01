//
//  PBTextFieldPopupManager.m
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 15..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "MLComboFieldDelegate.h"
#import "MLPopupWindowManager.h"
#import "MLComboField.h"
@interface MLComboFieldDelegate ()

@property (nonatomic, strong) MLPopupContent* popupContent;
//@property (nonatomic, strong) NSTextView* tf;
@property (nonatomic) BOOL dontSearch;
@property (nonatomic, assign) MLComboField*combo;
- (BOOL) showPopupForControl:(NSControl*)control;
@end

@implementation MLComboFieldDelegate

- (instancetype) init {
	self = [super init];
	if(self) {
		self.dontSearch = NO;
	}
	return self;
}

- (BOOL)control:(NSControl *)control isValidObject:(id)object {
	NSLog(@"Validating:%@",object);
	return YES;
}

- (MLPopupContent*) createPopupContent {
	return nil;
}

- (BOOL)control:(NSControl *)control textShouldBeginEditing:(NSText *)fieldEditor {
	[self showPopupForControl:control];
	return YES;
}

- (BOOL) showPopupForControl:(NSControl*)control {
	if(!self.popupContent) {
		self.popupContent = [self createPopupContent];
		self.popupContent.delegate = self;
	}
	return [[MLPopupWindowManager popupManager] showPopupForControl:control withContent:self.popupContent.view];
}

- (NSArray*) control:(NSControl *)control textView:(NSTextView *)textView completions:(NSArray *)words forPartialWordRange:(NSRange)charRange indexOfSelectedItem:(NSInteger *)index {
	return nil;
}

- (BOOL)control:(NSControl *)control textShouldEndEditing:(NSText *)fieldEditor {
	[[MLPopupWindowManager popupManager] hidePopup];
	return YES;
}

- (void) controlTextDidChange:(NSNotification *)obj {
	NSControl* control = obj.object;
	self.combo = nil;
	if ([control isKindOfClass:[MLComboField class]]) {
		self.combo = (MLComboField*)control;
	}
	if(!self.combo) {
		NSLog(@"INVALID CONTROL");
		return;
	}
	[self showPopupForControl:control];
	
	
	if(self.dontSearch) {
		self.dontSearch = NO;
		return;
	}
	
//	NSTextField* tfc = (NSTextField*)control;
	NSTextView* editor = nil;
	if([control.currentEditor isKindOfClass:[NSTextView class]]) {
		editor = (NSTextView*)control.currentEditor;
	}
	
	if(!editor) {
		NSLog(@"NO EDITOR FOR CONTROL");
		return;
	}
	NSString* s = [self.popupContent moveSelectionTo:control.stringValue];
	if(s) {
		NSInteger insertionPoint = [[editor selectedRanges][0] rangeValue].location;
		editor.string = s;
		NSRange r;
		r.length = s.length - insertionPoint;
		r.location = insertionPoint;
		editor.selectedRange = r;
	}
}

- (BOOL) control:(NSControl *)control textView:(NSTextView *)textView doCommandBySelector:(SEL)commandSelector {
	self.combo = nil;
	if ([control isKindOfClass:[MLComboField class]]) {
		self.combo = (MLComboField*)control;
	}
	if( commandSelector == @selector(moveUp:) ){
		if([self showPopupForControl:control]) {
			[self.popupContent moveSelectionUp:YES];
		}
		return YES;
	}
	if( commandSelector == @selector(deleteBackward:) ) {
		self.dontSearch = YES;
		return NO;
	}
	if( commandSelector == @selector(moveDown:) ){
		if([self showPopupForControl:control]) {
			[self.popupContent moveSelectionUp:NO];
		}
		return YES;
	}
	if( commandSelector == @selector(cancelOperation:) ){
		[[MLPopupWindowManager popupManager] hidePopup];
		return YES;
	}
	return NO;
}

- (void) selectionDidChange:(id)sel fromUpDown:(BOOL)updown {
	NSObject* o = sel;
	if(updown) self.combo.stringValue = o.description;
	self.combo.selectedItem = o;
//	self.tf.string = o.description;
}
@end
