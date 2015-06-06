//
//  TSONotificationCenterTest.m
//  Wallet
//
//  Created by Timple Soft on 5/6/15.
//  Copyright (c) 2015 TimpleSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TSOFakeNotificationCenter.h"
#import "TSOWallet.h"

@interface TSONotificationCenterTest : XCTestCase

@end

@implementation TSONotificationCenterTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


-(void) testThatSubscribesToMemoryWarning{
    
    TSOFakeNotificationCenter *fake = [TSOFakeNotificationCenter new];
    
    TSOWallet *w = [TSOWallet new];
    
    [w subscribeToMemoryWarning:(NSNotificationCenter *)fake];
    
    NSDictionary *obs = [fake observers];
    id observer = [obs objectForKey:UIApplicationDidReceiveMemoryWarningNotification];
    
    XCTAssertEqualObjects(observer, w, @"Fat object must subscribe to UIApplicationDidReceiveMemoryWarningNotification");
    
}

@end
