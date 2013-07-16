//
//  NSObjectCastingTest.m
//  ADCExtensions
//
//  Created by Agustín de Cabrera on 16/07/2013.
//  Copyright (c) 2013 Agustín de Cabrera. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSObject+Casting.h"

@interface NSObjectCastingTest : XCTestCase

@end

@implementation NSObjectCastingTest

- (void)testCasting
{
    XCTAssertNotNil([[NSArray array] asObjectOfClass:[NSArray class]], @"");
    XCTAssertNil([[NSSet set] asObjectOfClass:[NSArray class]], @"");
    XCTAssertNotNil([[NSMutableArray array] asObjectOfClass:[NSArray class]], @"");
    XCTAssertNil([[NSArray array] asObjectOfClass:[NSMutableArray class]], @"");
}

@end
