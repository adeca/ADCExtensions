//
//  NSThread+ADC.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 2/27/15.
//  Copyright (c) 2015 Agustín de Cabrera. All rights reserved.
//

#import "NSThread+ADC.h"

@implementation NSThread (ADC)

- (id)objectFromThreadDictionary:(id<NSCopying>)key orBlockResult:(id(^)())block
{
    id object = self.threadDictionary[key];
    if (!object && block) {
        object = block();
        if (object)
            self.threadDictionary[key] = object;
    }
    
    return object;
}

+ (id)objectFromThreadDictionary:(id<NSCopying>)key orBlockResult:(id(^)())block
{
    return [[self currentThread] objectFromThreadDictionary:key orBlockResult:block];
}

@end
