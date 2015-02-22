//
//  PBEntityManager.h
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 08..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import <Foundation/Foundation.h>

#define BUDGETS_TABLE_NAME @"budgets"
#define ACCOUNTS_TABLE_NAME @"accounts"
#define TRANSACTIONS_TABLE_NAME @"transactionss"
#define CATEGORIES_TABLE_NAME @"categories"
#define CATEGORY_BUDGETS_TABLE_NAME @"category_budgets"
#define PAYEES_TABLE_NAME @"payees"

@class PBBudget;

@class PBPayee;
@class PBCategory;
@class PBAccount;

@interface PBEntityManager : NSObject
+ (PBEntityManager*) instance;

@property (nonatomic, strong) PBBudget* currentBudget;
@property (nonatomic, strong) NSMutableArray* budgets;
//- (PBBudget*) loadBudget;
//- (NSArray*) accountOfBudgets:(PBBudget*)budget;

- (PBPayee*) payeeByUID:(NSString*)uid;
- (PBCategory*) categoryByUID:(NSString*)uid;
- (PBAccount*) accountByUID:(NSString*)uid;

- (void) saveSetup;
- (void) cleanup;
@end
