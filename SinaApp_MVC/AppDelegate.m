//
//  AppDelegate.m
//  SinaApp_MVC
//
//  Created by SuperWang on 16/5/18.
//  Copyright © 2016年 SuperWang. All rights reserved.
//

#import "AppDelegate.h"

#import "SinaViewController.h"
#import "MessageViewController.h"
#import "SearchViewController.h"
#import "SettingViewController.h"
#import "CenterViewController.h"
#import "AppDelegate.h"
#import "SendSinaViewController.h"
@interface AppDelegate ()
{
    UIView *emptyView;
    //CenterViewController *Ctr;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    
    UITabBarController *rootTabBarController=[[UITabBarController alloc]init];
    
    UIImage *imageH=[UIImage imageNamed:@"tabbar_compose_button@2x"];
    UIImage *image=[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted@2x"];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, 0, imageH.size.width, imageH.size.height);
    [button setImage:image forState:UIControlStateNormal];
    [button setBackgroundImage:imageH forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    button.center=rootTabBarController.tabBar.center;
    [rootTabBarController.view addSubview:button];
    
    
    
    SinaViewController *sinaViewController=[[SinaViewController alloc]init];
    sinaViewController.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"首页" image:[UIImage imageNamed:@"tabbar_home@2x"] selectedImage:[[UIImage imageNamed:@"tabbar_home_selected@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    UINavigationController *sinaNav=[[UINavigationController alloc]initWithRootViewController:sinaViewController];
    
    MessageViewController *messageViewController=[[MessageViewController alloc]init];
    messageViewController.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"信息" image:[UIImage imageNamed:@"tabbar_message_center@2x"] selectedImage:[[UIImage imageNamed:@"tabbar_message_center_selected@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    UINavigationController *messageNav=[[UINavigationController alloc]initWithRootViewController:messageViewController];
    
    SearchViewController *searchViewController=[[SearchViewController alloc]init];
    searchViewController.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"发现" image:[UIImage imageNamed:@"tabbar_discover@2x"] selectedImage:[[UIImage imageNamed:@"tabbar_discover_selected@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]] ;
    UINavigationController *searchNav=[[UINavigationController alloc]initWithRootViewController:searchViewController];

    
    SettingViewController *setingViewController=[[SettingViewController alloc]init];
    setingViewController.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"设置" image:[UIImage imageNamed:@"tabbar_profile@2x"] selectedImage:[[UIImage imageNamed:@"tabbar_profile_highlighted@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    UINavigationController *setingNav=[[UINavigationController alloc]initWithRootViewController:setingViewController];
    
    
    CenterViewController *Ctr=[[CenterViewController alloc]init];
    Ctr.tabBarItem=[[UITabBarItem alloc]initWithTitle:nil image:nil selectedImage:nil];
    UINavigationController *centerNav=[[UINavigationController alloc]initWithRootViewController:Ctr];
   
    rootTabBarController.viewControllers=@[sinaNav,messageNav,centerNav,searchNav,setingNav];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    UITabBarItem *tabBar = [UITabBarItem appearance];
    
    
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    self.window.rootViewController = rootTabBarController;
    [self.window makeKeyAndVisible];
    
    return YES;
    
}
-(void)buttonClick
{
    SendSinaViewController *vc=[[SendSinaViewController alloc]init];
    if([UIDevice currentDevice].systemVersion.intValue>=8){
        vc.modalPresentationStyle=UIModalPresentationOverCurrentContext;
    }else{
        vc.modalPresentationStyle=UIModalPresentationCurrentContext;
    }

    [self.window.rootViewController presentViewController:vc animated:NO completion:nil];


}

@end
