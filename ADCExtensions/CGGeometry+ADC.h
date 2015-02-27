//
//  CGGeometry+ADC.h
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 18/10/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>

// add two points
CGPoint CGPointAdd(const CGPoint p1, const CGPoint p2);

// return the point within the given rect that is closest to the given point
CGPoint CGPointClampToRect(const CGPoint point, const CGRect rect);

// return a rect that is within rect2, with the same size as rect1 and closest to it
CGRect CGRectClampToRect(const CGRect rect1, const CGRect rect2);

