//
//  PBCategory.m
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 08..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "PBCategory.h"
#import "PBBudget.h"
#import "PBEntityManager.h"
@interface PBCategory()
@end

@implementation PBCategory
- (instancetype) init {
	self = [super init];
	if(self) {
		self.subCategories = [NSMutableArray array];
		self.name = @"New Category";
	}
	return self;
}

- (NSString*) description {
	return self.name;
}
@end

