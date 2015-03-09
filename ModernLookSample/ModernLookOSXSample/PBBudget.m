//
//  PBBudget.m
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 08..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "PBBudget.h"
#import "PBEntityManager.h"
#import "PBAccount.h"
#import "PBPayee.h"
#import "PBCategory.h"

@interface PBBudget (hidden)
- (void) loadAccounts;
- (void) loadPayees;
- (void) loadCategories;
@end
@implementation PBBudget

- (instancetype) init {
	self = [super init];
	if(self) {
		self.accounts = [NSMutableArray array];
		self.payees = [NSMutableArray array];
		self.categories = [NSMutableArray array];
	}
	return self;
}
@end
