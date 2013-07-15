//
//  NSObject+ADC.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 19/02/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "NSObject+ADC.h"

@implementation NSObject (ADC)

- (void)performBlock:(void(^)())block
{
    if (block)
        block();
}
- (void)performBlock:(void(^)())block afterDelay:(NSTimeInterval)delay
{
    [self performSelector:@selector(performBlock:) withObject:block afterDelay:delay];
}

- (void)cancelPreviousPerformRequestsWithSelector:(SEL)aSelector object:(id)anArgument
{
    [[self class] cancelPreviousPerformRequestsWithTarget:self selector:aSelector object:anArgument];
}
- (void)cancelPreviousPerformRequests
{
    [[self class] cancelPreviousPerformRequestsWithTarget:self];
}

@end
