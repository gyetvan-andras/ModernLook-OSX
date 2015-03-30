//
//  MLHooverButton.m
//  ModernLookOSX
//
//  Created by András Gyetván on 17/03/15.
//  Copyright (c) 2015 DroidZONE. All rights reserved.
//

#import "MLHoverButton.h"
#import <QuartzCore/QuartzCore.h>

@interface MLHoverButton ()
@property (nonatomic, strong) NSTrackingArea* trackingArea;
@property (nonatomic) BOOL hoovered;
@property (nonatomic, strong) NSImage* tintedImage;
//@property (nonatomic, strong) CAShapeLayer* bgLayer;
//@property (nonatomic, strong) CALayer* imgLayer;
@end

@implementation MLHoverButton

- (instancetype) initWithCoder:(NSCoder *)coder {
	self = [super initWithCoder:coder];
	if(self) {
		[self commonInit];
	}
	return self;
}

- (instancetype) initWithFrame:(NSRect)frameRect {
	self = [super initWithFrame:frameRect];
	if(self) {
		[self commonInit];
	}
	return self;
}

- (void) viewDidEndLiveResize {
	[self createTrackingArea];
}

- (void) commonInit {
//	[[NSNotificationCenter defaultCenter] addObserver:self
//		selector:@selector(windowResized:) name:NSViewFrameDidChangeNotification
//		object:self];
	self.wantsLayer = YES;
//	self.title = @"1";
	[self createTrackingArea];
	self.hoovered = NO;
	self.hoveredForegroundColor = [NSColor whiteColor] ;//]selectedTextColor];
	self.hoveredBackgroundColor = [NSColor selectedTextBackgroundColor];
	self.backgroundColor = [NSColor clearColor];
	self.foregroundColor = [NSColor controlTextColor];
//	[self prepareLayer];
//	[self createSublayers];
}

//- (void) prepareLayer {
//	NSRect circleRect = self.bounds;
//	if(circleRect.size.width > circleRect.size.height) {
//		CGFloat originalW = circleRect.size.width;
//		circleRect.size.width = circleRect.size.height;
//		circleRect.origin.x = ((originalW - circleRect.size.width)/2.0);
//	} else if(circleRect.size.width < circleRect.size.height) {
//		CGFloat originalH = circleRect.size.height;
//		circleRect.size.height = circleRect.size.width;
//		circleRect.origin.y = ((originalH - circleRect.size.height)/2.0);
//	}
//	
//	CAShapeLayer* bg = [CAShapeLayer layer];
//	CGRect cr = circleRect;
//	bg.path = CGPathCreateWithEllipseInRect(cr, nil);
//	self.bgLayer = bg;
//	self.bgLayer.fillColor = [self.backgroundColor CGColor];
//	self.layer = bg;
//}

