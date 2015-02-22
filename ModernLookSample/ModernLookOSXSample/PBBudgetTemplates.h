//
//  PBBudgetTemplates.h
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 21..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PBBudget.h"

@interface PBBudgetTemplates : NSObject
- (PBBudget*) createHomeBudget;
- (PBBudget*) createSmallOfficeBudget;
@end
