//
//  AppDelegate.h
//  mdf1_project3
//
//  Created by Monica Peters on 11/4/12.
//  Copyright (c) 2012 Monica Peters. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyAnnotation.h"
#import "MapViewController.h"
#import "ListViewController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>
{
    ListViewController *listBizView;
    MapViewController *mapBizView;
    MyAnnotation *factorywest,*gewest,*reynolds,*genorthwest,*geturtlebay,*gerooseveltown,*oldpaintfactory,*domtar,*ammoniatanks,*domtarnewmound;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (nonatomic, retain) NSMutableArray *myArray;
@property (nonatomic,retain) ListViewController *listBizView;
@property (nonatomic,retain) MapViewController *mapBizView;
@property (nonatomic,retain) MyAnnotation *factorywest,*gewest,*reynolds,*genorthwest,*geturtlebay,*gerooseveltown,*oldpaintfactory,*domtar,*ammoniatanks,*domtarnewmound;

-(void)getArray;


@end
