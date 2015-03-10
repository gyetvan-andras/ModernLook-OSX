//
//  PBTableView.m
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 20..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "MLTableView.h"
#import "MLTableHeaderCell.h"

@interface MLTableView ()
- (void) commonInit;
@end

@implementation MLTableView

- (instancetype) initWithCoder:(NSCoder *)coder {
	self = [super initWithCoder:coder];
	if(self) {
		[self commonInit];
	}
	return self;
}

- (instancetype) initWithFrame:(NSRect)frameRect {
	self = [super initWithFrame:frameRect];
	if(self) {
		[self commonInit];
	}
	return self;
}

//- (void)awakeFromNib
//{
//	[self setAction:@selector(singleClickEdit:)];
//}

//- (void)singleClickEdit: (id)sender
//{
//	NSLog(@"singleClickEdit:");
////	[self editColumn:[self clickedColumn] row:[self clickedRow] withEvent:nil select:NO];
//}

- (void) commonInit {
	NSTableHeaderView *chv = self.headerView;
	chv.frame = NSMakeRect(0, 0, 120, 24);
	for(NSTableColumn *col in self.tableColumns) {
		MLTableHeaderCell* oc = col.headerCell;
		MLTableHeaderCell* cell = [[MLTableHeaderCell alloc] initTextCell:oc.stringValue];//col.title];
		cell.textColor = oc.textColor;
		cell.backgroundColor = oc.backgroundColor;
		cell.drawsBackground = oc.drawsBackground;
		cell.font = oc.font;
		cell.alignment = oc.alignment;
		col.headerCell = cell;
		
	}
}

- (void) setSelectionColor:(NSColor *)selectionColor {
	_selectionColor = selectionColor;
	if(_selectionColor != nil) {
		self.selectionHighlightStyle = NSTableViewSelectionHighlightStyleNone;
	}
}

- (void)drawRow:(NSInteger)row clipRect:(NSRect)clipRect
{
	if(self.selectionColor != nil) {
		NSColor* bgColor = Nil;
		if([NSApplication sharedApplication].active) {
			bgColor = self.selectionColor;
			if([[self window] isMainWindow] && [[self window] isKeyWindow]) {
				bgColor = self.selectionColor;
			} else {
				bgColor = [NSColor colorWithCalibratedWhite:0.800 alpha:1.000];
			}
		} else {
			bgColor = [NSColor colorWithCalibratedWhite:0.800 alpha:1.000];
		}
		
		NSIndexSet* selectedRowIndexes = [self selectedRowIndexes];
		if ([selectedRowIndexes containsIndex:row])
		{
			[bgColor setFill];
			NSRectFill([self rectOfRow:row]);
		}
	}
	[super drawRow:row clipRect:clipRect];
}

@end
