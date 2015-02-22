//
//  PBBudgetMonth.m
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 12..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "PBBudgetMonth.h"

@interface PBBudgetMonth ()
- (void) loadBudget;
@end

@implementation PBBudgetMonth
- (void) setYear:(NSNumber *)year {
	_year = nil;
	_year = year;
	[self loadBudget];
}

- (void) setMonth:(NSNumber *)month {
	_month = nil;
	_month = month;
	[self loadBudget];
}

- (id) initWithBudget:(PBBudget*)b year:(NSInteger)y month:(NSInteger)m {
	self = [super init];
	if(self) {
		self.budget = b;
		self.year = [NSNumber numberWithInteger:y];
		self.month = [NSNumber numberWithInteger:m];
		[self loadBudget];
		_budgetedAmount = [NSNumber numberWithFloat:12.345654643654f];
		_availableAmount = [NSNumber numberWithFloat:0.0f];
		_spentAmount = [NSNumber numberWithFloat:-21.22f];
	}
	return self;
}

- (void) loadBudget {
	//create PBMonthlyCategoryBudgets for every category in the budget
	//calculate budgeted, spent and available amounts
	
}
@end
