//
//  TSOWalletTableViewController.m
//  Wallet
//
//  Created by Timple Soft on 5/6/15.
//  Copyright (c) 2015 TimpleSoft. All rights reserved.
//

#import "TSOWalletTableViewController.h"
#import "TSOWallet.h"
#import "TSOBroker.h"

@interface TSOWalletTableViewController ()

@property (strong, nonatomic) TSOWallet *model;
@property (strong, nonatomic) TSOBroker *broker;

@end

@implementation TSOWalletTableViewController

-(id) initWithModel:(TSOWallet *) model
             broker:(TSOBroker *) broker{
    
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        _model = model;
        _broker = broker;
    }
    
    return self;
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [self.model countOfDifferentCurrencies] + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section == [self.model countOfDifferentCurrencies]) {
        return 1;
    }
    return [self.model countForSection:section] + 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    // CELDA DE GRAN TOTAL
    if (indexPath.section == [self.model countOfDifferentCurrencies]) {
        TSOMoney *totalEuros = [self.model reduceToCurrency:@"EUR" withBroker:self.broker];
        cell.textLabel.text = [NSString stringWithFormat:@"Total: %@ %@", totalEuros.amount, totalEuros.currency];
    }else{
        // CELDA DE SUBTOTAL
        if (indexPath.row == [self.model countForSection:indexPath.section]) {
            cell.textLabel.text = [NSString stringWithFormat:@"Subtotal: %ld", [self.model amountForSection:indexPath.section]];
        }else{
            // CELDA NORMAL
            TSOMoney *money = [self.model takeMoneyAtIndexPath:indexPath];
            cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", money.amount, money.currency];
        }
        
    }
    return cell;
}

@end
