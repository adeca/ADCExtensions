//
//  NSArray+Creation.h
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 14/07/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Creation)

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
