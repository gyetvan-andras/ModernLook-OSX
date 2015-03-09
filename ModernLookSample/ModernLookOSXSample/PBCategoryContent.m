//
//  PBCategoryContent.m
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 14..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "PBCategoryContent.h"
#import "PBCategory.h"

@interface PBCategoryContent ()
@property (strong) IBOutlet NSObjectController *budgetController;
@property (strong) IBOutlet NSTreeController *categories;
@property (weak) IBOutlet NSOutlineView *tree;
@property (nonatomic) BOOL disableSelectionNotification;
- (void) makeSelectionVisible;
@end

@implementation PBCategoryContent
- (instancetype) initWithBudget:(PBBudget*)budget {
	self = [super initWithNibName:@"PBCategoryContent" bundle:[NSBundle bundleForClass:[self class]]];
	if(self) {
		self.budget = budget;
		self.disableSelectionNotification = NO;
	}
	return self;
}

- (void)loadView {
	[super loadView];
	[self.tree expandItem:nil expandChildren:YES];
	self.tree.delegate = self;
}

- (void) makeSelectionVisible {
	NSRect selRect = [self.tree rectOfRow:self.tree.selectedRow];
	[self.tree scrollRectToVisible:selRect];
}

- (void) moveSelectionUp:(BOOL)up {
	NSInteger i = self.tree.selectedRow;
	if(up) i -= 1;
	else i += 1;
	NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:i];
	[self.tree selectRowIndexes:indexSet byExtendingSelection:NO];
	[self makeSelectionVisible];
}

- (void)outlineViewSelectionDidChange:(NSNotification *)notification {
	if(!self.disableSelectionNotification) {
		NSArray *sa = self.categories.selectedObjects;
		[self.delegate selectionDidChange:sa.firstObject fromUpDown:YES];
	}
}

- (BOOL) childByName:(NSString*) name children:(NSArray*)children indexes:(NSMutableArray*)indexes {
	BOOL ret = NO;
	for(NSUInteger i = 0; i < children.count;i++) {
		PBCategory* cat = children[i];
		[indexes addObject:@(i)];
		if([cat.name hasPrefix:name]) {
			ret = YES;
			break;
		} else {
			ret = [self childByName:name children:cat.subCategories indexes:indexes];
			if(!ret) [indexes removeLastObject];
			else break;
		}
	}
	return ret;
}

- (NSString*) moveSelectionTo:(NSString*)str {
	self.disableSelectionNotification = YES;
	NSMutableArray* indexes = [NSMutableArray array];
	if([self childByName:str children:self.budget.categories indexes:indexes]) {
		NSIndexPath* selection = nil;
		for(NSNumber* n in indexes) {
			if(selection) {
				selection = [selection indexPathByAddingIndex:n.integerValue];
			} else {
				selection = [NSIndexPath indexPathWithIndex:n.intValue];
			}
		}
		self.categories.selectionIndexPath = selection;
		NSArray *sa = self.categories.selectedObjects;
		PBCategory* c = sa.firstObject;
		NSString* s = c.name;
		self.disableSelectionNotification = NO;
		return s;
	}
	self.disableSelectionNotification = NO;
	[self makeSelectionVisible];
	return nil;//i != self.tree.selectedRow;
}

- (BOOL) outlineView:(NSOutlineView *)outlineView shouldShowOutlineCellForItem:(id)item {
	return NO;
}

- (BOOL) outlineView:(NSOutlineView *)outlineView shouldShowCellExpansionForTableColumn:(NSTableColumn *)tableColumn item:(id)item {
	return NO;
}
@end