//- (void) createSublayers {
//	for(CALayer* sl in self.bgLayer.sublayers) {
//		[sl removeFromSuperlayer];
//	}
//	NSRect targetRect = NSInsetRect(self.bounds, 8.0f, 8.0f);
//	if(self.image) {
//		CALayer* img = [CALayer layer];
//		
//		
//		NSImage* i = self.image;
//		
//		NSRect imageRect = NSZeroRect;
//		CGFloat w = i.size.width;
//		CGFloat h = i.size.height;
//		if(w > targetRect.size.width) w = targetRect.size.width;
//		if(h > targetRect.size.height) h = targetRect.size.height;
//		imageRect.size.width = w;
//		imageRect.size.height = h;
//		
//		imageRect.origin.x = (self.bgLayer.bounds.size.width - imageRect.size.width)/2.0f;
//		imageRect.origin.y = (self.bgLayer.bounds.size.height - imageRect.size.height)/2.0f;
//		
//		img.contents = self.image;
//		img.bounds = imageRect;
//		img.frame = imageRect;//self.bgLayer.bounds;
////		img.position = NSMakePoint(NSMidX(img.frame), NSMidY(img.frame));
//		[self.bgLayer addSublayer:img];
//		self.imgLayer = img;
////	} else {
////		CATextLayer* txt = [CATextLayer layer];
////		NSFont* fnt = [NSFont fontWithName:@"Helvetica Neue Thin" size:16.0];
////
////		txt.font = (CGFontRef)CFBridgingRetain(fnt);
////		txt.fontSize = 14.0f;
////		txt.alignmentMode = kCAAlignmentCenter;
////		
////		NSMutableParagraphStyle * aParagraphStyle = [[NSMutableParagraphStyle alloc] init];
////		[aParagraphStyle setLineBreakMode:NSLineBreakByWordWrapping];
////		[aParagraphStyle setAlignment:NSCenterTextAlignment];
////
////		NSDictionary *attrs = @{NSParagraphStyleAttributeName: aParagraphStyle,NSFontAttributeName: self.font,NSForegroundColorAttributeName: self.foregroundColor};
////
////		NSAttributedString* attrstr = [[NSAttributedString alloc] initWithString:self.title attributes:attrs];
////		NSSize size = [self.title sizeWithAttributes:attrs];
////
////		NSRect r = NSMakeRect(0,
////							  ((targetRect.size.height - size.height)/2.0) - 2,
////							  (self.bounds.size.width),
////							  size.height);
////		txt.bounds = r;//self.bounds;
////		txt.frame = r;
////		txt.string = attrstr;
////
////		[self.bgLayer addSublayer:txt];
////		self.txtLayer = txt;
//	}
//}

- (void) createTrackingArea {
	if(self.trackingArea) {
		[self removeTrackingArea:self.trackingArea];
	}
	NSRect circleRect = self.bounds;
//	if(circleRect.size.width > circleRect.size.height) {
//		CGFloat originalW = circleRect.size.width;
//		circleRect.size.width = circleRect.size.height;
//		circleRect.origin.x = ((originalW - circleRect.size.width)/2.0);
//	} else if(circleRect.size.width < circleRect.size.height) {
//		CGFloat originalH = circleRect.size.height;
//		circleRect.size.height = circleRect.size.width;
//		circleRect.origin.y = ((originalH - circleRect.size.height)/2.0);
//	}
	
	self.trackingArea = [[NSTrackingArea alloc] initWithRect:circleRect
													 options: (NSTrackingMouseEnteredAndExited | NSTrackingActiveInActiveApp)
													   owner:self userInfo:nil];
	[self addTrackingArea:self.trackingArea];
	
}

- (void)mouseEntered:(NSEvent *)theEvent {
	self.hoovered = YES;
//	[self animateToHoovered:YES];
	self.needsDisplay = YES;
}

- (void)mouseExited:(NSEvent *)theEvent {
	self.hoovered = NO;
//	[self animateToHoovered:NO];
	self.needsDisplay = YES;
}

//- (void) animateToHoovered:(BOOL)hoovered {
////	CALayer *layer = [self layer];
//
////	self.bgLayer.fillColor
//	
//	NSColor* toBG = nil;
//	NSColor* toFG = nil;
//	if(hoovered) {
//		toBG = self.hooverBackgroundColor;
//		toFG = self.hooveredForegroundColor;
//	} else {
//		toBG = self.backgroundColor;
//		toFG = self.foregroundColor;
//	}
//	CABasicAnimation *anime = [CABasicAnimation animationWithKeyPath:@"fillColor"];
//	anime.fromValue = (id)[self.bgLayer backgroundColor];
//	anime.toValue = (id)[toBG CGColor];
//	anime.duration = 0.5f;
//	anime.autoreverses = NO;
//	self.l`
//	[self.bgLayer addAnimation:anime forKey:@"fillColor"];
////	CABasicAnimation *anime = [CABasicAnimation animationWithKeyPath:@"fillColor"];
//	self.bgLayer.fillColor = [toBG CGColor];
//}

- (void) setHoveredForegroundColor:(NSColor *)hooveredForegroundColor {
	_hoveredForegroundColor = hooveredForegroundColor;
	if(self.image) {
		self.tintedImage = [self imageTintedWithColor:self.hoveredForegroundColor];
	}
}

