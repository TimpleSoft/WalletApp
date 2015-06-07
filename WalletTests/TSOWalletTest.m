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

@property (strong, nonatomic) TSOWallet *wallet;

@end

@implementation TSOWalletTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.wallet = [[TSOWallet alloc] initWithAmount:10 currency:@"EUR"];
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


-(void) testNumberOfDifferentCurrencies{
    
    XCTAssertEqual([self.wallet countOfDifferentCurrencies], 1);
    
    [self.wallet plus:[TSOMoney dollarWithAmount:20]];
    [self.wallet plus:[TSOMoney dollarWithAmount:20]];
    
    XCTAssertEqual([self.wallet countOfDifferentCurrencies], 2);
    
}

-(void) testNumberOfMoneysForCurrency{
    
    [self.wallet plus:[TSOMoney dollarWithAmount:20]];
    [self.wallet plus:[TSOMoney dollarWithAmount:20]];
    
    XCTAssertEqual([self.wallet countForSection:0], 1);
    XCTAssertEqual([self.wallet countForSection:1], 2);
    
}


-(void) testTakeMoneyAtIndexPath{
    
    [self.wallet plus:[TSOMoney dollarWithAmount:30]];
    [self.wallet plus:[TSOMoney dollarWithAmount:20]];
    
    TSOMoney *dollars = [TSOMoney dollarWithAmount:20];
    TSOMoney *euros = [TSOMoney euroWithAmount:10];
    
    XCTAssertEqualObjects(dollars, [self.wallet takeMoneyAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]]);
    XCTAssertEqualObjects(euros, [self.wallet takeMoneyAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]]);
    
}


-(void) testTotalAmountForSection{
    
    [self.wallet plus:[TSOMoney dollarWithAmount:30]];
    [self.wallet plus:[TSOMoney euroWithAmount:30]];
    [self.wallet plus:[TSOMoney dollarWithAmount:20]];
    
    XCTAssertEqual(40, [self.wallet amountForSection:0]);
    XCTAssertEqual(50, [self.wallet amountForSection:1]);
    
}

@end
