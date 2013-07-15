//
//  NSArray+ADC.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 19/02/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "NSArray+ADC.h"

@implementation NSArray (ADC)

- (id)firstObject
{
    return self.count > 0? self[0] : nil;
}

#pragma mark -

- (NSArray*)arrayByRemovingObject:(id)object
{
    NSMutableArray *copy = [self mutableCopy];
    [copy removeObject:object];
    return [NSArray arrayWithArray:copy];
}

- (NSArray*)arrayByRemovingObjectsInArray:(NSArray*)otherArray
{
    NSMutableArray *copy = [self mutableCopy];
    [copy removeObjectsInArray:otherArray];
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

- (NSArray*)subarrayToIndex:(NSUInteger)idx
{
    return [self subarrayWithCount:idx+1];
}

- (NSArray*)subarrayFromIndex:(NSUInteger)idx
{
    if (idx == NSNotFound || idx > self.count-1)
        return @[];
    
    return [self subarrayWithRange:(NSRange){
        idx, self.count-idx
    }];
}

@end
