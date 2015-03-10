
#import "MLMainWindow.h"

#import <AppKit/AppKit.h>
#import "MLPopupWindowManager.h"
#import "MLTextView.h"
#import "MLTableView.h"
#import "MLOutlineView.h"
@interface MLMainWindow ()
@property (strong) MLTextView* mlTextView;
@end

@implementation MLMainWindow

- (instancetype)initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag
{
	self = [super initWithContentRect:contentRect styleMask:NSBorderlessWindowMask|NSResizableWindowMask backing:bufferingType defer:flag];
	
	if ( self )
	{
		[self setOpaque:NO];
		[self setBackgroundColor:[NSColor clearColor]];
		[self setMovableByWindowBackground:TRUE];
		[self setStyleMask:NSBorderlessWindowMask|NSResizableWindowMask];
		[self setHasShadow:YES];
	}
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(windowDidDeminiaturize:) name:NSWindowDidDeminiaturizeNotification object:self];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(windowWillClose:) name:NSWindowWillCloseNotification object:self];
	return self;
}

- (void)becomeMainWindow {
	[super becomeMainWindow];
	[NSApp addWindowsItem:self title:self.title filename:NO];
}

- (void) windowWillClose:(NSNotification*) notification {
	[[NSNotificationCenter defaultCenter] removeObserver:self name:NSWindowDidDeminiaturizeNotification object:self];
	[[NSNotificationCenter defaultCenter] removeObserver:self name:NSWindowWillCloseNotification object:self];
}

- (void) windowDidDeminiaturize:(NSNotification*) notification {
	[self invalidateShadow];
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

- (NSText*) fieldEditor:(BOOL)createFlag forObject:(id)anObject {
	if([anObject isKindOfClass:[MLTableView class]] || [anObject isKindOfClass:[MLOutlineView class]]) {
//		NSLog(@"fieldEditor for %@",anObject);
		if(!self.mlTextView) {
			self.mlTextView = [[MLTextView alloc] init];
			self.mlTextView.fieldEditorMarker = self.fieldEditorMarker;
		}
		return self.mlTextView;
	}
	NSText* ret = [super fieldEditor:createFlag forObject:anObject];
//	NSLog(@"fieldEditor for %@",anObject);
	return ret;
}
@end
