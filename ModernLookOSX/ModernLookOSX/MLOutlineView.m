//
//  PBOutlineView.m
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 20..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "MLOutlineView.h"
#import "MLTableHeaderCell.h"
@interface MLOutlineView ()
- (void) commonInit;
@end

@implementation MLOutlineView

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

@end
