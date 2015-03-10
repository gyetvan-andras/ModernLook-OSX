#import <Cocoa/Cocoa.h>
#import "MLToolbar.h"

#define ML_MAIN_WINDOW_ROUNDED_RECT_RADIUS 5
@interface MLMainWindow : NSWindow
@property (weak) IBOutlet NSView *pbContent;
@property (weak) IBOutlet MLToolbar *pbToolbar;

@property (strong) NSColor* fieldEditorMarker;
- (void)showContent:(NSView *)c;
@end
