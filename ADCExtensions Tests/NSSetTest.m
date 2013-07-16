//
//  NSSetTest.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 16/07/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSSet+ADC.h"

@interface NSSetTest : XCTestCase

@end

@implementation NSSetTest

- (void)testRemovingNulls
{
    NSSet *a, *b;
    
    a = [NSSet set];
    b = [NSSet set];
    XCTAssertEqualObjects([a setByRemovingNulls], b, @"");
    
    a = [NSSet setWithObjects:@1, @2, nil];
    b = [NSSet setWithObjects:@1, @2, nil];
    XCTAssertEqualObjects([a setByRemovingNulls], b, @"");
    
    a = [NSSet setWithObjects:@1, [NSNull null], @2, nil];
    b = [NSSet setWithObjects:@1, @2, nil];
    XCTAssertEqualObjects([a setByRemovingNulls], b, @"");
    
    a = [NSSet setWithObjects:@1, [NSSet setWithObjects:@3, [NSNull null], @4, nil], @2, nil];
    b = [NSSet setWithObjects:@1, [NSSet setWithObjects:@3, @4, nil], @2, nil];
    XCTAssertEqualObjects([a setByRemovingNulls], b, @"");
    
    a = [NSSet setWithObjects:@1, @{@3: [NSNull null], @4: @"a"}, @2, nil];
    b = [NSSet setWithObjects:@1, @{@4: @"a"}, @2, nil];
    XCTAssertEqualObjects([a setByRemovingNulls], b, @"");
    
    a = [NSSet setWithObjects:@1, [NSSet setWithObjects:@3, [NSNull null], @4, nil], @2, nil];
    b = [NSSet setWithObjects:@1, [NSSet setWithObjects:@3, @4, nil], @2, nil];
    XCTAssertEqualObjects([a setByRemovingNulls], b, @"");
}

@end
