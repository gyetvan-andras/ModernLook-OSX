//
//  PBPayee.h
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 08..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "PBEntity.h"

@class PBBudget;
@class PBCategory;

@interface PBPayee : PBEntity

@property (nonatomic, weak) PBBudget* budget;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSMutableArray* categories;

@end
