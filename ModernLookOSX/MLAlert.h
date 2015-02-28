//
//  MLAlert.h
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 27..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import <Cocoa/Cocoa.h>
typedef enum {
	MLALERT_YES,MLALERT_NO,MLALERT_CANCEL
} MLAlertResponse;

@interface MLAlert : NSWindowController
+ (MLAlertResponse) showQuestion:(NSString*)question title:(NSString*)title withCancel:(BOOL)withCancel;
@end
