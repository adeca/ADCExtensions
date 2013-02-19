//
//  NSArray+ADC.h
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 19/02/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (ADC)

/*! 
 Calls block once for each element in self, passing that element as a parameter.
 */
- (void)each:(void (^)(id obj))block;

/*! 
 Invokes block once for each element of self, returning a new array containing the
 values returned by the block.
 */
- (NSArray *)map:(id (^)(id obj))block;

/*! 
 Invokes block once for each element of self, returning an array containing those
 elements for which the block returns a true value.
 */
- (NSArray *)select:(BOOL (^)(id obj))block;

/*! 
 Returns the first object in self for which block is true. Returns nil if no match is found.
 */
- (id)match:(BOOL (^)(id obj))block;

/*! 
 Combines all objects of self by applying a binary operation, specified by a block.
 For each object in self the block is passed an accumulator value (accum) and the object.
 The result becomes the new value for 'accumulator'. At the end of the iteration, the final
 value of 'accumulator' is the return value for the method. The initial value of 'accumulator'
 will be the 'initial' parameter.
 */
- (id)reduce:(id)initial block:(id (^)(id accumulator, id obj))block;

/*! 
 Returns YES if the block is true for all objects in self.
 */
- (BOOL)all:(BOOL (^)(id obj))block;

/*! 
 Returns YES if the block is true for any object in self.
 */
- (BOOL)any:(BOOL (^)(id obj))block;

/*! 
 Calls the block once for each pair of elements, one from each array.
 If one array has more elements than the other the method will ignore those extra elements.
 */
- (void)with:(NSArray*)array each:(void (^)(id obj1, id obj2))block;

/*! 
 Returns a new array obtained by removing from the receiver all objects that are not in the given array.
 */
- (NSArray *)intersect:(NSArray*)array;

/*! 
 Returns a new array with the receiver's elements in reverse order.
 */
- (NSArray *)reversed;

/*!
 Returns a new array that is a copy of the receiving array with the given object removed.
 */
- (NSArray*)arrayByRemovingObject:(id)object;

/*! 
 Returns a new array that is a copy of the receiving array with the given object inserted.
 */
- (NSArray*)arrayByInsertingObject:(id)object atIndex:(NSUInteger)index;

/*! 
 Returns a new array containing the receiving array’s elements up to a specified count.
 */
- (NSArray*)subarrayWithCount:(NSUInteger)count;

/*!
 Initialize the array with the provided object added 'count' times.
 */
- (id)initWithCount:(NSUInteger)count object:(id)object;

/*!
 Initialize the array with 'count' copies of the provided object.
 */
- (id)initWithCount:(NSUInteger)count copyingObject:(id<NSCopying>)object;

/*!
 Initialize the array with objects obtained by evaluating the provided block 'count' times.
 */
- (id)initWithCount:(NSUInteger)count objectCreator:(id(^)(NSUInteger idx))objectCreator;

@end

@interface NSMutableArray (ADC)

/*! Invokes block once for each element of self, returning a new array containing the
 values returned by the block.
 */
- (NSMutableArray*)map:(id (^)(id obj))block;

/*! Invokes block once for each element of self, returning an array containing those
 elements for which the block returns a true value.
 */
- (NSMutableArray*)select:(BOOL (^)(id obj))block;

@end
