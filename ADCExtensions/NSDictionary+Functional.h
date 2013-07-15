//
//  NSDictionary+Functional.h
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 14/07/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Functional)

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

@end

@interface NSMutableDictionary (Functional)

/*!
 Invokes block once for each key/value pair in self, returning a new dictionary
 where the value for each key is replaced by the result of the block invocation.
 */
- (NSMutableDictionary *)map:(id (^)(id key, id obj))block;

/*!
 Invokes block once for each key/object pair in self, returning a dictionary containing those
 elements for which the block returns a true value.
 */
- (NSMutableDictionary *)select:(BOOL (^)(id key, id obj))block;

@end
