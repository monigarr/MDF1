//
//  AppDelegate.m
//  mdf1_project3
//
//  Created by Monica Peters on 11/4/12.
//  Copyright (c) 2012 Monica Peters. All rights reserved.
//

#import "AppDelegate.h"
#import "ListViewController.h"
#import "MapViewController.h"

@implementation AppDelegate
@synthesize factorywest,gewest,reynolds,genorthwest,geturtlebay,gerooseveltown,oldpaintfactory,domtar,ammoniatanks,domtarnewmound,listBizView,mapBizView,myArray;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    UIViewController *viewController1 = [[ListViewController alloc] initWithNibName:@"ListViewController" bundle:nil];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController1];
    UIViewController *viewController2 = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navController, viewController2, nil];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

//make biz names array available to all
-(void)getArray
{
    myArray = [[NSMutableArray alloc]initWithCapacity:myArray.count];
}

@end
