//
//  UIGestureRecognizer+ADC.h
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 18/10/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIGestureRecognizer (ADC)

/**
 Remove the receiver from it's current view.
 */
- (void)removeFromView;

/**
 Force the receiver to be cancelled.
 */
- (void)cancel;

@end
