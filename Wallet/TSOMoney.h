//
//  TSOMoney.h
//  Wallet
//
//  Created by Timple Soft on 1/6/15.
//  Copyright (c) 2015 TimpleSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TSOMoney;
@class TSOBroker;

@protocol TSOMoney <NSObject>


-(id) initWithAmount:(NSUInteger) amount
            currency:(NSString *) currency;

-(id<TSOMoney>) times:(NSUInteger) multiplier;

-(id<TSOMoney>) plus:(TSOMoney *) other;

-(TSOMoney *) reduceToCurrency:(NSString *) currency withBroker:(TSOBroker *) broker;


@end



@interface TSOMoney : NSObject<TSOMoney>

@property (strong, nonatomic, readonly) NSNumber *amount;
@property (copy, readonly) NSString *currency;


+(instancetype) dollarWithAmount:(NSUInteger) amount;
+(instancetype) euroWithAmount:(NSUInteger) amount;




@end
