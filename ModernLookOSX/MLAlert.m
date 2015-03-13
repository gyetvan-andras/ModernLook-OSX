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

+ (MLAlertResponse) showQuestion:(NSString*)question title:(NSString*)title withCancel:(BOOL)withCancel buttonsTitle:(NSArray*)titles {
	MLAlert* alert = [[MLAlert alloc] init];
	if(!withCancel) {
		alert.cancel.hidden = YES;
	}
	alert.title.stringValue = title;
	alert.message.stringValue = question;
	if(titles.count == 3) {
		alert.cancel.title = titles[0];
		alert.yes.title = titles[1];
		alert.no.title = titles[2];
	} else {
		alert.yes.title = titles[0];
		alert.no.title = titles[1];
	}
	[alert resizeButtons];
	MLAlertResponse res = [alert runAlert];
	[alert.window close];
	return res;
}

+ (MLAlertResponse) showQuestion:(NSString*)question title:(NSString*)title withCancel:(BOOL)withCancel {
	return [MLAlert showQuestion:question title:title withCancel:withCancel buttonsTitle:@[@"Cancel",@"Yes",@"No"]];
}

- (instancetype) init {
	self = [super initWithWindowNibName:@"MLAlertYesNoCancel"];
	if(self) {
		[self loadWindow];
		[self.window setStyleMask:NSBorderlessWindowMask];
	}
	return self;
}

- (void) resizeButtons {
//	[self.no sizeToFit];
//	[self.yes sizeToFit];
//	[self.cancel sizeToFit];
	
	NSRect cr = self.cancel.bounds;
	NSRect yr = self.yes.bounds;
	NSRect nr = self.no.bounds;
	
	cr.size.width = self.cancel.frame.size.width + 10;
	yr.size.width = self.yes.frame.size.width + 10;
	nr.size.width = self.no.frame.size.width + 10;
	
	if(cr.size.width < 85) cr.size.width = 85;
	if(yr.size.width < 85) yr.size.width = 85;
	if(nr.size.width < 85) nr.size.width = 85;
	
	self.no.bounds = nr;
	self.yes.bounds = yr;
	self.cancel.bounds = cr;
	
	self.no.needsDisplay = YES;
	self.yes.needsDisplay = YES;
	self.cancel.needsDisplay = YES;
	
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
