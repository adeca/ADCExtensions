//
//  NSArray+Creation.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 14/07/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "NSArray+Creation.h"

@implementation NSArray (Creation)

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
