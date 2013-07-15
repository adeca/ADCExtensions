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

@end


