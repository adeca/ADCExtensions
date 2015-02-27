//
//  NSObject+ADC.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 19/02/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "NSObject+ADC.h"

@implementation NSObject (ADC)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
- (void)safelyPerformSelector:(SEL)selector
{
	if ([self respondsToSelector:selector]) {
		[self performSelector:selector];
	}
}

- (void)safelyPerformSelector:(SEL)selector withObject:(id)object
{
	if ([self respondsToSelector:selector]) {
		[self performSelector:selector withObject:object];
	}
}

- (void)safelyPerformSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2
{
    if ([self respondsToSelector:aSelector]) {
        [self performSelector:aSelector withObject:object1 withObject:object2];
    }
}
#pragma clang diagnostic pop

- (void)performBlock:(void(^)())block
{
    if (block)
        block();
}
- (void)performBlock:(void(^)())block afterDelay:(NSTimeInterval)delay
{
    [self performSelector:@selector(performBlock:) withObject:block afterDelay:delay];
}
- (void)performAfterDelay:(NSTimeInterval)delay block:(void(^)())block
{
    [self performSelector:@selector(performBlock:) withObject:[block copy] afterDelay:delay];
}

- (void)cancelPreviousPerformRequestsWithSelector:(SEL)aSelector object:(id)anArgument
{
    [[self class] cancelPreviousPerformRequestsWithTarget:self selector:aSelector object:anArgument];
}
- (void)cancelPreviousPerformRequests
{
    [[self class] cancelPreviousPerformRequestsWithTarget:self];
}

- (void)performInBackground:(void(^)())block
{
    if (!block)
        return;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}

- (void)performInMainThread:(void(^)())block
{
    if (!block)
        return;
    
    dispatch_async(dispatch_get_main_queue(), block);
}

@end
