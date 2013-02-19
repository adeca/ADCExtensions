//
//  math+ADC.h
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 19/02/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#ifndef _OUI_MATH_ONEPLUSUI_H_
#define _OUI_MATH_ONEPLUSUI_H_

#import <math.h>


#if !defined(CLAMP)
#define CLAMP(A, LOW, HIGH) ({ 	\
    __typeof__(A) __a = (A);\
    __typeof__(LOW) __low = (LOW);\
    __typeof__(HIGH) __high = (HIGH);\
    __a < __low ? __low : (__a > __high ? __high : __a ); \
})
#endif


#if !defined(SIGN)
#define SIGN(A)	({ __typeof__(A) __a = (A); __a == 0? 0 : (__a > 0? 1 : -1); })
#endif


#if !defined(LERP)
#define LERP(A, B, ALPHA) ({\
    __typeof__(A) __a = (A); \
    __typeof__(B) __b = (B); \
    __typeof__(ALPHA) __alpha = (ALPHA); \
    __a * (1 - __alpha) + __b * __alpha; \
})
#endif


// linear interpolation
float lerp(float from, float to, float alpha);

// cosine interpolation
float coserp(float a, float b, float alpha);

// sign of number (-1, 0, 1)
float signf(float a);

// sign of number (-1, 0, 1)
int signi(int a);

#endif