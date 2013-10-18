//
//  UIImage+Tiling.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 18/10/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "UIImage+Tiling.h"

@implementation UIImage (Tiling)

+ (UIImage*)tiledImageNamed:(NSString*)name
{
    return [[self imageNamed:name] resizableImageWithCapInsets:UIEdgeInsetsZero];
}

@end
