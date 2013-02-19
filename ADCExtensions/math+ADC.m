//
//  math+ADC.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 19/02/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "math+ADC.h"

// linear interpolation
float lerp(float a, float b, float alpha)
{
    return a * (1.0f - alpha) + b * alpha;
}

// cosine interpolation
float coserp(float a, float b, float alpha)
{
    float alpha2 = (1-cosf(alpha * (float)M_PI))/2;
    return a * (1-alpha2) + b * alpha2;
}

// sign of number (-1, 0, 1)
float signf(float a)
{
    return a > 0? 1.0f : (a < 0? -1.0f : 0);
}

// sign of number (-1, 0, 1)
int signi(int a)
{
    return a > 0? 1 : (a < 0? -1 : 0);
}
