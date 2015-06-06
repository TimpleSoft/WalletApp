//
//  AppDelegate.m
//  Wallet
//
//  Created by Timple Soft on 1/6/15.
//  Copyright (c) 2015 TimpleSoft. All rights reserved.
//

#import "AppDelegate.h"
#import "TSOWalletTableViewController.h"
#import "TSOWallet.h"
#import "TSOMoney.h"
#import "TSOBroker.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    // Creamos la cartera
    TSOWallet *wallet = [[TSOWallet alloc] initWithAmount:5 currency:@"EUR"];
    [wallet plus:[TSOMoney dollarWithAmount:10]];
    [wallet plus:[TSOMoney euroWithAmount:10]];
    
    [wallet plus:[[TSOMoney alloc] initWithAmount:20 currency:@"GBP"]];
    [wallet plus:[[TSOMoney alloc] initWithAmount:10 currency:@"GBP"]];
    [wallet plus:[[TSOMoney alloc] initWithAmount:10 currency:@"GBP"]];
    
    // Creamos el broker
    TSOBroker *broker = [TSOBroker new];
    [broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    [broker addRate:5 fromCurrency:@"EUR" toCurrency:@"GBP"];
    
    
    
    TSOWalletTableViewController *walletVC = [[TSOWalletTableViewController alloc] initWithModel:wallet broker:broker];
    
    self.window.rootViewController = walletVC;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
