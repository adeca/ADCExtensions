//
//  NSDictionary+ADC.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 19/02/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "NSDictionary+ADC.h"
#import "NSDictionary+Functional.h"
#import "NSArray+ADC.h"
#import "NSArray+Functional.h"
#import "NSSet+ADC.h"

@implementation NSDictionary (ADC)

- (NSArray *)objectsForKeys:(NSArray *)keys
{
    return [keys map:^id(id key) {
        return self[key];
    }];
}

- (NSDictionary*)dictionaryByRemovingNulls
{
    return [self map:^id(id key, id obj) {
        if (key == [NSNull null] || obj == [NSNull null])
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

- (NSDictionary *)dictionaryByAddingEntriesFromDictionary:(NSDictionary*)dictionary
{
    NSMutableDictionary *copy = [self mutableCopy];
    [copy addEntriesFromDictionary:dictionary];
    return copy;
}

@end
