//
//  NSArray+ADC.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 19/02/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "NSArray+ADC.h"

static NSMutableArray *ArrayByEnumerating(NSUInteger count, id<NSFastEnumeration> enumerator, id(^block)(id))
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:count];
    for (id obj in enumerator) {
        id newobj = block? block(obj) : obj;
        if (newobj)
            [array addObject:newobj];
    }
    return array;
}


@implementation NSArray (ADC)

- (void)each:(void (^)(id obj))block
{
    for (id obj in self) {
        block(obj);
    }
}

- (NSArray *)map:(id (^)(id obj))block
{
    return ArrayByEnumerating([self count], self, block);
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

- (NSArray *)intersect:(NSArray*)array
{
    return [self select:^BOOL(id obj) {
        return [array containsObject:obj];
    }];
}

- (NSArray *)reversed
{
    return ArrayByEnumerating([self count], [self reverseObjectEnumerator], nil);
}

#pragma mark -

- (NSArray*)arrayByRemovingObject:(id)object
{
    NSMutableArray *copy = [self mutableCopy];
    [copy removeObject:object];
    return [NSArray arrayWithArray:copy];
}

- (NSArray*)arrayByInsertingObject:(id)object atIndex:(NSUInteger)index
{
    NSMutableArray *copy = [self mutableCopy];
    [copy insertObject:object atIndex:index];
    return [NSArray arrayWithArray:copy];
}

- (NSArray*)subarrayWithCount:(NSUInteger)count
{
    return [self subarrayWithRange:(NSRange){
        0, MIN(count, self.count)
    }];
}

#pragma mark -

- (id)initWithCount:(NSUInteger)count object:(id)object
{
    return [self initWithCount:count objectCreator:^id(NSUInteger idx) {
        return object;
    }];
}

- (id)initWithCount:(NSUInteger)count copyingObject:(id<NSCopying>)object
{
    return [self initWithCount:count objectCreator:^id(NSUInteger idx) {
        return [object copyWithZone:nil];
    }];
}

- (id)initWithCount:(NSUInteger)count objectCreator:(id(^)(NSUInteger idx))objectCreator
{
    if (count == 0 || !objectCreator)
        return [self init];
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:count];
    for (uint i=0; i < count; i++) {
        id obj = objectCreator(i);
        if (obj)
            [array addObject:obj];
    }
    
    return [self initWithArray:array];
}

@end
