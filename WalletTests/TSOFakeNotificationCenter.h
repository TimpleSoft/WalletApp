//
//  TSOFakeNotificationCenter.h
//  Wallet
//
//  Created by Timple Soft on 5/6/15.
//  Copyright (c) 2015 TimpleSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSOFakeNotificationCenter : NSObject

@property (strong, nonatomic) NSMutableDictionary *observers;

-(void) addObserver:(id)observer
           selector:(SEL)aSelector
               name:(NSString *)aName
             object:(id)anObject;

@end
