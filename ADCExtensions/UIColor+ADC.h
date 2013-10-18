//
//  UIColor+ADC.h
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 18/10/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ADC)

/**
 Creates and returns a color object using the specified hex code.
 @param hex  Integer representing a color in 0xRRGGBBAA format.
 */
+ (UIColor*)colorWithHex:(int)hex;

@end
