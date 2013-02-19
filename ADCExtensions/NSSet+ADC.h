//
//  NSSet+ADC.h
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 19/02/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSSet (ADC)

/*! 
 Calls block once for each element in self, passing that element as a parameter.
 */
- (void)each:(void (^)(id obj))block;

/*! 
 Invokes block once for each element of self, returning a new set containing the
 values returned by the block.
 */
- (NSSet*)map:(id (^)(id obj))block;

/*! 
 Invokes block once for each element of self, returning a set containing those
 elements for which the block returns a true value.
 */
- (NSSet *)select:(BOOL (^)(id obj))block;

/*! 
 Returns an object in self for which block is true. Returns nil if no match is found.
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

/*!
 Combines all objects of self by applying a binary operation, specified by a block.
 For each object in self the block is passed an accumulator value (accum) and the object.
 The result becomes the new value for 'accumulator'. At the end of the iteration, the final
 value of 'accumulator' is the return value for the method. The initial value of 'accumulator'
 will be the 'initial' parameter.
 */
- (id)reduce:(id)initial block:(id (^)(id accumulator, id obj))block;

@end

@interface NSMutableSet (ADC)

/*!
 Invokes block once for each element of self, returning a new set containing the
 values returned by the block.
 */
- (NSSet*)map:(id (^)(id obj))block;

/*!
 Invokes block once for each element of self, returning a set containing those
 elements for which the block returns a true value.
 */
- (NSSet *)select:(BOOL (^)(id obj))block;

@end
