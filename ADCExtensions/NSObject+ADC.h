//
//  NSObject+ADC.h
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 19/02/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ADC)

/*!
 Sends a specified message to the receiver only if the receiver can respond to this message.
 */
- (void)safelyPerformSelector:(SEL)aSelector;
- (void)safelyPerformSelector:(SEL)aSelector withObject:(id)object;
- (void)safelyPerformSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2;

/*!
 Invokes a block on the current thread.
 */
- (void)performBlock:(void(^)())block;
/*!
 Invokes a block on the current thread using the default mode after a delay.
 To cancel all queued blocks, use the cancelPreviousPerformRequestsWithTarget: method.
 */
- (void)performBlock:(void(^)())block afterDelay:(NSTimeInterval)delay __attribute__((deprecated));
/*!
 Invokes a block on the current thread using the default mode after a delay.
 To cancel all queued blocks, use the cancelPreviousPerformRequests method.
 */
- (void)performAfterDelay:(NSTimeInterval)delay block:(void(^)())block;

/*!
 Cancels perform requests previously registered with the performSelector:withObject:afterDelay: method.
 */
- (void)cancelPreviousPerformRequestsWithSelector:(SEL)aSelector object:(id)anArgument;
- (void)cancelPreviousPerformRequests;

/*!
 Invokes a block asynchronously on a background queue with default priority
 */
- (void)performInBackground:(void(^)())block;

/*!
 Invokes a block asynchronously on the main queue
 */
- (void)performInMainThread:(void(^)())block;

@end

