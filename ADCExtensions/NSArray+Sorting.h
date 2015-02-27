//
//  NSArray+Sorting.h
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 14/07/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Sorting)

/*!
 Returns a copy of the receiving array sorted by using a given key path for comparison.
 */
- (NSArray *)sortedArrayUsingKey:(NSString*)key ascending:(BOOL)ascending;

/*!
 Returns a copy of the receiving array sorted by using a given key path for comparison.
 */
- (NSArray *)sortedArrayUsingKey:(NSString*)key ascending:(BOOL)ascending selector:(SEL)selector;

@end
