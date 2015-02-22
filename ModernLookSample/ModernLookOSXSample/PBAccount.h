//
//  PBAccount.h
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 08..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PBEntity.h"

@class PBBudget;

@interface PBAccount : PBEntity
@property (nonatomic, weak) PBBudget* budget;
@property (nonatomic, strong) NSString* name;
@property (nonatomic) BOOL budgeted;
//@property (nonatomic, strong) NSMutableArray* transactions;
//@property (nonatomic, strong) NSMutableArray* payees;
@end
