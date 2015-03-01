//
//  PBTextFieldPopupManager.h
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 15..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MLPopupContent.h"
@class MLPopupContent;

@interface MLComboFieldDelegate : NSObject <NSTextFieldDelegate,MLPopupContentDelegate>
@property (NS_NONATOMIC_IOSONLY, readonly, strong) MLPopupContent *createPopupContent;
@end
