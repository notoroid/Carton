//
//  CartonAppDelegate.m
//  Carton
//
//  Created by Kaname Noto on 11/05/23.
//  Copyright 2011 Irimasu Densan Planning. All rights reserved.
//

#import "CartonAppDelegate.h"
#import "CartonViewController.h"

@implementation CartonAppDelegate


@synthesize window=_window;

@synthesize viewController=_viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
     
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{

}

- (void)applicationWillTerminate:(UIApplication *)application
{

}

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

@end
