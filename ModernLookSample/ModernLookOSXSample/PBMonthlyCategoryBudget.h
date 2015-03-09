//
//  PBCategoryBudgetPair.h
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 12..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PBBudget.h"
#import "PBCategory.h"
#import "PBTransaction.h"
#import "PBAccount.h"
#import "PBCategoryBudgetAmount.h"

@interface PBMonthlyCategoryBudget : NSObject
@property (nonatomic, weak) PBCategory* category;
@property (nonatomic, strong) NSMutableArray* subCategoryBudgets;
@property (nonatomic,strong) PBCategoryBudgetAmount* categoryBudget;//loaded
@property (nonatomic, strong) NSMutableArray* transactions;//loaded

@property (nonatomic, strong, readonly) NSDecimalNumber* budgetedAmount;//calculated (parent category) or loaded from categoryBudget (sub category)
@property (nonatomic, strong, readonly) NSDecimalNumber* spentAmount;//calculated
@property (nonatomic, strong, readonly) NSDecimalNumber* availableAmount;//calculated

- (instancetype) initWithCategory:(PBCategory*)cat year:(NSInteger)y month:(NSInteger)m NS_DESIGNATED_INITIALIZER;

@end
