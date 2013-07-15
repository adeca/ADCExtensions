//
//  NSSet+Sorting.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 14/07/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "NSSet+Sorting.h"

@implementation NSSet (Sorting)

- (NSArray *)sortedArrayUsingKey:(NSString*)key ascending:(BOOL)ascending
{
    return [self sortedArrayUsingDescriptors:
            @[[NSSortDescriptor sortDescriptorWithKey:key ascending:ascending]]];
}

@end
