//
//  TSOWallet.m
//  Wallet
//
//  Created by Timple Soft on 4/6/15.
//  Copyright (c) 2015 TimpleSoft. All rights reserved.
//

#import "TSOWallet.h"

@interface TSOWallet ()

@property (nonatomic, strong) NSMutableArray *moneys;

@end

@implementation TSOWallet

-(NSUInteger)count{
    return [self.moneys count];
}

-(id) initWithAmount:(NSUInteger)amount currency:(NSString *)currency{
 
    if (self = [super init]) {
        
        TSOMoney *money = [[TSOMoney alloc] initWithAmount:amount currency:currency];
        _moneys = [NSMutableArray arrayWithObject:money];
        
    }
    
    return self;
}

-(id<TSOMoney>) plus:(TSOMoney *)other{
    
    [self.moneys addObject:other];
    return self;
    
}

-(id<TSOMoney>) times:(NSUInteger)multiplier{
    
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
    
    for (TSOMoney *each in self.moneys) {
        
        TSOMoney *newMoney = [each times:multiplier];
        [newMoneys addObject:newMoney];
        
    }
    
    self.moneys = newMoneys;
    return self;
}


-(TSOMoney *) reduceToCurrency:(NSString *)currency withBroker:(TSOBroker *)broker{
    
    TSOMoney *result = [[TSOMoney alloc] initWithAmount:0 currency:currency];
    
    for (TSOMoney *money in self.moneys) {
        
        result = [[money reduceToCurrency:currency withBroker:broker] plus:result];
        
    }
    
    return result;
    
}


#pragma mark - Notifications
-(void) subscribeToMemoryWarning:(NSNotificationCenter *) nc{
    
    [nc addObserver:self
           selector:@selector(dumpToDisk:)
               name:@"UIApplicationDidReceiveMemoryWarningNotification"
             object:nil];
    
}

-(void) dumpToDisk:(NSNotification *) notification{

    // guarda las cosas en disco
    
}

@end
