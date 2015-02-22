//
//  PBPopupManager.m
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 14..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "MLPopupWindowManager.h"
#import "MLPopupWindow.h"
@interface MLPopupWindowManager()
@property (nonatomic, weak) NSControl* control;
@property (nonatomic, strong) MLPopupWindow* popupWindow;
- (void) windowDidResize:(NSNotification *)note;
- (void) windowDidResignKey:(NSNotification *)note;
- (void) layoutPopupWindow;
@end

MLPopupWindowManager* _popupManager;

@implementation MLPopupWindowManager

- (BOOL) showPopupForControl:(NSControl*)control withContent:(NSView*)content {
	if(self.control == control) return YES;
	if(self.control) {
		[self hidePopup];
	}
	self.control = control;
	NSRect contentRect = control.bounds;
	contentRect.size.height = 200;
	self.popupWindow.contentView = content;
	[self layoutPopupWindow];
	[control.window addChildWindow:self.popupWindow ordered:NSWindowAbove];
	
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(windowDidResize:)
												 name:NSWindowDidResizeNotification
											   object:control.window
	 ];
	return NO;
}

- (void) hidePopup {
	if(self.popupWindow) {
		[self.popupWindow orderOut:self];
		[self.control.window removeChildWindow:self.popupWindow];
		[[NSNotificationCenter defaultCenter] removeObserver:self];
	}
	self.control = nil;
}

- (id) init {
	self = [super init];
	if(self) {
		NSRect contentRect = NSZeroRect;
		contentRect.size.height = 200;
		self.popupWindow = [[MLPopupWindow alloc] initWithContentRect:contentRect styleMask:NSBorderlessWindowMask backing:NSBackingStoreBuffered defer:NO];
		[self.popupWindow setMovableByWindowBackground:NO];
		[self.popupWindow setExcludedFromWindowsMenu:YES];
		[self.popupWindow setHasShadow:YES];
//		[self.popupWindow setTitleVisibility:NSWindowTitleHidden];
	}
	return self;
}

+ (MLPopupWindowManager*) popupManager {
	if(!_popupManager) {
		_popupManager = [[MLPopupWindowManager alloc] init];
	}
	return _popupManager;
}

- (void) layoutPopupWindow {
	if(self.control) {
		NSRect screenRect = [self.control.window convertRectToScreen:self.control.frame];
		NSRect frame = NSZeroRect;
		NSRect contentRect = self.control.bounds;
		contentRect.size.height = 200;
		frame.size.width = contentRect.size.width;
		frame.size.height = 200;
		frame.origin.x = screenRect.origin.x;
		frame.origin.y = screenRect.origin.y - 200;
		[self.popupWindow setFrame:frame display:NO];
//		[self.popupWindow setMovableByWindowBackground:NO];
//		[self.popupWindow setExcludedFromWindowsMenu:YES];
//		[self.popupWindow setHasShadow:YES];
//		[self.popupWindow setTitleVisibility:NSWindowTitleHidden];
	};
}


- (void)windowDidResignKey:(NSNotification *)note
{
	[self hidePopup];
}

- (void)windowDidResize:(NSNotification *)note
{
	[self layoutPopupWindow];
}

@end
