//
//  TSOMoney.m
//  Wallet
//
//  Created by Timple Soft on 1/6/15.
//  Copyright (c) 2015 TimpleSoft. All rights reserved.
//

#import "TSOMoney.h"

@interface TSOMoney()

@property (nonatomic) NSUInteger amount;

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


-(id) initWithAmount:(NSUInteger) amount
            currency:(NSString *) currency{
    if (self = [super init]){
        _amount = amount;
        _currency = currency;
    }
    return self;
}


-(TSOMoney *) times:(NSUInteger) multiplier{
    return [[TSOMoney alloc] initWithAmount:self.amount * multiplier currency:self.currency];
}



#pragma mark - Overwritten

-(BOOL) isEqual:(id)object{
    return [self amount] == [object amount] && [self.currency isEqual:[object currency]];
}


-(NSUInteger) hash{
    return (NSUInteger) self.amount;
}



-(NSString *) description{
    return [NSString stringWithFormat:@"<%@ %ld>", [self class], (long)[self amount]];
}

@end
