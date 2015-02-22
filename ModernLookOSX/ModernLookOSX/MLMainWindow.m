
#import "MLMainWindow.h"

#import <AppKit/AppKit.h>

@interface MLMainWindow ()
@end

@implementation MLMainWindow

- (id)initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag
{
	self = [super initWithContentRect:contentRect styleMask:NSBorderlessWindowMask backing:bufferingType defer:flag];
	
	if ( self )
	{
		[self setOpaque:NO];
		[self setBackgroundColor:[NSColor clearColor]];
		[self setMovableByWindowBackground:TRUE];
		[self setStyleMask:NSBorderlessWindowMask|NSResizableWindowMask];
		[self setHasShadow:YES];
		[self setAppearance:[NSAppearance appearanceNamed:NSAppearanceNameVibrantDark]];
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
	[self.pbContent removeConstraints:self.pbContent.constraints];
	
	[c setTranslatesAutoresizingMaskIntoConstraints:NO];
	
	self.pbContent.subviews = [NSArray arrayWithObject:c];
	
	NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(c);
	[self.pbContent addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[c]|" options:0 metrics:nil views:viewsDictionary]];
	[self.pbContent addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[c]|" options:0 metrics:nil views:viewsDictionary]];
}

@end
