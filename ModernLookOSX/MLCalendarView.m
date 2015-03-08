//
//  MLCalendarPopup.m
//  ModernLookOSX
//
//  Created by András Gyetván on 2015. 03. 08..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "MLCalendarView.h"
#import "MLCalendarCell.h"
@interface MLCalendarView ()

@property (weak) IBOutlet NSTextField *calendarTitle;
- (IBAction)nextMonth:(id)sender;
- (IBAction)prevMonth:(id)sender;

@property (strong) NSMutableArray* dayLabels;
@property (strong) NSMutableArray* dayCells;
- (id) viewByID:(NSString*)_id;
- (void) layoutCalendar;
- (void) stepMonth:(NSInteger)dm;
@end

@implementation MLCalendarView

- (instancetype) init {
	self = [super initWithNibName:@"MLCalendarView" bundle:[NSBundle bundleForClass:[self class]]];
	if (self != nil) {
		[self commonInit];
	}
	
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
	self = [super initWithCoder:coder];
	if(self) {
		[self commonInit];
	}
	return self;
}

- (void) commonInit {
	self.backgroundColor = [NSColor whiteColor];
	self.textColor = [NSColor blackColor];
	self.selectionColor = [NSColor redColor];
	self.todayMarkerColor = [NSColor greenColor];
	self.dayMarkerColor = [NSColor darkGrayColor];
	self.dayCells = [NSMutableArray array];
	for(int i = 0; i < 6; i++) {
		[self.dayCells addObject:[NSMutableArray array]];
	}
}

- (void)viewDidLoad {
    [super viewDidLoad];
	self.dayLabels = [NSMutableArray array];
	for(int i = 1; i < 8; i++) {
		NSString* _id = [NSString stringWithFormat:@"day%d",i];
		NSTextField* d = [self viewByID:_id];
		[self.dayLabels addObject:d];
	}
	for(int row = 0; row < 6;row++) {
		for(int col = 0; col < 7; col++) {
			int i = (row*7)+col+1;
			NSString* _id = [NSString stringWithFormat:@"c%d",i];
			MLCalendarCell* cell = [self viewByID:_id];
			cell.target = self;
			cell.action = @selector(cellClicked:);
			[self.dayCells[row] addObject:cell];
			cell.owner = self;
		}
	}
	NSDateFormatter *df = [[NSDateFormatter alloc] init];
	NSArray *days = [df shortStandaloneWeekdaySymbols];
	for(NSInteger i = 0; i < days.count;i++) {
		NSString* day = [days[i] uppercaseString];
		NSInteger col = [self colForDay:i+1];
		NSTextField* tf = self.dayLabels[col];
		tf.stringValue = day;
	}
	self.date = [NSDate date];
//	[self layoutCalendar];
}

- (id) viewByID:(NSString*)_id {
	for (NSView *subview in self.view.subviews) {
		if([subview.identifier isEqualToString:_id]) {
			return subview;
		}
	}
	return nil;
}

- (void) setDate:(NSDate *)date {
	_date = date;
	[self layoutCalendar];
	NSCalendar *cal = [NSCalendar currentCalendar];
	unsigned unitFlags = NSCalendarUnitDay| NSCalendarUnitYear | NSCalendarUnitMonth;
	NSDateComponents *components = [cal components:unitFlags fromDate:self.date];
	NSInteger month = components.month;
	NSInteger year = components.year;
	
	NSDateFormatter *df = [[NSDateFormatter alloc] init];
	NSString *monthName = [[df standaloneMonthSymbols] objectAtIndex:month-1];
	NSString* mnFirstLetter = [[monthName substringToIndex:1] uppercaseString];
	NSString* mnLastPart = [monthName substringFromIndex:1];
	monthName = [NSString stringWithFormat:@"%@%@",mnFirstLetter,mnLastPart];
	NSString* budgetDateSummary = [NSString stringWithFormat:@"%@, %ld",monthName,year];
	self.calendarTitle.stringValue = budgetDateSummary;
}

- (void)cellClicked:(id)sender {
	for(int row = 0; row < 6;row++) {
		for(int col = 0; col < 7; col++) {
			MLCalendarCell*cell = self.dayCells[row][col];
			cell.selected = NO;
		}
	}
	MLCalendarCell* cell = sender;
	cell.selected = YES;
}

- (NSDate*) monthDay:(NSInteger)day {
	NSCalendar *cal = [NSCalendar currentCalendar];
	unsigned unitFlags = NSCalendarUnitDay| NSCalendarUnitYear | NSCalendarUnitMonth;
	NSDateComponents *components = [cal components:unitFlags fromDate:self.date];
	components.day = day;
	return [cal dateFromComponents:components];
}

- (NSInteger) lastDayOfTheMonth {
	NSCalendar *currentCalendar = [NSCalendar currentCalendar];
	NSRange daysRange = [currentCalendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self.date];
	return daysRange.length;
}

- (NSInteger) colForDay:(NSInteger)day {
	NSCalendar *cal = [NSCalendar currentCalendar];
	if(cal.firstWeekday != 1) {
		day--;
		if(day < 1) day = 7;
	}
	
	return day - 1;
}

- (void) layoutCalendar {
	for(int row = 0; row < 6;row++) {
		for(int col = 0; col < 7; col++) {
			MLCalendarCell*cell = self.dayCells[row][col];
			cell.representedDate = nil;
		}
	}
	NSCalendar *cal = [NSCalendar currentCalendar];
	unsigned unitFlags = NSCalendarUnitWeekday;
	NSDateComponents *components = [cal components:unitFlags fromDate:[self monthDay:1]];
	NSInteger firstDay = components.weekday;
	NSInteger lastDay = [self lastDayOfTheMonth];
	NSInteger col = [self colForDay:firstDay];
	NSInteger day = 1;
	for(int row = 0; row < 6;row++) {
		for(; col < 7; col++) {
			if(day <= lastDay) {
				MLCalendarCell*cell = self.dayCells[row][col];
				cell.representedDate = [self monthDay:day];
				day++;
			}
		}
		col = 0;
	}
}

- (void) stepMonth:(NSInteger)dm {
	NSCalendar *cal = [NSCalendar currentCalendar];
	unsigned unitFlags = NSCalendarUnitDay| NSCalendarUnitYear | NSCalendarUnitMonth;
	NSDateComponents *components = [cal components:unitFlags fromDate:self.date];
	NSInteger month = components.month + dm;
	NSInteger year = components.year;
	if(month > 12) {
		month = 1;
		year++;
	};
	if(month < 1) {
		month = 12;
		year--;
	}
	components.year = year;
	components.month = month;
	self.date = [cal dateFromComponents:components];
}

- (IBAction)nextMonth:(id)sender {
	[self stepMonth:1];
}

- (IBAction)prevMonth:(id)sender {
	[self stepMonth:-1];
}

@end
