//
//  TSOWalletTest.m
//  Wallet
//
//  Created by Timple Soft on 4/6/15.
//  Copyright (c) 2015 TimpleSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TSOMoney.h"
#import "TSOBroker.h"
#import "TSOWallet.h"

@interface TSOWalletTest : XCTestCase

@end

@implementation TSOWalletTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// 40€ + 20$ = $100 2:1
-(void) testAdditionWithReduction{

    TSOBroker *broker = [TSOBroker new];
    [broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    TSOWallet *wallet = [[TSOWallet alloc] initWithAmount:40 currency:@"EUR"];
    [wallet plus:[TSOMoney dollarWithAmount:20]];
    
    TSOMoney *reduced = [broker reduce:wallet toCurrency:@"USD"];
    
    XCTAssertEqualObjects([TSOMoney dollarWithAmount:100], reduced, @"40€ + 20$ = $100 2:1");
    
}


@end
