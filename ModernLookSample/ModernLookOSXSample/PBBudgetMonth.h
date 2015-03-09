//
//  PBBudgetMonth.h
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 12..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PBBudget.h"
#import "PBMonthlyCategoryBudget.h"

@interface PBBudgetMonth : NSObject
@property (nonatomic, weak) PBBudget* budget;
@property (nonatomic,strong) NSNumber* year;
@property (nonatomic,strong) NSNumber* month;
@property (nonatomic, strong, readonly) NSNumber* budgetedAmount;//calculated
@property (nonatomic, strong, readonly) NSNumber* availableAmount;//calculated
@property (nonatomic, strong, readonly) NSNumber* spentAmount;//calculated

@property (nonatomic, strong) NSMutableArray* monthlyCategoryBudgets;

- (instancetype) initWithBudget:(PBBudget*)b year:(NSInteger)y month:(NSInteger)m NS_DESIGNATED_INITIALIZER;

@end
