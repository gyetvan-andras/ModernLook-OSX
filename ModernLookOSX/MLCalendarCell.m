//
//  NSCalendarCell.m
//  ModernLookOSX
//
//  Created by András Gyetván on 2015. 03. 08..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "MLCalendarCell.h"
#import "MLCalendarView.h"
@interface MLCalendarCell ()
- (void) commonInit;
- (BOOL) isToday;
@end

@implementation MLCalendarCell

- (instancetype)initWithFrame: (NSRect)frameRect
{
	self = [super initWithFrame: frameRect];
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
	self.bordered = NO;
	self.representedDate = nil;
}

- (BOOL) isToday {
	if(self.representedDate) {
		NSCalendar *cal = [NSCalendar currentCalendar];
		unsigned unitFlags = NSCalendarUnitDay | NSCalendarUnitYear | NSCalendarUnitMonth;
		NSDateComponents *components = [cal components:unitFlags fromDate:_representedDate];
		NSInteger ry = components.year;
		NSInteger rm = components.month;
		NSInteger rd = components.day;
		components = [cal components:unitFlags fromDate:[NSDate date]];
		NSInteger ty = components.year;
		NSInteger tm = components.month;
		NSInteger td = components.day;
		return (ry == ty && rm == tm && rd == td);
	} else {
		return NO;
	}
}

- (void) setSelected:(BOOL)selected {
	_selected = selected;
	self.needsDisplay = YES;
}

- (void) setRepresentedDate:(NSDate *)representedDate {
	_representedDate = representedDate;
	if(_representedDate) {
		NSCalendar *cal = [NSCalendar currentCalendar];
		unsigned unitFlags = NSCalendarUnitDay;// | NSCalendarUnitYear | NSCalendarUnitMonth;
		NSDateComponents *components = [cal components:unitFlags fromDate:_representedDate];
		NSInteger day = components.day;
		self.title = [NSString stringWithFormat:@"%ld",day];
	} else {
		self.title = @"";
	}
}

- (void)drawRect:(NSRect)dirtyRect {
	if(self.owner) {
		[NSGraphicsContext saveGraphicsState];
		
		NSRect bounds = [self bounds];
		
//		if(self.isHighlighted) {
//			[[NSColor grayColor] set];
//		} else {
//		}
		
		[self.owner.backgroundColor set];
		NSRectFill(bounds);
		
		
		if(self.representedDate) {
			//selection
			if(self.selected) {
				NSRect circeRect = NSInsetRect(bounds, 4.0f, 4.0f);
				NSBezierPath* bzc = [NSBezierPath bezierPathWithOvalInRect:circeRect];
				[self.owner.selectionColor set];
				[bzc fill];
			}
			
			NSMutableParagraphStyle * aParagraphStyle = [[NSMutableParagraphStyle alloc] init];
			[aParagraphStyle setLineBreakMode:NSLineBreakByWordWrapping];
			[aParagraphStyle setAlignment:NSCenterTextAlignment];
			
			
			//title
			NSDictionary *attrs = @{NSParagraphStyleAttributeName: aParagraphStyle,NSFontAttributeName: self.font,NSForegroundColorAttributeName: self.owner.textColor};
			
			NSSize size = [self.title sizeWithAttributes:attrs];
			
			NSRect r = NSMakeRect(bounds.origin.x,// + (bounds.size.width - size.width)/2.0,
								  bounds.origin.y + (bounds.size.height - size.height)/2.0,
								  bounds.size.width,
								  size.height);
			
			[self.title drawInRect:r withAttributes:attrs];
			
			
			//line
			NSBezierPath* topLine = [NSBezierPath bezierPath];
			[topLine moveToPoint:NSMakePoint(NSMinX(bounds), NSMinY(bounds))];
			[topLine lineToPoint:NSMakePoint(NSMaxX(bounds), NSMinY(bounds))];
			[self.owner.dayMarkerColor set];
			topLine.lineWidth = 0.3f;
			[topLine stroke];
			if([self isToday]) {
				[self.owner.todayMarkerColor set];
				NSBezierPath* bottomLine = [NSBezierPath bezierPath];
				[bottomLine moveToPoint:NSMakePoint(NSMinX(bounds), NSMaxY(bounds))];
				[bottomLine lineToPoint:NSMakePoint(NSMaxX(bounds), NSMaxY(bounds))];
				bottomLine.lineWidth = 4.0f;
				[bottomLine stroke];
			}
		}
		[NSGraphicsContext restoreGraphicsState];
	}
}

@end
