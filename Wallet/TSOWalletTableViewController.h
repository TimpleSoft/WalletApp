//
//  TSOWalletTableViewController.h
//  Wallet
//
//  Created by Timple Soft on 5/6/15.
//  Copyright (c) 2015 TimpleSoft. All rights reserved.
//

@import UIKit;
@class TSOWallet;
@class TSOBroker;

@interface TSOWalletTableViewController : UITableViewController

-(id) initWithModel:(TSOWallet *) model
             broker:(TSOBroker *) broker;

@end
