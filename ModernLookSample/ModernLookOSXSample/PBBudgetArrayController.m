//
//  PBBudgetsArrayController.m
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 11..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "PBBudgetArrayController.h"
#import "PBBudget.h"
#import "PBEntityManager.h"

@implementation PBBudgetArrayController
- (void) add:(id)sender {
	PBBudget* b = [[PBBudget alloc] init];
	b.name = @"New Budget";
	[self addObject:b];
	[[PBEntityManager instance].budgets addObject:b];
}
@end