- (void) setImage:(NSImage *)image {
	[super setImage:image];
	if(image) {
		self.tintedImage = [self imageTintedWithColor:self.hoveredForegroundColor];
	} else {
		self.tintedImage = nil;
	}
}

- (NSImage *)imageTintedWithColor:(NSColor *)tint
{
	NSImage *image = [self.image copy];
	if (tint) {
		[image lockFocus];
		[tint set];
		NSRect imageRect = {NSZeroPoint, [image size]};
		NSRectFillUsingOperation(imageRect, NSCompositeSourceAtop);
		[image unlockFocus];
	}
	return image;
}

- (void) drawText:(NSString*) text inRect:(NSRect)rect withColor:(NSColor*) fc {
	NSMutableParagraphStyle * aParagraphStyle = [[NSMutableParagraphStyle alloc] init];
	[aParagraphStyle setLineBreakMode:NSLineBreakByWordWrapping];
	[aParagraphStyle setAlignment:NSLeftTextAlignment];
	
	NSDictionary *attrs = @{NSParagraphStyleAttributeName: aParagraphStyle,NSFontAttributeName: self.font,NSForegroundColorAttributeName: fc};
	
	NSSize size = [self.title sizeWithAttributes:attrs];
	
	NSRect r = NSMakeRect(rect.origin.x,// + (bounds.size.width - size.width)/2.0,
						  rect.origin.y + ((rect.size.height - size.height)/2.0),
						  rect.size.width,
						  size.height);
	[self.title drawInRect:r withAttributes:attrs];
	
}

- (void)drawRect:(NSRect)dirtyRect {
	[NSGraphicsContext saveGraphicsState];
	NSRect circleRect = self.bounds;
	
	if(circleRect.size.width > circleRect.size.height) {
//		CGFloat originalW = circleRect.size.width;
		circleRect.size.width = circleRect.size.height;
//		circleRect.origin.x = ((originalW - circleRect.size.width)/2.0);
	} else if(circleRect.size.width < circleRect.size.height) {
		CGFloat originalH = circleRect.size.height;
		circleRect.size.height = circleRect.size.width;
		circleRect.origin.y = ((originalH - circleRect.size.height)/2.0);
	}
	
	NSRect textRect = self.bounds;
	textRect.origin.x += circleRect.size.width + 4;
	textRect.size.width -= circleRect.size.width + 4;
	
	NSColor* bg = self.backgroundColor;
	NSColor* fc = nil;
	if(self.hoovered && !self.isHighlighted) {
		bg = self.hoveredBackgroundColor;
		fc = self.hoveredForegroundColor;
	} else {
		bg = self.backgroundColor;
		fc = self.foregroundColor;
	}
	
	NSBezierPath* bgPath = [NSBezierPath bezierPathWithOvalInRect:circleRect];
	[bg set];
	[bgPath fill];
	
	if(self.image) {
		
		NSRect targetRect = NSInsetRect(circleRect, 8.0f, 8.0f);
		
		NSImage* i = nil;
		
		if(self.hoovered && !self.isHighlighted) {
			i = self.tintedImage;
		} else {
			i = self.image;
		}
		
		NSRect imageRect = NSZeroRect;
		CGFloat w = i.size.width;
		CGFloat h = i.size.height;
		if(w > targetRect.size.width) w = targetRect.size.width;
		if(h > targetRect.size.height) h = targetRect.size.height;
		imageRect.size.width = w;
		imageRect.size.height = h;
		
		imageRect.origin.x = (circleRect.size.width - imageRect.size.width)/2.0f;
		imageRect.origin.y = (circleRect.size.height - imageRect.size.height)/2.0f;
		
		[i drawInRect:imageRect];
		[self drawText:self.title inRect:textRect withColor:fc];
		
	} else {
		NSString* sign = nil;
		NSString* text = nil;
		NSArray* components = [self.title componentsSeparatedByString:@"|"];
		if(components.count == 2) {
			sign = components[0];
			text = components[1];
		} else {
			sign = [self.title substringToIndex:1];
			text = [self.title substringFromIndex:1];
		}
		NSMutableParagraphStyle * aParagraphStyle = [[NSMutableParagraphStyle alloc] init];
		[aParagraphStyle setLineBreakMode:NSLineBreakByWordWrapping];
		[aParagraphStyle setAlignment:NSCenterTextAlignment];
		
		NSDictionary *attrs = @{NSParagraphStyleAttributeName: aParagraphStyle,NSFontAttributeName: self.font,NSForegroundColorAttributeName: fc};
		
		NSSize size = [sign sizeWithAttributes:attrs];
		
		NSRect r = NSMakeRect(circleRect.origin.x,// + (bounds.size.width - size.width)/2.0,
							  circleRect.origin.y + ((circleRect.size.height - size.height)/2.0) - 2,
							  circleRect.size.width,
							  size.height);
		
		[sign drawInRect:r withAttributes:attrs];
		[self drawText:text inRect:textRect withColor:fc];
	}
	[NSGraphicsContext restoreGraphicsState];
}

