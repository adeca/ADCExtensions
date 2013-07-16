//
//  NSStringTest.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 16/07/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+ADC.h"

@interface NSStringTest : XCTestCase

@end

@implementation NSStringTest

- (void)testTrim
{
    XCTAssertEqualObjects([@"abc" stringByTrimmingWhitespaceCharacters], @"abc", @"");
    XCTAssertEqualObjects([@"  abc  " stringByTrimmingWhitespaceCharacters], @"abc", @"");
    XCTAssertEqualObjects([@" \n abc \n " stringByTrimmingWhitespaceCharacters], @"abc", @"");
    XCTAssertEqualObjects([@" \t abc \t " stringByTrimmingWhitespaceCharacters], @"abc", @"");
    XCTAssertEqualObjects([@" a b c " stringByTrimmingWhitespaceCharacters], @"a b c", @"");
}

@end
