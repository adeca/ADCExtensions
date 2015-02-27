//
//  UIView+Constraints.h
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 2/27/15.
//  Copyright (c) 2015 Agustín de Cabrera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Constraints)

/**
 These methods add constraints to a view that will make it resize along with its superview.
 
 When a view is added via an 'embed' segue the automatically-created constraints will make it
 have a fixed size and position. In many cases the desired behavior is for the view to fill the entire
 container and always match its size. These methods update the view-superview constraints to achieve this.
 **/
- (void)applyContainedViewConstraints;

/**
 Returns the constraints that should be added to achieve the resizing behavior.
 **/
- (NSArray*)containedViewConstraints;
- (NSArray*)containedViewConstraintsWithHeight:(CGFloat)height;

@end
