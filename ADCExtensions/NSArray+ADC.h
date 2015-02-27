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
 Returns the first object in the array. If the array is empty, returns nil.
 */
- (id)firstObject;

/*!
 Returns a copy of the array with all objects that are NSNull instances removed.
 */
- (NSArray*)arrayByRemovingNulls;

/*!
 Returns a new array that is a copy of the receiving array with the given object removed.
 */
- (NSArray*)arrayByRemovingObject:(id)object;

/*!
 Returns a new array that is a copy of the receiving array with the object at the given index removed.
 */
- (NSArray*)arrayByRemovingObjectAtIndex:(NSUInteger)index;

/*!
 Returns a new array that is a copy of the receiving array with the given object removed.
 */
- (NSArray*)arrayByRemovingObjectsInArray:(NSArray*)otherArray;

/*! 
 Returns a new array that is a copy of the receiving array with the given object inserted.
 */
- (NSArray*)arrayByInsertingObject:(id)object atIndex:(NSUInteger)index;

/*!
 Returns a copy of the receiving array with all copies of the provided object removed from either end.
 */
- (NSArray *)arrayByTrimmingObject:(id)object fromStart:(BOOL)fromStart fromEnd:(BOOL)fromEnd;

/*! 
 Returns a new array containing the receiving array’s elements up to a specified count.
 */
- (NSArray*)subarrayWithCount:(NSUInteger)count;

/*!
 Returns a new array containing the receiving array’s elements up to a specified index.
 */
- (NSArray*)subarrayToIndex:(NSUInteger)idx;

/*!
 Returns a new array containing the receiving array’s elements starting from a specified index.
 */
- (NSArray*)subarrayFromIndex:(NSUInteger)idx;

@end


