//
//  NSDictionaryTest.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 16/07/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDictionary+ADC.h"

@interface NSDictionaryTest : XCTestCase

@end

@implementation NSDictionaryTest

- (void)testObjectsForKeys
{
    NSDictionary *a;
    NSArray *b, *c;
    
    a = @{};
    b = @[];
    c = @[];
    XCTAssertEqualObjects([a objectsForKeys:c], b, @"");
    c = @[@1, @2];
    XCTAssertEqualObjects([a objectsForKeys:c], b, @"");
    
    a = @{@1: @"a", @2: @"b", @3: @"c"};
    
    b = @[@"a"];
    c = @[@1];
    XCTAssertEqualObjects([a objectsForKeys:c], b, @"");
    c = @[@1, @4];
    XCTAssertEqualObjects([a objectsForKeys:c], b, @"");
    
    b = @[@"a", @"c"];
    c = @[@1, @3];
    XCTAssertEqualObjects([a objectsForKeys:c], b, @"");
    
    b = @[@"b", @"a"];
    c = @[@2, @4, @1];
    XCTAssertEqualObjects([a objectsForKeys:c], b, @"");
    
    b = @[];
    c = @[@4];
    XCTAssertEqualObjects([a objectsForKeys:c], b, @"");
}

- (void)testRemovingNulls
{
    NSDictionary *a, *b;
    
    a = @{}; b = @{};
    XCTAssertEqualObjects([a dictionaryByRemovingNulls], b, @"");
    
    a = @{@1:@"a", @2:@"b"};
    b = @{@1:@"a", @2:@"b"};
    XCTAssertEqualObjects([a dictionaryByRemovingNulls], b, @"");
    
    a = @{@1:@"a", @2:[NSNull null], @3:@"c"};
    b = @{@1:@"a", @3:@"c"};
    XCTAssertEqualObjects([a dictionaryByRemovingNulls], b, @"");
    
    a = @{@1:@"a", [NSNull null]:@"n", @3:@"c"};
    b = @{@1:@"a", @3:@"c"};
    XCTAssertEqualObjects([a dictionaryByRemovingNulls], b, @"");
    
    a = @{@1:@"a", @2:@{@4:[NSNull null], @5:@"e"}, @3:@"c"};
    b = @{@1:@"a", @2:@{@5:@"e"}, @3:@"c"};
    XCTAssertEqualObjects([a dictionaryByRemovingNulls], b, @"");
    
    a = @{@1:@"a", @2:@[@4, [NSNull null], @5], @3:@"c"};
    b = @{@1:@"a", @2:@[@4, @5], @3:@"c"};
    XCTAssertEqualObjects([a dictionaryByRemovingNulls], b, @"");
    
    a = @{@1:@"a", @2:[NSSet setWithObjects:@3, [NSNull null], @4, nil], @3:@"c"};
    b = @{@1:@"a", @2:[NSSet setWithObjects:@3, @4, nil], @3:@"c"};
    XCTAssertEqualObjects([a dictionaryByRemovingNulls], b, @"");
}

@end
