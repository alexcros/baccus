//
//  AppDelegate.m
//  Baccus
//
//  Created by Alexandre Cros on 17/01/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import "AppDelegate.h"

        // import controls for delegate
#import "WineViewController.h"
#import "WineModel.h"
#import "WineryModel.h"
#import "WineryTableViewController.h"
#import "WebViewController.h"


//@interface AppDelegate ()

//@end

@implementation AppDelegate
- (UIViewController *)rootViewControllerForPhoneWithModel:(WineryModel *)aModel
{
    // Controladores
    WineryTableViewController *wineryVC = [[WineryTableViewController alloc] initWithModel:aModel
                                                                                           style:UITableViewStylePlain];
    // Combinador
    UINavigationController *wineryNav = [[UINavigationController alloc] initWithRootViewController:wineryVC];
    
    // Delegados
    wineryVC.delegate = wineryVC;
    
    return wineryNav;
}

- (UIViewController *)rootViewControllerForPadWithModel:(WineryModel *)aModel
{
    // Controladores
    WineryTableViewController *wineryVC = [[WineryTableViewController alloc] initWithModel:aModel
                                                                                           style:UITableViewStylePlain];
    WineViewController *wineVC = [[WineViewController alloc] initWithModel:[wineryVC lastSelectedWine]];
    // Combinadores
    UINavigationController *wineNav = [[UINavigationController alloc] initWithRootViewController:wineVC];
    UINavigationController *wineryNav = [[UINavigationController alloc] initWithRootViewController:wineryVC];
    
    UISplitViewController *splitVC = [[UISplitViewController alloc] init];
    splitVC.viewControllers = @[wineryNav, wineNav];
    
    
    // Delegados
    splitVC.delegate = wineVC;
    wineryVC.delegate = wineVC;
    
    return splitVC;
}

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
/*
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // creating Wine Models - the model
    WineryModel *winery = [[WineryModel alloc] init];
    
    // creating controllers
    WineryTableViewController *wineryVC = [[WineryTableViewController alloc] initWithModel:winery
                                                                                     style:UITableViewStylePlain];
    
    WineViewController *wineVC = [[WineViewController alloc]initWithModel:[wineryVC lastSelectedWine]];
    
    // Creating navigation controller
    UINavigationController *wineryNav = [[UINavigationController alloc] initWithRootViewController:wineryVC];
    UINavigationController *wineNav = [[UINavigationController alloc]initWithRootViewController:wineVC];
    
    // Create Combinator: splitView
    UISplitViewController *splitVC = [[UISplitViewController alloc]init];
    splitVC.viewControllers = @[wineryNav, wineNav];
    
    // Delegate assignement
    
    splitVC.delegate = wineVC;
    
    wineryVC.delegate = wineVC;
    
    // combinator root assignement 
    self.window.rootViewController = splitVC;
    
    //color and make visible
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
 */
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Creamos modelo
    WineryModel *model = [[WineryModel alloc] init];
    
    // Configuramos controladores, combinadores y delegados según
    // el tipo de dispositivo
    UIViewController *rootVC = nil;
    if (!IS_IPHONE) {
        // Tableta
        rootVC = [self rootViewControllerForPadWithModel:model];
    }
    else {
        rootVC = [self rootViewControllerForPhoneWithModel:model];
    }
    self.window.rootViewController = rootVC;
    
    
    self.window.backgroundColor = [UIColor whiteColor];
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
