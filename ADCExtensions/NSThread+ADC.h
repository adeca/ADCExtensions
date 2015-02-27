//
//  NSThread+ADC.h
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 2/27/15.
//  Copyright (c) 2015 Agustín de Cabrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSThread (ADC)

/*!
 Returns the object from the thread's dictionary associated with the given key, or 
 the results of the given block if no object is found. In the latter case it 
 will also add the object to the dictionary.
 */
- (id)objectFromThreadDictionary:(id<NSCopying>)key orBlockResult:(id(^)())block;

/*!
 Returns the object from the current thread's dictionary associated with the given key, or
 the results of the given block if no object is found.
 */
+ (id)objectFromThreadDictionary:(id<NSCopying>)key orBlockResult:(id(^)())block;

@end
