//
//  TSOWallet.m
//  Wallet
//
//  Created by Timple Soft on 4/6/15.
//  Copyright (c) 2015 TimpleSoft. All rights reserved.
//

#import "TSOWallet.h"

@interface TSOWallet ()

@property (nonatomic, strong) NSMutableDictionary *dictMoneys;
@property (nonatomic) NSUInteger currencyIndex;

@end

@implementation TSOWallet

-(NSUInteger)count{
    
    NSUInteger count = 0;
    
    for (NSString *currency in self.dictMoneys) {
        count += [[self.dictMoneys objectForKey:currency] count];
    }
    return count;
}

-(id) initWithAmount:(NSUInteger)amount currency:(NSString *)currency{
 
    if (self = [super init]) {
        
        TSOMoney *money = [[TSOMoney alloc] initWithAmount:amount currency:currency];
        NSMutableArray *moneys = [NSMutableArray arrayWithObject:money];
        _dictMoneys = [NSMutableDictionary dictionaryWithObject:moneys forKey:currency];
        
    }
    
    return self;
}

-(id<TSOMoney>) plus:(TSOMoney *)other{
    
    // Comprobamos si tenemos algún money de esta divisa, si no añadimos un nuevo par clave-valor
    if ([self.dictMoneys objectForKey:other.currency]) {
        
        [[self.dictMoneys objectForKey:other.currency] addObject:other];
    
    }else{
        
        [self.dictMoneys setObject:[NSMutableArray arrayWithObject:other] forKey:other.currency];
        
    }
    
    return self;
    
}

-(id<TSOMoney>) times:(NSUInteger)multiplier{
    
    // Vamos sustituyendo los arrays de las divisas con nuevos arrays con el dinero multiplicado

    for (NSString *currency in self.dictMoneys) {
        
        NSMutableArray *newMoneys = [@[] mutableCopy];
        
        for (TSOMoney *each in [self.dictMoneys objectForKey:currency]) {
            
            TSOMoney *newMoney = [each times:multiplier];
            [newMoneys addObject:newMoney];
            
        }
        
        [self.dictMoneys setObject:newMoneys forKey:currency];
        
    }
    
    return self;
}


-(TSOMoney *) reduceToCurrency:(NSString *)currency withBroker:(TSOBroker *)broker{
    
    TSOMoney *result = [[TSOMoney alloc] initWithAmount:0 currency:currency];
    
    for (NSString *currencyKey in self.dictMoneys) {
        
        for (TSOMoney *money in [self.dictMoneys objectForKey:currencyKey]) {
            
            result = [[money reduceToCurrency:currency withBroker:broker] plus:result];
            
        }
    }
    
    return result;
    
}


// Devuelve el número de divisas distintas que contiene la cartera
-(NSUInteger) countOfDifferentCurrencies{
    
    return [self.dictMoneys count];
    
}

// Devuelve el número de moneys de una divisa concreta dependiendo de cómo estén ordenados
// Es un poco chapuza pero funciona
-(NSUInteger) countForSection:(NSUInteger) section{
    
    NSUInteger __block count = 0;
    NSUInteger __block result;
    [self.dictMoneys enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        if (count == section) {
            result = [obj count];
            *stop = YES;
        }
        count += 1;
        
    }];
    
    return result;
    
}

-(NSUInteger) amountForSection:(NSUInteger) section{
    
    NSUInteger __block count = 0;
    NSUInteger __block result = 0;
    [self.dictMoneys enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        if (count == section) {
            
            // recorremos el array de moneys y vamos sumando las cantidades
            for (TSOMoney *each in obj) {
                result += [each.amount integerValue];
            }
            
            *stop = YES;
            
        }
        count += 1;
        
    }];
    
    return result;
}


-(TSOMoney *) moneyAtIndexPath:(NSIndexPath *)indexPath{
    
    NSUInteger __block count = 0;
    TSOMoney __block *result;
    
    [self.dictMoneys enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        if (count == indexPath.section) {
            result = [obj objectAtIndex:indexPath.row];
            *stop = YES;
        }
        count += 1;
        
    }];
    
    return result;
    
}


#pragma mark - Notifications
-(void) subscribeToMemoryWarning:(NSNotificationCenter *) nc{
    
    [nc addObserver:self
           selector:@selector(dumpToDisk:)
               name:UIApplicationDidReceiveMemoryWarningNotification
             object:nil];
    
}

-(void) dumpToDisk:(NSNotification *) notification{

    // guarda las cosas en disco
    
}

@end
