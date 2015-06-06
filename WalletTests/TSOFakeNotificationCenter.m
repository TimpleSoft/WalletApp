//
//  TSOFakeNotificationCenter.m
//  Wallet
//
//  Created by Timple Soft on 5/6/15.
//  Copyright (c) 2015 TimpleSoft. All rights reserved.
//

#import "TSOFakeNotificationCenter.h"

@implementation TSOFakeNotificationCenter

- (instancetype)init
{
    self = [super init];
    if (self) {
        _observers = [NSMutableDictionary new];
    }
    return self;
}

-(void) addObserver:(id)observer
           selector:(SEL)aSelector
               name:(NSString *)aName
             object:(id)anObject{
    
    [self.observers setObject:observer forKey:aName];
    
}

@end
