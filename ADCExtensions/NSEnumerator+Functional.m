//
//  NSEnumerator+Functional.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 15/07/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "NSEnumerator+Functional.h"

@interface _MapEnumerator : NSEnumerator

- (id)initWithEnumerator:(NSEnumerator*)enumerator block:(id(^)(id obj))block;

@property (nonatomic, strong) NSEnumerator *sourceEnumerator;
@property (nonatomic, copy) id (^block)(id obj);

@end

@implementation _MapEnumerator

- (id)initWithEnumerator:(NSEnumerator*)enumerator block:(id(^)(id obj))block
{
    if (self = [super init]) {
        self.sourceEnumerator = enumerator;
        self.block = block;
    }
    return self;
}
- (id)init
{
    return [self initWithEnumerator:nil block:nil];
}

- (id)nextObject
{
    NSParameterAssert(self.block);
    
    id result = nil;
    
    do {
        id obj = [self.sourceEnumerator nextObject];
        if (!obj)
            return nil;
        
        result = self.block(obj);
    } while (result == nil);
    
    return result;
}

@end

@implementation NSEnumerator (Functional)

- (void)each:(void (^)(id obj))block
{
    for (id obj in self) {
        block(obj);
    }
}

- (NSEnumerator*)map:(id (^)(id))block
{
    NSParameterAssert(block);
    return [[_MapEnumerator alloc] initWithEnumerator:self block:block];
}

- (NSEnumerator *)select:(BOOL (^)(id obj))block
{
    NSParameterAssert(block);
    return [[_MapEnumerator alloc] initWithEnumerator:self block:^id(id obj) {
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

- (BOOL)all:(BOOL (^)(id obj))block
{
    for (id obj in self) {
        if (!block(obj)) {
            return NO;
        }
    }
    return YES;
}

- (BOOL)any:(BOOL (^)(id obj))block
{
    for (id obj in self) {
        if (block(obj)) {
            return YES;
        }
    }
    return NO;
}

@end
