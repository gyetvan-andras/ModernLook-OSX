//
//  PBTableHeaderCell.m
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 20..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "MLTableHeaderCell.h"

@implementation MLTableHeaderCell

- (id) initTextCell:(NSString *)aString {
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
	
	NSMutableParagraphStyle * aParagraphStyle = [[NSMutableParagraphStyle alloc] init];
	[aParagraphStyle setLineBreakMode:NSLineBreakByWordWrapping];
	[aParagraphStyle setAlignment:self.alignment];
	
//	NSMutableDictionary *attrs = [
//		[NSMutableDictionary dictionaryWithDictionary:
//		[[self attributedStringValue] attributesAtIndex:0 effectiveRange:NULL]]
//		mutableCopy];
//	[attrs setObject:aParagraphStyle forKey:NSParagraphStyleAttributeName];
	NSDictionary *attrs = [NSDictionary dictionaryWithObjects:@[aParagraphStyle,self.font,self.textColor]
													  forKeys:@[NSParagraphStyleAttributeName,NSFontAttributeName,NSForegroundColorAttributeName]];
	
	[[self stringValue] drawInRect:cellFrame withAttributes:attrs];
	
	[[NSColor blackColor] set];
	NSBezierPath *bottomLine = [NSBezierPath bezierPath];
	NSPoint p = cellFrame.origin;
	p.y += cellFrame.size.height;
	[bottomLine moveToPoint:p];
	
	p.x += cellFrame.size.width;
	[bottomLine lineToPoint:p];
	[bottomLine stroke];

}

@end
