//
//  NSObject+Casting.h
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 15/07/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Casting)

/*!
 Returns self if the object is of the specified class (or any subclass of it), nil otherwise.
 */
- (id)asObjectOfClass:(Class)aClass;

@end

#ifndef SAFE_CAST
#   define SAFE_CAST(classname, obj) [(obj) asObjectOfClass:[classname class]]
#endif

