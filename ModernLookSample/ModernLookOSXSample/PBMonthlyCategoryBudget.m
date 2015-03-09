//
//  PBCategoryBudgetPair.m
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 12..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "PBMonthlyCategoryBudget.h"

@implementation PBMonthlyCategoryBudget

- (instancetype) initWithCategory:(PBCategory*)cat year:(NSInteger)y month:(NSInteger)m
{
	self = [super init];
	if(self) {
		self.subCategoryBudgets = [NSMutableArray array];
		self.transactions = [NSMutableArray array];
		//1 if it has any sub category, then create PBCategoryBudgetAmount for this category, year and month
		//  load sub categories
		//  calculate budgeted, spent and available amounts from children sub categories (sum them)
		//2 if it is a leaf category then:
		//  load PBCategoryBudgetAmount for this category, year and month
		//  load all PBTransaction for this category, year and month
		//  calculate spent and available amounts
	}
	return self;
}

@end
