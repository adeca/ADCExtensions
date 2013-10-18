//
//  CGGeometry+ADC.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 18/10/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "CGGeometry+ADC.h"
#import "math+ADC.h"

CGPoint CGPointAdd(const CGPoint p1, const CGPoint p2)
{
	return CGPointMake(p1.x + p2.x, p1.y + p2.y);
}

CGPoint CGPointClampToRect(const CGPoint point, const CGRect rect)
{
    return CGPointMake(CLAMP(point.x, CGRectGetMinX(rect), CGRectGetMaxX(rect)),
                       CLAMP(point.y, CGRectGetMinY(rect), CGRectGetMaxY(rect)));
}

CGRect CGRectClampToRect(const CGRect rect1, const CGRect rect2)
{
    if (rect1.size.width > rect2.size.width || rect1.size.height > rect2.size.height)
        return CGRectNull;
    
    CGRect newRect = (CGRect){
        rect2.origin,
        rect2.size.width  - rect1.size.width,
        rect2.size.height - rect1.size.height
    };
    
    CGPoint newOrigin = CGPointClampToRect(rect1.origin, newRect);
    
    return (CGRect){
        newOrigin,
        rect1.size,
    };
}
