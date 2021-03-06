//
//  NSEnumerator+Functional.h
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 15/07/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSEnumerator (Functional)

/*!
 Calls block once for each element in self, passing that element as a parameter.
 */
- (void)each:(void (^)(id obj))block;

/*!
 Invokes block once for each element of self, returning a new array containing the
 values returned by the block.
 */
- (NSEnumerator *)map:(id (^)(id obj))block;

/*!
 Invokes block once for each element of self, returning an array containing those
 elements for which the block returns a true value.
 */
- (NSEnumerator *)select:(BOOL (^)(id obj))block;

/*!
 Returns the first object in self for which block is true. Returns nil if no match is found.
 */
- (id)match:(BOOL (^)(id obj))block;

/*!
 Returns YES if the block is true for all objects in self.
 */
- (BOOL)all:(BOOL (^)(id obj))block;

/*!
 Returns YES if the block is true for any object in self.
 */
- (BOOL)any:(BOOL (^)(id obj))block;

/**
 Return an enumerator that will iterate over the first 'count' elements of the receiver
 */
- (NSEnumerator*)take:(NSUInteger)count;

/*!
 Combines all objects of self by applying a binary operation, specified by a block.
 For each object in self the block is passed an accumulator value (accum) and the object.
 The result becomes the new value for 'accumulator'. At the end of the iteration, the final
 value of 'accumulator' is the return value for the method. The initial value of 'accumulator'
 will be the 'initial' parameter.
 */
- (id)reduce:(id)initial block:(id (^)(id accumulator, id obj))block;

/*!
 Invokes block once for each element of self, returning a dictionary with these elements
 as values and the results of the block invocations as keys.
 */
- (NSDictionary*)mapToDictionary:(id<NSCopying> (^)(id obj))block;

/*!
 Invokes block once for each element of self, returning a dictionary with the elements grouped
 into arrays based on the results of the block invocation, using these as keys.
 */
- (NSDictionary*)groupBy:(id<NSCopying> (^)(id obj))block;

@end
