//
//  TSOWallet.h
//  Wallet
//
//  Created by Timple Soft on 4/6/15.
//  Copyright (c) 2015 TimpleSoft. All rights reserved.
//

@import Foundation;
#import "TSOMoney.h"


@interface TSOWallet : NSObject<TSOMoney>

@property (nonatomic, readonly) NSUInteger count;

-(void) subscribeToMemoryWarning:(NSNotificationCenter *) nc;

@end