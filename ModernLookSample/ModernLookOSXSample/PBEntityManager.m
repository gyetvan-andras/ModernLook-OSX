//
//  PBEntityManager.m
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 08..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "PBEntityManager.h"
#import "PBBudget.h"
#import "PBAccount.h"
#import "PBCategory.h"
#import "PBPayee.h"
#import "PBBudgetTemplates.h"

#define APP_KEY     @"4u0rtj7g4zz51lj"
#define APP_SECRET  @"iiyhhgwh9y8z7qw"

PBEntityManager* _entityManager;
@interface PBEntityManager ()
- (void) loadBudgets;
@end;

@implementation PBEntityManager
+ (PBEntityManager*) instance
{
	if(!_entityManager) {
		_entityManager = [[PBEntityManager alloc] init];
		[_entityManager loadBudgets];
	}
	return _entityManager;
}

- (instancetype) init {
	self = [super init];
	if(self) {
	}
	self.budgets = [NSMutableArray array];
	return self;
}

- (void) loadBudgets {
	PBBudgetTemplates* bt = [[PBBudgetTemplates alloc] init];
	[self.budgets addObject:[bt createHomeBudget]];
	[self.budgets addObject:[bt createSmallOfficeBudget]];
}

- (void) cleanup {
}

- (PBPayee*) payeeByUID:(NSString*)uid {
	PBPayee* ret = nil;
	for(PBPayee* p in self.currentBudget.payees) {
		if([p.uid isEqualToString:uid]) {
			ret = p;
			break;
		}
	}
	return ret;
}

- (PBCategory*) categoryByUID:(NSString*)uid {
	PBCategory* ret = nil;
	for(PBCategory* c in self.currentBudget.categories) {
		if([c.uid isEqualToString:uid]) {
			ret = c;
			break;
		}
	}
	return ret;
}

- (PBAccount*) accountByUID:(NSString*)uid {
	PBAccount* ret = nil;
	for(PBAccount* a in self.currentBudget.accounts) {
		if([a.uid isEqualToString:uid]) {
			ret = a;
			break;
		}
	}
	return ret;
}

- (void) saveSetup {
}

@end
