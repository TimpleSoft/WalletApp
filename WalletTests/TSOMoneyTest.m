//
//  TSOMonyTest.m
//  Wallet
//
//  Created by Timple Soft on 1/6/15.
//  Copyright (c) 2015 TimpleSoft. All rights reserved.
//

@import Foundation;
#import <XCTest/XCTest.h>
#import "TSOMoney.h"

@interface TSOMoneyTest : XCTestCase

@end

@implementation TSOMoneyTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testThatInitDoesRaisesException{
    
    XCTAssertNoThrow([[TSOMoney alloc] initWithAmount:6 currency:@"EUR"]);
    
}


-(void) testCurrency{
    
    TSOMoney *dollars = [TSOMoney dollarWithAmount:1];
    
    XCTAssertEqualObjects(@"USD", [dollars currency]);
    
    TSOMoney *euros = [TSOMoney euroWithAmount:3];
    
    XCTAssertEqualObjects([euros currency], @"EUR");
    
}


-(void) testMultiplication{
    
    TSOMoney *five = [TSOMoney euroWithAmount:5];
    TSOMoney *product = [five times:2];
    XCTAssertEqualObjects(product, [TSOMoney euroWithAmount:10]);
    
    TSOMoney *fiveUSD = [TSOMoney dollarWithAmount:5];
    TSOMoney *productUSD = [fiveUSD times:2];
    XCTAssertEqualObjects(productUSD, [TSOMoney dollarWithAmount:10]);
    
}

-(void) testSimpleAddition{
    
    TSOMoney *sum = [[TSOMoney dollarWithAmount:5] plus:[TSOMoney dollarWithAmount:5]];
    XCTAssertEqualObjects(sum, [TSOMoney dollarWithAmount:10], @"$5 + $5 = $,10");
    
}

-(void) testEquality{
    
    TSOMoney *five = [TSOMoney euroWithAmount:5];
    TSOMoney *otherFive = [TSOMoney euroWithAmount:5];
    
    XCTAssertEqualObjects(five, otherFive);
    
    TSOMoney *seven = [TSOMoney euroWithAmount:7];
    XCTAssertNotEqualObjects(five, seven);
    
}

-(void) testDifferentCurrencies{
    TSOMoney *euro = [TSOMoney euroWithAmount:1];
    TSOMoney *dollar = [TSOMoney dollarWithAmount:1];
    
    XCTAssertNotEqualObjects(euro, dollar, @"Diffrent currencies should not be equal");
}

-(void) testHash{
    
    TSOMoney *a = [TSOMoney euroWithAmount:2];
    TSOMoney *b = [TSOMoney euroWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal objects must hace same hash");
    
    TSOMoney *c = [TSOMoney dollarWithAmount:3];
    TSOMoney *d = [TSOMoney dollarWithAmount:3];
    
    XCTAssertEqual([c hash], [d hash], @"Equal objects must hace same hash");
}

-(void) testThatHashIsAmount{
    
    TSOMoney *one = [TSOMoney euroWithAmount:1];
    
    XCTAssertEqual([one hash], 1, @"The hash must be the same as the amount");
    
}

-(void) testDescription{
    
    TSOMoney *one = [TSOMoney dollarWithAmount:1];
    NSString *desc = @"<TSOMoney: USD 1>";
    
    XCTAssertEqualObjects(desc, [one description], @"Description must match template");
    
}





@end
