//
//  TSOMoney.m
//  Wallet
//
//  Created by Timple Soft on 1/6/15.
//  Copyright (c) 2015 TimpleSoft. All rights reserved.
//

#import "TSOMoney.h"
#import "TSOBroker.h"

@interface TSOMoney()


@end

@implementation TSOMoney


+(instancetype) dollarWithAmount:(NSUInteger) amount{
    TSOMoney *dollar = [[TSOMoney alloc] initWithAmount:amount currency:@"USD"];
    return dollar;
}


+(instancetype) euroWithAmount:(NSUInteger) amount{
    TSOMoney *euro = [[TSOMoney alloc] initWithAmount:amount currency:@"EUR"];
    return euro;
}


-(id<TSOMoney>) initWithAmount:(NSUInteger) amount
            currency:(NSString *) currency{
    if (self = [super init]){
        _amount = @(amount);
        _currency = currency;
    }
    return self;
}


-(id<TSOMoney>) times:(NSUInteger) multiplier{
    return [[TSOMoney alloc] initWithAmount:[self.amount integerValue] * multiplier currency:self.currency];
}


-(id<TSOMoney>) plus:(TSOMoney *) other{
    TSOMoney *total = [[TSOMoney alloc] initWithAmount:[self.amount integerValue]+[other.amount integerValue]
                                              currency:self.currency];
    return total;
}



-(TSOMoney *) reduceToCurrency:(NSString *) currency withBroker:(TSOBroker *) broker{
    
    // Comprobamos que divisa de origen y de destino son las mismas
    if ([self.currency isEqualToString:currency]) {
        return self;
    }
    
    double rate = [[broker.rates objectForKey:[broker keyFromCurrency:self.currency toCurrency:currency]] doubleValue];
    
    if (rate == 0) {
        // no hay tasa de conversión, lanzamos una excepción
        [NSException raise:@"NoConversionRateException" format:@"Must have a conversion from %@ to %@", self.currency, currency];
    }
    
    NSInteger newAmount = [self.amount integerValue] * rate;
    
    return [[TSOMoney alloc] initWithAmount:newAmount currency:currency];
}


#pragma mark - Overwritten

-(BOOL) isEqual:(id)object{
    return [self amount] == [object amount] && [self.currency isEqual:[object currency]];
}


-(NSUInteger) hash{
    return [self.amount integerValue];
}



-(NSString *) description{
    return [NSString stringWithFormat:@"<%@: %@ %@>", [self class], [self currency], [self amount]];
}

@end
