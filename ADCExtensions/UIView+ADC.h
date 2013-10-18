//
//  UIView+ADC.h
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 19/02/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import <UIKit/UIKit.h>

/*! 
 Methods in this category simplify accessing and modifying the view's frame.
 All of these methods are equivalent to getting the view's frame, manipulating it and setting it back.
 
 Note that the compound assignment operators work as expected (view.frameX += 5).
 */
@interface UIView (ADC)

@property (nonatomic) CGFloat frameX;       // frame.origin.x
@property (nonatomic) CGFloat frameY;       // frame.origin.y
@property (nonatomic) CGFloat frameWidth;   // frame.size.width
@property (nonatomic) CGFloat frameHeight;  // frame.size.height

@property (nonatomic) CGSize frameSize;     // frame.size
@property (nonatomic) CGPoint frameOrigin;  // frame.origin

@property (nonatomic) CGFloat centerX;      // center.x
@property (nonatomic) CGFloat centerY;      // center.y

@property (nonatomic, readonly) CGFloat frameMaxX;  // CGRectGetMaxX(frame)
@property (nonatomic, readonly) CGFloat frameMaxY;  // CGRectGetMaxY(frame)

@property (nonatomic) CGFloat boundsX;       // bounds.origin.x
@property (nonatomic) CGFloat boundsY;       // bounds.origin.y
@property (nonatomic) CGFloat boundsWidth;   // bounds.size.width
@property (nonatomic) CGFloat boundsHeight;  // bounds.size.height

@property (nonatomic) CGSize boundsSize;     // bounds.size
@property (nonatomic) CGPoint boundsOrigin;  // bounds.origin

/*!
 Removes all of the receiver's current subviews.
 */
- (void)removeSubviews;

@end
