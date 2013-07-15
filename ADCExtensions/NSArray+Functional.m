//
//  NSArray+Functional.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 14/07/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "NSArray+Functional.h"

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

@implementation NSArray (Functional)

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

@end
