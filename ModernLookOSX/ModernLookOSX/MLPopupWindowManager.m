//
//  PBPopupManager.m
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 14..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "MLPopupWindowManager.h"
#import "MLPopupWindow.h"
@interface MLPopupWindowManager() {
	CGFloat originalHeight;
}
@property (nonatomic, weak) NSControl* control;
@property (nonatomic, strong) MLPopupWindow* popupWindow;
- (void) windowDidResize:(NSNotification *)note;
- (void) windowDidResignKey:(NSNotification *)note;
- (void) applicationDidResignActive:(NSNotification *)note;
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
	originalHeight = content.bounds.size.height;
	self.popupWindow.contentView = content;
	[self layoutPopupWindow];
	[control.window addChildWindow:self.popupWindow ordered:NSWindowAbove];
	
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(windowDidResize:)
												 name:NSWindowDidResizeNotification
											   object:control.window
	 ];
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(applicationDidResignActive:)
												 name:NSApplicationDidResignActiveNotification
											   object:[NSApplication sharedApplication]
	 ];
	
	return NO;
}

- (void) applicationDidResignActive:(NSNotification *)note {
	[self hidePopup];
}

- (void) hidePopup {
	if(self.popupWindow) {
		[self.popupWindow orderOut:self];
		[self.control.window removeChildWindow:self.popupWindow];
		[[NSNotificationCenter defaultCenter] removeObserver:self];
	}
	self.control = nil;
}

- (instancetype) init {
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
		
		NSRect screenFrame;
		if (self.popupWindow && [self.popupWindow screen]) {
			screenFrame = [[self.popupWindow screen] visibleFrame];
		} else {
			screenFrame = [[NSScreen mainScreen] visibleFrame];
		}
		
		NSRect screenRect = [self.control.window convertRectToScreen:self.control.frame];
		NSRect frame = NSZeroRect;
		NSRect contentRect = self.control.bounds;
		frame.size.width = contentRect.size.width;
		frame.size.height = originalHeight;
		frame.origin.x = screenRect.origin.x;
		frame.origin.y = screenRect.origin.y - originalHeight;
		
		CGFloat x1 = frame.origin.x;
		CGFloat y1 = frame.origin.y;
		CGFloat x2 = x1 + frame.size.width;
//		CGFloat y2 = y1 + frame.size.height;
		
		if(x1 < screenFrame.origin.x) {
			frame.origin.x = screenFrame.origin.x;
		}
		if(y1 < screenFrame.origin.y) {
			frame.origin.y = screenRect.origin.y + contentRect.size.height;
		}
		if(x2 > screenFrame.size.width) {
			frame.origin.x -= (x2 - screenFrame.size.width);
		}
		[self.popupWindow setFrame:frame display:NO];
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
