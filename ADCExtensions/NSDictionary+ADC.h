//
//  NSDictionary+ADC.h
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 19/02/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ADC)

/*!
 Calls block once for each key/value pair in self, passing these as a parameters.
 */
- (void)each:(void (^)(id key, id obj))block;

/*!
 Invokes block once for each key/value pair in self, returning a new dictionary
 where the value for each key is replaced by the result of the block invocation.
 */
- (NSDictionary *)map:(id (^)(id key, id obj))block;

/*!
 Invokes block once for each key/object pair in self, returning a dictionary containing those
 elements for which the block returns a true value.
 */
- (NSDictionary *)select:(BOOL (^)(id key, id obj))block;

/*!
 Returns the set of objects from the dictionary that corresponds to the specified keys as an NSArray.
 Keys not present in the receiver will be skipped.
 The objects in the returned array and the keys array do NOT necesarily have a one-for-one correspondence.
 
 @param keys    An NSArray containing the keys for which to return corresponding values.
 */
- (NSArray *)objectsForKeys:(NSArray *)keys;

@end

@interface NSMutableDictionary (ADC)

/*!
 Invokes block once for each key/value pair in self, returning a new dictionary
 where the value for each key is replaced by the result of the block invocation.
 */
- (NSDictionary *)map:(id (^)(id key, id obj))block;

/*!
 Invokes block once for each key/object pair in self, returning a dictionary containing those
 elements for which the block returns a true value.
 */
- (NSDictionary *)select:(BOOL (^)(id key, id obj))block;

@end
