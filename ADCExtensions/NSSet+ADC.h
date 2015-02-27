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
 Returns a copy of the set with all keys and values that are NSNull instances recursively removed.
 */
- (NSSet *)setByRemovingNulls;

/*!
 Returns a new set that is a copy of the receiving set with the given object removed.
 */
- (NSSet *)setByRemovingObject:(id)object;

/*!
 Returns a new set that is a copy of the receiving set with all the objects in the given set removed.
 */
- (NSSet *)setByRemovingObjectsInSet:(NSSet *)other;

/*!
 Returns a new set that is a copy of the receiving set with all the objects in the given array removed.
 */
- (NSSet *)setByRemovingObjectsInArray:(NSArray *)other;

@end


