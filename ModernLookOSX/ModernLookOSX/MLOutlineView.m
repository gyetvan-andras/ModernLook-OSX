//
//  PBOutlineView.m
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 20..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "MLOutlineView.h"
#import "MLTableHeaderCell.h"
@interface MLOutlineView () {
	NSMutableArray* savedTreeState;
	NSRect oldVisibleRect;
	NSArray* savedSortDescriptors;
}

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
	self.selectionColor = nil;
	savedTreeState = [NSMutableArray array];
	oldVisibleRect = NSZeroRect;
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

- (void) saveTreeState {
	savedTreeState = [NSMutableArray array];
	NSScrollView* sv = [self enclosingScrollView];
	oldVisibleRect = [[sv contentView] documentVisibleRect];
	
	savedSortDescriptors = self.sortDescriptors;
	
	NSNumber* sr = @(self.selectedRow);
	[savedTreeState addObject:sr];
	
	
	for(NSInteger i = 0; i < self.numberOfRows;i++) {
		NSTreeNode* node = [self itemAtRow:i];
		BOOL expanded = [self isItemExpanded:node];
		[savedTreeState addObject:@(expanded)];
	}
}

- (void) restoreTreeState {
	self.sortDescriptors = savedSortDescriptors;
	NSNumber* sr = [savedTreeState firstObject];
	for(NSInteger i = 1; i < savedTreeState.count;i++) {
		NSNumber* n = savedTreeState[i];
		BOOL expanded = n.boolValue;
		if(expanded) {
			[self expandItem:[self itemAtRow:i-1]];
		}
	}
	NSIndexSet* selection = [NSIndexSet indexSetWithIndex:sr.integerValue];
	[self selectRowIndexes:selection byExtendingSelection:NO];
	NSScrollView* sv = [self enclosingScrollView];
	[[sv contentView] scrollToPoint: oldVisibleRect.origin];
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
