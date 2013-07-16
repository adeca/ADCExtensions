//
//  NSNumberTest.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 16/07/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSNumber+ADC.h"

@interface NSNumberTest : XCTestCase

@end

@implementation NSNumberTest

- (void)testIsGreater
{
    XCTAssertTrue([@1 isGreaterThan:@0], @"");
    XCTAssertFalse([@0 isGreaterThan:@1], @"");
    XCTAssertFalse([@1 isGreaterThan:@1], @"");
    
    XCTAssertTrue([@1.9 isGreaterThan:@(-0.9)], @"");
    XCTAssertFalse([@(-0.9) isGreaterThan:@1.9], @"");
    XCTAssertFalse([@1.9 isGreaterThan:@1.9], @"");
}

- (void)testIsLess
{
    XCTAssertFalse([@1 isLessThan:@0], @"");
    XCTAssertTrue([@0 isLessThan:@1], @"");
    XCTAssertFalse([@1 isLessThan:@1], @"");
    
    XCTAssertFalse([@1.9 isLessThan:@(-0.9)], @"");
    XCTAssertTrue([@(-0.9) isLessThan:@1.9], @"");
    XCTAssertFalse([@1.9 isLessThan:@1.9], @"");
}

@end
