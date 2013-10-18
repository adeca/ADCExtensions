//
//  NSString+ADC.h
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 19/02/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ADC)

- (NSString*)stringByTrimmingWhitespaceCharacters;

- (BOOL)hasSubstring:(NSString*)substring;
- (BOOL)hasSubstring:(NSString*)substring options:(NSStringCompareOptions)mask;

+ (NSString*)stringWithUUID;

@end
