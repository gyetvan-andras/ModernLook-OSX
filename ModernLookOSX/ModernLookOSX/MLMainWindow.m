
#import "MLMainWindow.h"

#import <AppKit/AppKit.h>
#import "MLPopupWindowManager.h"

@interface MLMainWindow ()
@end

@implementation MLMainWindow

- (instancetype)initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag
{
	self = [super initWithContentRect:contentRect styleMask:NSBorderlessWindowMask backing:bufferingType defer:flag];
	
	if ( self )
	{
		[self setOpaque:NO];
		[self setBackgroundColor:[NSColor clearColor]];
		[self setMovableByWindowBackground:TRUE];
		[self setStyleMask:NSBorderlessWindowMask|NSResizableWindowMask];
		[self setHasShadow:YES];
	}
	
	return self;
}

- (BOOL)canBecomeKeyWindow {
	return YES;
}

- (BOOL)canBecomeMainWindow {
	return YES;
}

- (void)showContent:(NSView *)c {
	c.alphaValue = 0;
	c.wantsLayer = YES;
	
	[self.pbContent removeConstraints:self.pbContent.constraints];
	
	[[NSAnimationContext currentContext] setDuration:1.0];
	
	[c setTranslatesAutoresizingMaskIntoConstraints:NO];
	if(self.pbContent.subviews.count > 0) {
		[self.pbContent.subviews[0]  setAlphaValue:0.0];
	}
	
	self.pbContent.subviews = @[c];
	
	NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(c);
	[self.pbContent addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[c]|" options:0 metrics:nil views:viewsDictionary]];
	[self.pbContent addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[c]|" options:0 metrics:nil views:viewsDictionary]];
	[NSAnimationContext beginGrouping];
	
	[c.animator setAlphaValue:1.0];

	[NSAnimationContext endGrouping];
}

- (void)sendEvent:(NSEvent *)event {
	if(event.type == NSLeftMouseUp) {
		[[MLPopupWindowManager popupManager] hidePopup];
	}
	[super sendEvent:event];
}
@end
