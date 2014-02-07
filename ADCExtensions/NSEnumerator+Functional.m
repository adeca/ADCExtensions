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

@interface _RangeEnumerator : NSEnumerator

- (id)initWithEnumerator:(NSEnumerator*)enumerator range:(NSRange)range;

@property (nonatomic, strong) NSEnumerator *sourceEnumerator;
@property (nonatomic, assign) NSRange range;
@property (nonatomic, assign) NSUInteger location;

@end

@implementation _RangeEnumerator

- (id)initWithEnumerator:(NSEnumerator *)enumerator range:(NSRange)range
{
  if (self = [super init]) {
    self.sourceEnumerator = enumerator;
    self.range = range;
  }
  return self;
}
- (id)init
{
  return [self initWithEnumerator:nil range:NSMakeRange(0, 0)];
}

- (id)nextObject
{
  if (self.location >= NSMaxRange(self.range))
    return nil;
  
  while (self.location < self.range.location)
  {
    self.location++;
    [self.sourceEnumerator nextObject];
  }
  
  self.location++;
  return [self.sourceEnumerator nextObject];
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

- (NSEnumerator*)take:(NSUInteger)count
{
  return [[_RangeEnumerator alloc] initWithEnumerator:self range:NSMakeRange(0, count)];
}

- (id)reduce:(id)initial block:(id (^)(id accumulator, id obj))block
{
    id accumulator = initial;
    for (id obj in self) {
        accumulator = block(accumulator, obj);
    }
    return accumulator;
}

- (NSDictionary*)mapToDictionary:(id<NSCopying> (^)(id obj))block;
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    for (id obj in self) {
        
        id<NSCopying> key = block(obj);
        if (key)
            dict[key] = obj;
    }
    
    return dict;
}

- (NSDictionary*)groupBy:(id<NSCopying> (^)(id obj))block
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
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

@end
