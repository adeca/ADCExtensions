//
//  NSArrayTest
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 16/07/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+ADC.h"

@interface NSArrayTest : XCTestCase

@end

@implementation NSArrayTest

- (void)testFirstObject
{
    NSArray *a;
    
    a = @[];
    XCTAssertNil([a firstObject], @"");
    
    a = @[@1, @2];
    XCTAssertEqualObjects([a firstObject], @1, @"");
}

- (void)testRemovingNulls
{
    NSArray *a, *b;
    
    a = @[]; b = @[];
    XCTAssertEqualObjects([a arrayByRemovingNulls], b, @"");
    
    a = @[@1, @2];
    b = @[@1, @2];
    XCTAssertEqualObjects([a arrayByRemovingNulls], b, @"");
    
    a = @[@1, [NSNull null], @2];
    b = @[@1, @2];
    XCTAssertEqualObjects([a arrayByRemovingNulls], b, @"");
    
    a = @[@1, @[@3, [NSNull null], @4], @2];
    b = @[@1, @[@3, @4], @2];
    XCTAssertEqualObjects([a arrayByRemovingNulls], b, @"");
    
    a = @[@1, @{@3: [NSNull null], @4: @"a"}, @2];
    b = @[@1, @{@4: @"a"}, @2];
    XCTAssertEqualObjects([a arrayByRemovingNulls], b, @"");
    
    a = @[@1, [NSSet setWithObjects:@3, [NSNull null], @4, nil], @2];
    b = @[@1, [NSSet setWithObjects:@3, @4, nil], @2];
    XCTAssertEqualObjects([a arrayByRemovingNulls], b, @"");
}

- (void)testRemovingObject
{
    NSArray *a, *b;
    
    a = @[];
    b = @[];
    XCTAssertEqualObjects([a arrayByRemovingObject:@1], b, @"");
    
    a = @[@1, @2];
    b = @[@2];
    XCTAssertEqualObjects([a arrayByRemovingObject:@1], b, @"");
    
    a = @[@2, @3];
    b = @[@2, @3];
    XCTAssertEqualObjects([a arrayByRemovingObject:@1], b, @"");
}

- (void)testRemovingObjectsInArray
{
    NSArray *a, *b, *c;
    
    a = @[];
    b = @[];
    
    c = @[];
    XCTAssertEqualObjects([a arrayByRemovingObjectsInArray:c], b, @"");
    c = @[@1, @2];
    XCTAssertEqualObjects([a arrayByRemovingObjectsInArray:c], b, @"");
    
    a = @[@1, @2, @3 ,@4];
    b = @[@1, @3];
    c = @[@2, @4];
    XCTAssertEqualObjects([a arrayByRemovingObjectsInArray:c], b, @"");
    c = @[@4, @2];
    XCTAssertEqualObjects([a arrayByRemovingObjectsInArray:c], b, @"");
}

- (void)testInsertingObject
{
    NSArray *a, *b;
    
    a = @[];
    b = @[@1];
    XCTAssertEqualObjects([a arrayByInsertingObject:@1 atIndex:0], b, @"");
    
    a = @[];
    XCTAssertThrows([a arrayByInsertingObject:@1 atIndex:1], @"");
    
    a = @[@1];
    b = @[@1, @2];
    XCTAssertEqualObjects([a arrayByInsertingObject:@2 atIndex:1], b, @"");
    
    a = @[@2];
    b = @[@1, @2];
    XCTAssertEqualObjects([a arrayByInsertingObject:@1 atIndex:0], b, @"");
    
    a = @[@1, @3];
    b = @[@1, @2, @3];
    XCTAssertEqualObjects([a arrayByInsertingObject:@2 atIndex:1], b, @"");
}

- (void)testSubarrayWithCount
{
    NSArray *a, *b;
    
    a = @[];
    b = @[];
    XCTAssertEqualObjects([a subarrayWithCount:0], b, @"");
    XCTAssertEqualObjects([a subarrayWithCount:1], b, @"");
    XCTAssertEqualObjects([a subarrayWithCount:99], b, @"");
    
    a = @[@1, @2, @3];
    
    b = @[];
    XCTAssertEqualObjects([a subarrayWithCount:0], b, @"");
    b = @[@1];
    XCTAssertEqualObjects([a subarrayWithCount:1], b, @"");
    b = @[@1, @2];
    XCTAssertEqualObjects([a subarrayWithCount:2], b, @"");
    b = @[@1, @2, @3];
    XCTAssertEqualObjects([a subarrayWithCount:3], b, @"");
    XCTAssertEqualObjects([a subarrayWithCount:4], b, @"");
    XCTAssertEqualObjects([a subarrayWithCount:99], b, @"");
}

- (void)testSubarrayToIndex
{
    NSArray *a, *b;
    
    a = @[];
    b = @[];
    XCTAssertEqualObjects([a subarrayToIndex:0], b, @"");
    XCTAssertEqualObjects([a subarrayToIndex:1], b, @"");
    XCTAssertEqualObjects([a subarrayToIndex:99], b, @"");
    
    a = @[@1, @2, @3];
    
    b = @[@1];
    XCTAssertEqualObjects([a subarrayToIndex:0], b, @"");
    b = @[@1, @2];
    XCTAssertEqualObjects([a subarrayToIndex:1], b, @"");
    b = @[@1, @2, @3];
    XCTAssertEqualObjects([a subarrayToIndex:2], b, @"");
    XCTAssertEqualObjects([a subarrayToIndex:3], b, @"");
    XCTAssertEqualObjects([a subarrayToIndex:99], b, @"");
}

- (void)testSubarrayFromIndex
{
    NSArray *a, *b;
    
    a = @[];
    b = @[];
    XCTAssertEqualObjects([a subarrayFromIndex:0], b, @"");
    XCTAssertEqualObjects([a subarrayFromIndex:1], b, @"");
    XCTAssertEqualObjects([a subarrayFromIndex:99], b, @"");
    
    a = @[@1, @2, @3];
    
    b = @[@1, @2, @3];
    XCTAssertEqualObjects([a subarrayFromIndex:0], b, @"");
    b = @[@2, @3];
    XCTAssertEqualObjects([a subarrayFromIndex:1], b, @"");
    b = @[@3];
    XCTAssertEqualObjects([a subarrayFromIndex:2], b, @"");
    b = @[];
    XCTAssertEqualObjects([a subarrayFromIndex:3], b, @"");
    XCTAssertEqualObjects([a subarrayFromIndex:4], b, @"");
    XCTAssertEqualObjects([a subarrayFromIndex:99], b, @"");
}

@end
