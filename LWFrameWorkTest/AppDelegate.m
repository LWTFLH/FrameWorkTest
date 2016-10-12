//
//  AppDelegate.m
//  LWFrameWorkTest
//
//  Created by 李伟 on 16/7/20.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "MeController.h"
#import "SSToolkit.h"
#import "SSToolKitTest.h"
#import <FBMemoryProfiler/FBMemoryProfiler.h>
#import "ChartController.h"
#import "StretchController.h"
#import "ViewController_9.h"
#import "IOS_ViewController.h"
#import "Mask_ViewController.h"
#import "AddressBook.h"
#import "SortAddress.h"
#import "DataConsistencephalitis.h"
#import "DBController.h"
#import "OpenSysConfig.h"
//#import <MagicalRecord/CoreData+MagicalRecord.h>
@interface AppDelegate ()

@end

@implementation AppDelegate
{

    FBMemoryProfiler *memory;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:[[StretchController alloc]init]];
 //  self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[OpenSysConfig alloc] initWithNibName:@"OpenSysConfig" bundle:nil]];
//    UITabBarController *tab = [[UITabBarController alloc]init];
//    ViewController *vc = [[ViewController alloc] init];
//    vc.tabBarItem.title = @"www";
//    vc.tabBarItem.image = [UIImage imageNamed:@"home_message.png"];
//    
//    MeController *me = [[MeController alloc]init];
//    me.tabBarItem.title = @"bbb";
//    me.tabBarItem.image = [UIImage imageNamed:@"home_red_envelope.png"];
//    
//    UIViewController *cc  =[[UIViewController alloc]init];
//    
//    UINavigationController *nav  = [[UINavigationController alloc] initWithRootViewController:vc];
//    tab.viewControllers  = @[nav,me,cc];
//    self.window.rootViewController= tab;
    [self.window makeKeyAndVisible];
    memory  =[FBMemoryProfiler new];
    [memory enable];
    
    
    
//    [MagicalRecordHelpers setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"lw.sqlite"];
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
