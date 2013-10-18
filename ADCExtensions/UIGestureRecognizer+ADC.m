//
//  UIGestureRecognizer+ADC.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 18/10/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "UIGestureRecognizer+ADC.h"

@implementation UIGestureRecognizer (ADC)

- (void)removeFromView
{
    [self.view removeGestureRecognizer:self];
}

- (void)cancel
{
    self.enabled = NO;
    self.enabled = YES;
}

@end
