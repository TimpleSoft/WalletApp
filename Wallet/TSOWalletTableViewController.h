//
//  TSOWalletTableViewController.h
//  Wallet
//
//  Created by Timple Soft on 5/6/15.
//  Copyright (c) 2015 TimpleSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TSOWallet;

@interface TSOWalletTableViewController : UITableViewController

-(id) initWithModel:(TSOWallet *) model;

@end
