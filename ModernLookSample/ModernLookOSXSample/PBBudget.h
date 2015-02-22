//
//  PBBudget.h
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 08..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PBEntity.h"

@interface PBBudget : PBEntity
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSMutableArray* accounts;
@property (nonatomic, strong) NSMutableArray* payees;
@property (nonatomic, strong) NSMutableArray* categories;

@end
