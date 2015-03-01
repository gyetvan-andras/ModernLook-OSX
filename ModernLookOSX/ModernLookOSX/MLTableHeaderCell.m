//
//  PBTableHeaderCell.m
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 20..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "MLTableHeaderCell.h"

@implementation MLTableHeaderCell

- (instancetype) initTextCell:(NSString *)aString {
	self = [super initTextCell:aString];
	if(self) {
		self.controlTint = NSClearControlTint;
	}
	return self;
}

- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView {
//	[self.backgroundColor set];
	[[NSColor whiteColor] set];
	NSRectFill(cellFrame);
	
	NSRect textCell = cellFrame;
	textCell.origin.x += 4;
	textCell.size.width -= 8;
	NSMutableParagraphStyle * aParagraphStyle = [[NSMutableParagraphStyle alloc] init];
	[aParagraphStyle setLineBreakMode:NSLineBreakByWordWrapping];
	[aParagraphStyle setAlignment:self.alignment];
	
	NSDictionary *attrs = @{NSParagraphStyleAttributeName: aParagraphStyle,NSFontAttributeName: self.font,NSForegroundColorAttributeName: self.textColor};
	
	[[self stringValue] drawInRect:textCell withAttributes:attrs];
	
	[[NSColor gridColor] set];
	NSBezierPath *sepLine = [NSBezierPath bezierPath];
	NSPoint p = cellFrame.origin;
	p.y = 8;
	p.x += cellFrame.size.width;
	[sepLine moveToPoint:p];
	
	p.y += 10;//cellFrame.size.height - 16;
	
	[sepLine lineToPoint:p];
	[sepLine stroke];
	
	[[NSColor blackColor] set];
	NSBezierPath *bottomLine = [NSBezierPath bezierPath];
	p = cellFrame.origin;
	p.y += cellFrame.size.height;
	[bottomLine moveToPoint:p];
	
	p.x += cellFrame.size.width;
	[bottomLine lineToPoint:p];
	[bottomLine stroke];

}

@end
