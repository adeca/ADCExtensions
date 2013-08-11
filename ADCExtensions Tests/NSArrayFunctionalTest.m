//
//  NSArrayFunctionalTest.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 04/08/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+Functional.h"

@interface NSArrayFunctionalTest : XCTestCase

@end

@implementation NSArrayFunctionalTest

- (void)testEach
{
    NSArray *a;
    
    __block int i;
    
    i=0;
    a = @[];
    [a each:^(NSNumber *obj) {
        i += [obj intValue];
    }];
    XCTAssertEqual(i, 0, @"");
    
    i=0;
    a = @[ @1, @2, @3 ];
    [a each:^(NSNumber *obj) {
        i += [obj intValue];
    }];
    XCTAssertEqual(i, 6, @"");
}

- (void)testMap
{
    NSArray *a, *b, *c;
    
    a = @[ @1, @2, @3 ];
    b = [a map:^id(NSNumber *obj) {
        return [NSString stringWithFormat:@"#%d", [obj intValue]];
    }];
    c = @[ @"#1", @"#2", @"#3"];
    XCTAssertEqualObjects(b, c, @"");
    
    a = @[ @1, @2, @3 ];
    b = [a map:^id(NSNumber *obj) {
        // skip even numbers
        if ([obj intValue] % 2 == 0)
            return nil;
        
        return @([obj intValue] * 2);
    }];
    c = @[ @2, @6 ];
    XCTAssertEqualObjects(b, c, @"");
}

- (void)testMapIndexes
{
    NSArray *a, *b, *c;
    
    a = @[ @3, @6 ];
    b = [a mapIndexes:^id(NSNumber *obj, NSUInteger idx) {
        return [NSString stringWithFormat:@"[%d]%d", idx, [obj intValue]];
    }];
    c = @[ @"[0]3", @"[1]6" ];
}

- (void)testSelect
{
    
}

@end
