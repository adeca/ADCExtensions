//
//  NSNumber+ADC.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 19/02/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "NSNumber+ADC.h"

@implementation NSNumber (ADC)

- (BOOL)isGreaterThan:(NSNumber*)number
{
    return [self compare:number] == NSOrderedDescending;
}
- (BOOL)isLessThan:(NSNumber*)number
{
    return [self compare:number] == NSOrderedAscending;
}

@end
