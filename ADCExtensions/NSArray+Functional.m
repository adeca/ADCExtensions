//
//  NSArray+Functional.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 14/07/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "NSArray+Functional.h"

@implementation NSArray (Functional)

- (void)each:(void (^)(id obj))block
{
    for (id obj in self) {
        block(obj);
    }
}

- (NSArray *)mapWithOptions:(NSEnumerationOptions)options usingBlock:(id (^)(id obj, NSUInteger idx))block
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    [self enumerateObjectsWithOptions:options usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        id newobj = block(obj, idx);
        if (newobj)
            [array addObject:newobj];
    }];
    return array;
}

- (NSArray *)map:(id (^)(id obj))block
{
    return [self mapWithOptions:0 usingBlock:^id(id obj, NSUInteger idx) {
        return block(obj);
    }];
}

- (NSArray *)mapIndexes:(id (^)(id obj, NSUInteger idx))block
{
    return [self mapWithOptions:0 usingBlock:block];
}

- (NSArray *)select:(BOOL (^)(id obj))block
{
    return [self map:^id(id obj) {
        return block(obj)? obj : nil;
    }];
}

- (id)match:(BOOL (^)(id obj))block
{
    for (id obj in self) {
        if (block(obj)) {
            return obj;
        }
    }
    return nil;
}

- (id)reduce:(id)initial block:(id (^)(id accumulator, id obj))block
{
    id accumulator = initial;
    for (id obj in self) {
        accumulator = block(accumulator, obj);
    }
    return accumulator;
}

- (BOOL)all:(BOOL (^)(id obj))block
{
    BOOL (^negatedBlock)(id obj) = ^BOOL(id obj) {
        return !block(obj);
    };
    return [self match:negatedBlock] == nil;
}

- (BOOL)any:(BOOL (^)(id obj))block
{
    return [self match:block] != nil;
}

- (void)with:(NSArray*)array each:(void (^)(id obj1, id obj2))block
{
    NSUInteger count = MIN([self count], [array count]);
    
    for (uint i=0; i < count; i++) {
        block(self[i], array[i]);
    }
}

- (NSArray*)mapWith:(NSArray*)other each:(id (^)(id obj1, id obj2))block
{
    if (!block)
        return nil;
    
    NSUInteger count = MIN([self count], [other count]);
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:count];
    for (uint i=0; i < count; i++) {
        
        id newobj = block(self[i], other[i]);
        if (newobj)
            [array addObject:newobj];
    }
    return array;
}

- (NSArray *)intersect:(NSArray*)array
{
    return [self select:^BOOL(id obj) {
        return [array containsObject:obj];
    }];
}

- (NSArray *)reversed
{
    return [self mapWithOptions:NSEnumerationReverse usingBlock:^id(id obj, NSUInteger idx) {
        return obj;
    }];
}

- (NSDictionary*)mapToDictionary:(id<NSCopying> (^)(id obj))block;
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:[self count]];
    
    for (id obj in self) {
        
        id<NSCopying> key = block(obj);
        if (key)
            dict[key] = obj;
    }
    
    return dict;
}

- (NSDictionary*)groupBy:(id<NSCopying> (^)(id obj))block
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary]; // #adc: consider using some initial capacity based on count.
    
    for (id obj in self) {
        
        id<NSCopying> key = block(obj);
        if (!key)
            continue;
        
        NSMutableArray *group = dict[key];
        if (group)
            [group addObject:obj];
        else
            dict[key] = [NSMutableArray arrayWithObject:obj];
    }
    
    return dict;
}

- (NSDictionary*)countBy:(id<NSCopying> (^)(id obj))block
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary]; // #adc: consider using some initial capacity based on count.
    
    for (id obj in self) {
        
        id<NSCopying> key = block(obj);
        if (!key)
            continue;
        
        dict[key] = @([dict[key] intValue] + 1);
    }
    
    return dict;
}

@end
