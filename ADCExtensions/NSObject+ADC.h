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
 Returns self if the object is of the specified class (or any subclass of it), nil otherwise.
 */
- (id)asObjectOfClass:(Class)aClass;

/*!
 Invokes a block on the current thread.
 */
- (void)performBlock:(void(^)())block;
/*!
 Invokes a block on the current thread using the default mode after a delay.
 To cancel all queued blocks, use the cancelPreviousPerformRequestsWithTarget: method.
 */
- (void)performBlock:(void(^)())block afterDelay:(NSTimeInterval)delay;

/*!
 Cancels perform requests previously registered with the performSelector:withObject:afterDelay: method.
 */
- (void)cancelPreviousPerformRequestsWithSelector:(SEL)aSelector object:(id)anArgument;
- (void)cancelPreviousPerformRequests;

@end
