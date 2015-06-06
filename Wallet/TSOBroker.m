//
//  TSOBroker.m
//  Wallet
//
//  Created by Timple Soft on 4/6/15.
//  Copyright (c) 2015 TimpleSoft. All rights reserved.
//

#import "TSOBroker.h"
#import "TSOMoney.h"


@interface TSOBroker ()


@end



@implementation TSOBroker

-(id) init{
    
    if (self = [super init]) {
        _rates = [@{} mutableCopy];
    }
    
    return self;
    
}


-(TSOMoney *) reduce:(id<TSOMoney>) money toCurrency:(NSString *) currency{
    
    // double dispatch
    return [money reduceToCurrency:currency withBroker:self];

}

-(void) addRate:(NSInteger) rate
   fromCurrency:(NSString *) fromCurrency
     toCurrency:(NSString *) toCurrency{
    
    [self.rates setObject:@(rate) forKey:[self keyFromCurrency:fromCurrency toCurrency:toCurrency]];
    
    // tambien añadimos la inversa
    [self.rates setObject:@(1.0/rate) forKey:[self keyFromCurrency:toCurrency toCurrency:fromCurrency]];
    
}


#pragma mark - Utils
-(NSString *) keyFromCurrency:(NSString *) fromCurrency
                   toCurrency:(NSString *) toCurrency{
    
    return [NSString stringWithFormat:@"%@-%@", fromCurrency, toCurrency];

}




#pragma mark - Rates



-(void) parseJSONRates:(NSData *) jsonData{
    
    NSError *error = nil;
    
    id obj = [NSJSONSerialization JSONObjectWithData:jsonData
                                             options:NSJSONReadingAllowFragments
                                               error:&error];
    if (obj != nil) {
        // pillamos los rates y los vamos añadiendo al broker
    }else{
        
        // No hemos recibido nada
        [NSException raise:@"NoRatesException" format:@"JSON must carry some data!"];
        
    }
}












@end














