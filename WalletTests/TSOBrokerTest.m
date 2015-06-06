//
//  TSOBrokerTest.m
//  Wallet
//
//  Created by Timple Soft on 4/6/15.
//  Copyright (c) 2015 TimpleSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TSOMoney.h"
#import "TSOBroker.h"

@interface TSOBrokerTest : XCTestCase

@property (strong, nonatomic) TSOBroker *emptyBroker;
@property (strong, nonatomic) TSOMoney *oneDollar;

@end

@implementation TSOBrokerTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.emptyBroker = [TSOBroker new];
    self.oneDollar = [TSOMoney dollarWithAmount:1];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
    self.emptyBroker = nil;
    self.oneDollar = nil;
}

-(void) testSimpleReduction{
    
    TSOMoney *sum = [[TSOMoney dollarWithAmount:5] plus:[TSOMoney dollarWithAmount:5]];
    
    TSOMoney *reduced = [self.emptyBroker reduce:sum toCurrency:@"USD"];
    
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency shoul be a NOP");
    
}

// $10 == $5 2:1
-(void) testReduction{
    
    [self.emptyBroker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    TSOMoney *dollars = [TSOMoney dollarWithAmount:10];
    TSOMoney *euros = [TSOMoney euroWithAmount:5];
    
    TSOMoney *converted = [self.emptyBroker reduce:euros toCurrency:@"USD"];
    
    XCTAssertEqualObjects(converted, dollars, @"$10 == $5 2:1");
    
}



-(void) testThatNoRateRaisesException{
    
    XCTAssertThrows([self.emptyBroker reduce:self.oneDollar toCurrency:@"EUR"], @"No rates should cause exception");
    
}

-(void) testThatNilConversionDoesNotChangeMoney{
    
    XCTAssertEqualObjects(self.oneDollar, [self.emptyBroker reduce:self.oneDollar toCurrency:self.oneDollar.currency], @"Nil conversion should have no effect");
    
}



@end
