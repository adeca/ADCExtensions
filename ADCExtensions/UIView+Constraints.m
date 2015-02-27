//
//  UIView+Constraints.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 2/27/15.
//  Copyright (c) 2015 Agustín de Cabrera. All rights reserved.
//

#import "UIView+Constraints.h"

@implementation UIView (Constraints)

- (void)applyContainedViewConstraints
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraints:[self containedViewConstraints]];
}

- (NSArray*)containedViewConstraints
{
    NSDictionary *views = NSDictionaryOfVariableBindings(self);
    
    return [[NSLayoutConstraint constraintsWithVisualFormat: @"V:|[self]|" options:0 metrics:nil views:views]
            arrayByAddingObjectsFromArray:
            [NSLayoutConstraint constraintsWithVisualFormat: @"H:|[self]|" options:0 metrics:nil views:views]];
}

- (NSArray*)containedViewConstraintsWithHeight:(CGFloat)height
{
    NSDictionary *views = NSDictionaryOfVariableBindings(self);
    NSDictionary *metrics = @{@"height":@(height)};

    return [[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[self(height)]" options:0 metrics:metrics views:views]
            arrayByAddingObjectsFromArray:
            [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[self]|" options:0 metrics:metrics views:views]];
}

@end
