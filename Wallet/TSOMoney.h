//
//  TSOMoney.h
//  Wallet
//
//  Created by Timple Soft on 1/6/15.
//  Copyright (c) 2015 TimpleSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSOMoney : NSObject

@property (copy, readonly) NSString *currency;

+(instancetype) dollarWithAmount:(NSUInteger) amount;
+(instancetype) euroWithAmount:(NSUInteger) amount;

-(id) initWithAmount:(NSUInteger) amount
            currency:(NSString *) currency;

-(TSOMoney *) times:(NSUInteger) multiplier;



@end
