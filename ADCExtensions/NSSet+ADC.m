//
//  NSSet+ADC.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 19/02/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "NSSet+ADC.h"
#import "NSSet+Functional.h"
#import "NSArray+ADC.h"
#import "NSDictionary+ADC.h"

@implementation NSSet (ADC)

- (NSSet *)setByRemovingNulls
{
    return [self map:^id(id obj) {
        if (obj == [NSNull null])
            return nil;
        
        if ([obj respondsToSelector:@selector(dictionaryByRemovingNulls)])
            return [obj dictionaryByRemovingNulls];
        else if ([obj respondsToSelector:@selector(arrayByRemovingNulls)])
            return [obj arrayByRemovingNulls];
        else if ([obj respondsToSelector:@selector(setByRemovingNulls)])
            return [obj setByRemovingNulls];
        
        return obj;
    }];
}

@end