//- (void)drawRect:(NSRect)dirtyRect {
//}

//- (void)drawRect:(NSRect)dirtyRect {
//	[NSGraphicsContext saveGraphicsState];
//	NSRect circleRect = self.bounds;
//	
//	if(circleRect.size.width > circleRect.size.height) {
//		CGFloat originalW = circleRect.size.width;
//		circleRect.size.width = circleRect.size.height;
//		circleRect.origin.x = ((originalW - circleRect.size.width)/2.0);
//	} else if(circleRect.size.width < circleRect.size.height) {
//		CGFloat originalH = circleRect.size.height;
//		circleRect.size.height = circleRect.size.width;
//		circleRect.origin.y = ((originalH - circleRect.size.height)/2.0);
//	}
//	NSColor* bg = self.backgroundColor;
//	NSColor* fc = nil;
//	if(self.hoovered && !self.isHighlighted) {
//		bg = self.hoveredBackgroundColor;
//		fc = self.hoveredForegroundColor;
//	} else {
//		bg = self.backgroundColor;
//		fc = self.foregroundColor;
//	}
//	
//	NSBezierPath* bgPath = [NSBezierPath bezierPathWithOvalInRect:circleRect];
//	[bg set];
//	[bgPath fill];
//	
//	if(self.image) {
//		
//		NSRect targetRect = NSInsetRect(circleRect, 8.0f, 8.0f);
//
//		NSImage* i = nil;
//
//		if(self.hoovered && !self.isHighlighted) {
//			i = self.tintedImage;
//		} else {
//			i = self.image;
//		}
//		
//		NSRect imageRect = NSZeroRect;
//		CGFloat w = i.size.width;
//		CGFloat h = i.size.height;
//		if(w > targetRect.size.width) w = targetRect.size.width;
//		if(h > targetRect.size.height) h = targetRect.size.height;
//		imageRect.size.width = w;
//		imageRect.size.height = h;
//		
//		imageRect.origin.x = (self.bounds.size.width - imageRect.size.width)/2.0f;
//		imageRect.origin.y = (self.bounds.size.height - imageRect.size.height)/2.0f;
//		
//		[i drawInRect:imageRect];
//		
//	} else {
//		NSMutableParagraphStyle * aParagraphStyle = [[NSMutableParagraphStyle alloc] init];
//		[aParagraphStyle setLineBreakMode:NSLineBreakByWordWrapping];
//		[aParagraphStyle setAlignment:NSCenterTextAlignment];
//		
//		NSDictionary *attrs = @{NSParagraphStyleAttributeName: aParagraphStyle,NSFontAttributeName: self.font,NSForegroundColorAttributeName: fc};
//		
//		NSSize size = [self.title sizeWithAttributes:attrs];
//		
//		NSRect r = NSMakeRect(circleRect.origin.x,// + (bounds.size.width - size.width)/2.0,
//							  circleRect.origin.y + ((circleRect.size.height - size.height)/2.0) - 2,
//							  circleRect.size.width,
//							  size.height);
//		
//		[self.title drawInRect:r withAttributes:attrs];
//	}
//	[NSGraphicsContext restoreGraphicsState];
//}

@end
