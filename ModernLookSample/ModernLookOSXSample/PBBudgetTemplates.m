//
//  PBBudgetTemplates.m
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 21..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "PBBudgetTemplates.h"
#import "PBCategory.h"

@interface PBBudgetTemplates ()
- (PBCategory*) createCategoryWithName:(NSString*)name andParent:(PBCategory*)owner;
- (void) createSubCategoriesWithName:(NSArray*)names forParent:(PBCategory*)parent;
@end;

@implementation PBBudgetTemplates
- (PBBudget*) createHomeBudget {
	PBBudget* ret = [[PBBudget alloc] init];
	ret.name = @"Home Budget";
	PBCategory* c = nil;
	
	c = [self createCategoryWithName:@"Monthly Bills" andParent:nil];
	[ret.categories addObject:c];
	[self createSubCategoriesWithName:@[
										@"Rent/Morgage",
										@"Phone",
										@"Internet",
										@"Cable TV",
										@"Electricity",
										@"Water",
										@"Natural Gas/Propane/Oil",
										] forParent:c];
	
	c = [self createCategoryWithName:@"Insurances" andParent:nil];
	[ret.categories addObject:c];
	[self createSubCategoriesWithName:@[
										@"Car Insurance",
										@"Life Insurance",
										@"Health Insurance",
										] forParent:c];

	c = [self createCategoryWithName:@"Pleasure" andParent:nil];
	[ret.categories addObject:c];
	[self createSubCategoriesWithName:@[
										@"Coffee",
										@"Shopaholic",
										@"Restaurants",
										@"iTunes Spendings",
										@"App Store Spendings",
										] forParent:c];
	
	c = [self createCategoryWithName:@"Everyday Expenses" andParent:nil];
	[ret.categories addObject:c];
	[self createSubCategoriesWithName:@[
										@"Groceries",
										@"Fuel",
										@"Spending Money",
										@"Medical",
										@"Clothing",
										@"Household Goods",
										] forParent:c];
	
	c = [self createCategoryWithName:@"Saving Goals" andParent:nil];
	[ret.categories addObject:c];
	[self createSubCategoriesWithName:@[
										@"Christmas Presents",
										@"Birthdays",
										@"Car Replacement",
										@"Vacation",
										] forParent:c];

	c = [self createCategoryWithName:@"Debt" andParent:nil];
	[ret.categories addObject:c];
	[self createSubCategoriesWithName:@[
										@"Car Payment",
										@"Student Loan Payment",
										@"Personal Loan Payment",
										] forParent:c];
	
	return ret;
}

- (PBBudget*) createSmallOfficeBudget {
	PBBudget* ret = [[PBBudget alloc] init];
	ret.name = @"Office Budget";
	PBCategory* c = nil;
	
	c = [self createCategoryWithName:@"Marketing" andParent:nil];
	[ret.categories addObject:c];
	[self createSubCategoriesWithName:@[
										@"Printing",
										@"AdWords",
										@"Facebook",
										@"Twitter",
										@"Referral Fees",
										@"Comissions",
										] forParent:c];
	
	c = [self createCategoryWithName:@"Services" andParent:nil];
	[ret.categories addObject:c];
	[self createSubCategoriesWithName:@[
										@"Accounting",
										@"Legal",
										@"Contractors",
										] forParent:c];
	
	c = [self createCategoryWithName:@"Office" andParent:nil];
	[ret.categories addObject:c];
	[self createSubCategoriesWithName:@[
										@"Rent",
										@"Telephone/Fax",
										@"Internet",
										@"Cleaning",
										] forParent:c];
	
	c = [self createCategoryWithName:@"Travel" andParent:nil];
	[ret.categories addObject:c];
	[self createSubCategoriesWithName:@[
										@"Automobile",
										@"Hotels/Lodging",
										@"Airfare",
										@"Other",
										] forParent:c];
	
	c = [self createCategoryWithName:@"Taxes & Licenses" andParent:nil];
	[ret.categories addObject:c];
	[self createSubCategoriesWithName:@[
										@"Unemployment",
										@"Payroll",
										@"Quaterlies",
										] forParent:c];
	
	return ret;
}

- (PBCategory*) createCategoryWithName:(NSString*)name andParent:(PBCategory*)parent {
	PBCategory* ret = [[PBCategory alloc] init];
	ret.name = name;
	if(parent) {
		ret.parent = parent;
		[parent.subCategories addObject:ret];
	}
	return ret;
}

- (void) createSubCategoriesWithName:(NSArray*)names forParent:(PBCategory*)parent {
	for(NSString* name in names) {
		[self createCategoryWithName:name andParent:parent];
	}
}

@end
