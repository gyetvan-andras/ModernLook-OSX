//
//  PBPopupContent.h
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 15..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol MLPopupContentDelegate <NSObject>
@required
- (void) selectionDidChange:(id)sel fromUpDown:(BOOL)updown;
@end

@interface MLPopupContent : NSViewController
@property (nonatomic, weak) id<MLPopupContentDelegate> delegate;
- (void) moveSelectionUp:(BOOL)up;
- (NSString*) moveSelectionTo:(NSString*)str;
@end
