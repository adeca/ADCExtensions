//
//  UIColor+ADC.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 18/10/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "UIColor+ADC.h"

@implementation UIColor (ADC)

+ (UIColor *)colorWithHex:(int)hex
{
    float red   = (hex & 0xff000000) >> 24;
    float green = (hex & 0x00ff0000) >> 16;
    float blue  = (hex & 0x0000ff00) >> 8;
    float alpha = (hex & 0x000000ff);
    
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha/255.0];
}

@end
