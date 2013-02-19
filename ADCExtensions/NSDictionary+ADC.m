//
//  NSDictionary+ADC.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 19/02/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "NSDictionary+ADC.h"
#import "NSArray+ADC.h"

@implementation NSDictionary (ADC)

- (void)each:(void (^)(id key, id obj))block
{
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        block(key, obj);
    }];
}

- (NSDictionary *)map:(id (^)(id key, id obj))block
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:[self count]];
    
    [self each:^(id key, id obj) {
        id newobj = block(key, obj);
        if (newobj)
            dict[key] = newobj;
    }];
    
    return dict;
}

- (NSDictionary *)select:(BOOL (^)(id key, id obj))block
{
    return [self map:^id(id key, id obj) {
        return block(key, obj)? obj : nil;
    }];
}

#pragma mark -

- (NSArray *)objectsForKeys:(NSArray *)keys
{
    return [keys map:^id(id key) {
        return self[key];
    }];
}

@end
