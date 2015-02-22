//
//  PBMonthlyBudget.h
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 09..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "PBEntity.h"
@class PBCategory;

@interface PBCategoryBudgetAmount : PBEntity
@property (nonatomic, weak) PBCategory* category;
@property (nonatomic) NSInteger year;
@property (nonatomic) NSInteger month;
@property (nonatomic, strong) NSDecimalNumber* budgetedAmount;

@end
