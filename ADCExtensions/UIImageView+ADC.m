//
//  UIImageView+ADC.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 18/10/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "UIImageView+ADC.h"

@implementation UIImageView (ADC)

- (id)initWithImageNamed:(NSString *)name
{
    return [self initWithImage:[UIImage imageNamed:name]];
}

@end
