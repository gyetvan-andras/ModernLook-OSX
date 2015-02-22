//
//  PBTransaction.m
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 08..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "PBTransaction.h"
#import "PBEntityManager.h"
#import "PBAccount.h"
#import "PBCategory.h"
#import "PBPayee.h"

@implementation PBTransaction
- (void) setTransactionDate:(NSDate *)transactionDate {
	_transactionDate = nil;
	_transactionDate = transactionDate;
	
	NSCalendar *cal = [NSCalendar currentCalendar];
	unsigned unitFlags = NSCalendarUnitMonth;// | NSCalendarUnitYear |  NSDayCalendarUnit;
	NSDateComponents *components = [cal components:unitFlags fromDate:transactionDate];
	_transactionMonth = [components month];
	_transactionYear = [components year];
	
}

//- (void) save {
//	[super save];
//}

- (void) setAmount:(NSDecimalNumber *)amount {
	_amount = nil;
	_amount = amount;
	if(amount.floatValue < 0) {
		self.outFlow = amount;
	} else {
		self.inFlow = amount;
	}
}

- (void) setInFlow:(NSDecimalNumber *)inFlow {
	_amount = nil;
	_amount = inFlow;
	_inFlow = nil;
	_inFlow = inFlow;
}

- (void) setOutFlow:(NSDecimalNumber *)outFlow {
	_amount = nil;
	float amntf = outFlow.floatValue * -1;
	NSDecimalNumber* amnt = [[NSDecimalNumber alloc] initWithFloat:amntf];
	_amount = amnt;
	_outFlow = nil;
	_outFlow = outFlow;
}

@end
