//
//  NSDictionary+ADC.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 19/02/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "NSDictionary+ADC.h"
#import "NSArray+Functional.h"

@implementation NSDictionary (ADC)

- (NSArray *)objectsForKeys:(NSArray *)keys
{
    return [keys map:^id(id key) {
        return self[key];
    }];
}

@end
