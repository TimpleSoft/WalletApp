//
//  TSONetworkTest.m
//  Wallet
//
//  Created by Timple Soft on 5/6/15.
//  Copyright (c) 2015 TimpleSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TSOBroker.h"
#import "TSOMoney.h"

@interface TSONetworkTest : XCTestCase

@end

@implementation TSONetworkTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testThatEmptyRatesDefaultsToOneToOne{
    
    
    
}


-(void) testThatEmptyRatesRaisesException{

    TSOBroker *broker = [TSOBroker new];
    
    NSData *jsonData = nil;
    
    XCTAssertThrows([broker parseJSONRates:jsonData], @"An empty json should raise exception");
    
}

@end
