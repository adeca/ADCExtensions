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

@end


