//
//  PBCategoryContent.h
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 14..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PBBudget.h"
#import <ModernLookOSX/ModernLookOSX.h>

@interface PBCategoryContent : MLPopupContent <NSOutlineViewDelegate>
@property (nonatomic, weak) PBBudget* budget;
- (instancetype) initWithBudget:(PBBudget*)budget NS_DESIGNATED_INITIALIZER;

@end
