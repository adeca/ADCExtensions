//
//  NSObject+Casting.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 15/07/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "NSObject+Casting.h"

@implementation NSObject (Casting)

- (id)asObjectOfClass:(Class)aClass
{
    return [self isKindOfClass:aClass] ? self : nil;
}

@end
