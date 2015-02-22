//
//  PBTransaction.h
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 08..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PBEntity.h"
@class PBAccount;
@class PBCategory;
@class PBPayee;

@interface PBTransaction : PBEntity
@property (nonatomic, weak) PBAccount* account;
@property (nonatomic, weak) PBCategory* category;

@property (nonatomic, strong) NSDecimalNumber* amount;
@property (nonatomic, strong) NSDecimalNumber* inFlow;//calculated
@property (nonatomic, strong) NSDecimalNumber* outFlow;//calculated

@property (nonatomic, strong) NSString* memo;
@property (nonatomic, weak) PBPayee* payee;

@property (nonatomic, strong) NSDate* transactionDate;
@property (nonatomic, readonly) NSInteger transactionYear;
@property (nonatomic, readonly) NSInteger transactionMonth;

@property (nonatomic) BOOL transfer;
@property (nonatomic, weak) PBTransaction* inverseTransaction;

@end
