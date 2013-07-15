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
 Returns the set of objects from the dictionary that corresponds to the specified keys as an NSArray.
 Keys not present in the receiver will be skipped.
 The objects in the returned array and the keys array do NOT necesarily have a one-for-one correspondence.
 
 @param keys    An NSArray containing the keys for which to return corresponding values.
 */
- (NSArray *)objectsForKeys:(NSArray *)keys;

@end


