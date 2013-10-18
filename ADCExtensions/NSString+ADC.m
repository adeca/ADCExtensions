//
//  NSString+ADC.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 19/02/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import "NSString+ADC.h"

@implementation NSString (ADC)

- (NSString*)stringByTrimmingWhitespaceCharacters
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL)hasSubstring:(NSString*)substring
{
    return [self hasSubstring:substring options:0];
}
- (BOOL)hasSubstring:(NSString*)substring options:(NSStringCompareOptions)mask
{
    return [self rangeOfString:substring options:mask].location != NSNotFound;
}

+ (NSString*)stringWithUUID
{
    CFUUIDRef uuidObj = CFUUIDCreate(nil);//create a new UUID
    //get the string representation of the UUID
    NSString *uuidString = (NSString*)CFBridgingRelease(CFUUIDCreateString(nil, uuidObj));
    CFRelease(uuidObj);
    
    return uuidString;
}

@end
