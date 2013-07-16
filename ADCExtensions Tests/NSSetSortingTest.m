//
//  NSSetSortingTest.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 16/07/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSSet+Sorting.h"

@interface NSSetSortingTest : XCTestCase

@end

@implementation NSSetSortingTest

- (void)testSortingUsingKey
{
    NSDictionary *d1 = @{
                         @"n":@1,
                         @"d":@{
                                 @"dn":@4,
                                 },
                         };
    NSDictionary *d2 = @{
                         @"n":@2,
                         @"d":@{
                                 @"dn":@3,
                                 },
                         };
    
    NSSet *a;
    NSArray *b;
    
    a = [NSSet setWithObjects:d1, d2, nil];
    
    b = @[d1, d2];
    XCTAssertEqualObjects([a sortedArrayUsingKey:@"n" ascending:YES], b, @"");
    b = @[d2, d1];
    XCTAssertEqualObjects([a sortedArrayUsingKey:@"n" ascending:NO], b, @"");
    
    a = [NSSet setWithObjects:d2, d1, nil];
    
    b = @[d1, d2];
    XCTAssertEqualObjects([a sortedArrayUsingKey:@"n" ascending:YES], b, @"");
    b = @[d2, d1];
    XCTAssertEqualObjects([a sortedArrayUsingKey:@"n" ascending:NO], b, @"");
    
    a = [NSSet setWithObjects:d1, d2, nil];
    
    b = @[d2, d1];
    XCTAssertEqualObjects([a sortedArrayUsingKey:@"d.dn" ascending:YES], b, @"");
    b = @[d1, d2];
    XCTAssertEqualObjects([a sortedArrayUsingKey:@"d.dn" ascending:NO], b, @"");
}

@end
