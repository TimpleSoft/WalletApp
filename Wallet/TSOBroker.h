//
//  TSOBroker.h
//  Wallet
//
//  Created by Timple Soft on 4/6/15.
//  Copyright (c) 2015 TimpleSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSOMoney.h"

@interface TSOBroker : NSObject

@property (nonatomic, strong) NSMutableDictionary *rates;

-(TSOMoney *) reduce:(id<TSOMoney>) money toCurrency:(NSString *) currency;
-(void) addRate:(NSInteger) rate
   fromCurrency:(NSString *) fromCurrency
     toCurrency:(NSString *) toCurrency;

-(NSString *) keyFromCurrency:(NSString *) fromCurrency
                   toCurrency:(NSString *) toCurrency;

-(void) parseJSONRates:(NSData *) jsonData;


@end
