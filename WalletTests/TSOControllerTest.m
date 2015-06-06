//
//  TSOControllerTest.m
//  Wallet
//
//  Created by Timple Soft on 5/6/15.
//  Copyright (c) 2015 TimpleSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TSOWalletTableViewController.h"
#import "TSOWallet.h"

@interface TSOControllerTest : XCTestCase

@property (strong, nonatomic) TSOWalletTableViewController *walletVC;
@property (strong, nonatomic) TSOWallet *wallet;

@end

@implementation TSOControllerTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.wallet = [[TSOWallet alloc] initWithAmount:1 currency:@"USD"];
    [self.wallet plus:[TSOMoney euroWithAmount:1]];
    self.walletVC = [[TSOWalletTableViewController alloc] initWithModel:self.wallet];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

-(void) testThatTableHasOneSection{
    
    NSUInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
    XCTAssertEqual(sections, 1, @"There can only be one!");
    
}

-(void) testThatNumberOfCellsIsNumberOfMoneyPlusOne{
    
    XCTAssertEqual(self.wallet.count + 1, [self.walletVC tableView:nil numberOfRowsInSection:0], @"Number of cells is the number of moneys plus 1 (the total)");
    
}

@end
