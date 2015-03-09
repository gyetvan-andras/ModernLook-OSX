//
//  AppDelegate.m
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 08..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//
#import <WebKit/WebKit.h>
#import "PBAppDelegate.h"
#import <ModernLookOSX/ModernLookOSX.h>
#import "PBBudget.h"
#import "PBEntityManager.h"
#import "PBBudgetMonth.h"
@interface PBAppDelegate ()
@property (weak) IBOutlet NSArrayController *budgets;
@property (weak) IBOutlet NSObjectController *monthlyBudget;

@property (weak) IBOutlet MLMainWindow *window;

@property (weak) IBOutlet MLContentView *settingsView;
@property (weak) IBOutlet MLContentView *budgetView;
@property (weak) IBOutlet MLContentView *accountsView;
@property (weak) IBOutlet MLContentView *predictionView;

@property (weak) IBOutlet WebView *webView;
@property (strong) 	NSPopover* calendarPopover;
@property (weak) IBOutlet MLCalendarView *calendarPopoverContent;

- (IBAction)showCalendar:(id)sender;

- (IBAction)pageSelectionChanged:(MLRadioGroupManager *)sender;

@end

@implementation PBAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	[self.budgets addObjects:[PBEntityManager instance].budgets];
	if([PBEntityManager instance].budgets.count > 0) {
		[self.budgets setSelectionIndex:0];
	}
	
	PBBudgetMonth* bm = [[PBBudgetMonth alloc] initWithBudget:nil year:2015 month:2];
	self.monthlyBudget.content = bm;
	[self.window showContent:self.budgetView];
	
	
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
	// Insert code here to tear down your application
}

- (BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
	return YES;
}

- (void) createCalendarPopover {
	NSPopover* myPopover = self.calendarPopover;
	if(!myPopover) {
		myPopover = [[NSPopover alloc] init];
		MLCalendarView* cp = [[MLCalendarView alloc] init];
		cp.delegate = self;
		myPopover.contentViewController = cp;
		myPopover.appearance = [NSAppearance appearanceNamed:NSAppearanceNameAqua];//]LightContent];
		myPopover.animates = YES;
		myPopover.behavior = NSPopoverBehaviorTransient;
//		myPopover.delegate = self;
	}
	self.calendarPopover = myPopover;
}

- (IBAction)showCalendar:(id)sender {
	[self createCalendarPopover];
	NSButton* btn = sender;
	NSRect cellRect = [btn bounds];
	[self.calendarPopover showRelativeToRect:cellRect ofView:btn preferredEdge:NSMaxYEdge];
	
}

- (void) didSelectDate:(NSDate *)selectedDate {
	[self.calendarPopover close];
}

- (IBAction)pageSelectionChanged:(MLRadioGroupManager *)sender {
	switch(sender.selectedItem) {
		case 1: [self.window showContent:self.settingsView];
			break;
		case 2: [self.window showContent:self.accountsView];
			break;
		case 3: [self.window showContent:self.budgetView];
			break;
		case 4: [self.window showContent:self.predictionView];
			NSString *resourcesPath = [[NSBundle mainBundle] resourcePath];
			NSString *htmlPath = [resourcesPath stringByAppendingPathComponent:@"line.html"];
			[[self.webView mainFrame] loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:htmlPath]]];
			break;
			
	}
}

@end
