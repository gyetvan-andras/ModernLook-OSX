//
//  PBSetupController.m
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 11..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "PBSetupController.h"
#import "PBEntityManager.h"
#import "PBBudget.h"

@interface PBSetupController ()
- (IBAction)setupDone:(id)sender;
- (IBAction)cleanup:(id)sender;

@end

@implementation PBSetupController

- (IBAction)setupDone:(id)sender {
	[[PBEntityManager instance] saveSetup];
}

- (IBAction)cleanup:(id)sender {
	[[PBEntityManager instance] cleanup];
}

@end
