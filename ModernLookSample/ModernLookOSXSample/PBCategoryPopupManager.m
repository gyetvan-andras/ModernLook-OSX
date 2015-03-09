//
//  PBCategoryPopupManager.m
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 15..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "PBCategoryPopupManager.h"
#import "PBCategoryContent.h"
#import <ModernLookOSX/ModernLookOSX.h>
@implementation PBCategoryPopupManager
- (MLPopupContent*) createPopupContent {
	PBBudget* b = (self.budgets.arrangedObjects)[self.budgets.selectionIndex];
	PBCategoryContent* c = [[PBCategoryContent alloc] initWithBudget:b];
	return c;
}

@end
