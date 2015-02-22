//
//  PBCategory.h
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 08..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PBEntity.h"

@class PBBudget;

@interface PBCategory : PBEntity
@property (nonatomic, weak) PBBudget* budget;
@property (nonatomic, weak) PBCategory* parent;
@property (nonatomic, strong) NSMutableArray* subCategories;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSNumber* seq;

@end
