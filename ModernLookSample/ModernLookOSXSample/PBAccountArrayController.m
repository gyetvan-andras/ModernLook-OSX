//
//  PBAccountArrayController.m
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 11..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "PBAccountArrayController.h"
#import "PBAccount.h"
@implementation PBAccountArrayController

- (void) add:(id)sender {
	PBAccount* a = [[PBAccount alloc] init];
	a.name = @"New Account";
	a.budgeted = YES;
	[self addObject:a];
}
@end
