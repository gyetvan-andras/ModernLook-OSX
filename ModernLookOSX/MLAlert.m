//
//  MLAlert.m
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 27..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "MLAlert.h"

@interface MLAlert ()
@property (weak) IBOutlet NSTextField *title;
@property (weak) IBOutlet NSTextField *message;
@property (weak) IBOutlet NSButton *cancel;
@property (weak) IBOutlet NSButton *yes;
@property (weak) IBOutlet NSButton *no;

- (IBAction)doCancel:(id)sender;
- (IBAction)doYes:(id)sender;
- (IBAction)doNo:(id)sender;

@property MLAlertResponse alertResponse;
- (MLAlertResponse) runAlert;

@end

@implementation MLAlert

+ (MLAlertResponse) showQuestion:(NSString*)question title:(NSString*)title withCancel:(BOOL)withCancel {
	MLAlert* alert = [[MLAlert alloc] init];
	if(!withCancel) {
		alert.cancel.hidden = YES;
	}
	alert.title.stringValue = title;
	alert.message.stringValue = question;
	MLAlertResponse res = [alert runAlert];
	[alert.window close];
	
	return res;
}

- (id) init {
	self = [super initWithWindowNibName:@"MLAlertYesNoCancel"];
	if(self) {
		[self loadWindow];
		[self.window setStyleMask:NSBorderlessWindowMask];
	}
	return self;
}

- (MLAlertResponse) runAlert {
	NSInteger runSessionRes;
	NSModalSession session = [NSApp beginModalSessionForWindow:self.window];
	for (;;) {
		runSessionRes = [NSApp runModalSession:session];
		if (runSessionRes != NSModalResponseContinue) break;
	}
	[NSApp endModalSession:session];
	return (MLAlertResponse)runSessionRes;
}

- (void) windowWillClose:(NSNotification *)notification {
//	[[NSApplication sharedApplication] stopModal];
}


- (void)windowDidLoad {
    [super windowDidLoad];
}

- (IBAction)doCancel:(id)sender {
	[NSApp stopModalWithCode:MLALERT_CANCEL];
}

- (IBAction)doYes:(id)sender {
	[NSApp stopModalWithCode:MLALERT_YES];
}

- (IBAction)doNo:(id)sender {
	[NSApp stopModalWithCode:MLALERT_NO];
}
@end
