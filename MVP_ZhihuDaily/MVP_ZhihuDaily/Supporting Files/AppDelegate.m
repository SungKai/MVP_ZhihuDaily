//
//  AppDelegate.m
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/3/30.
//

#import "AppDelegate.h"
#import "MainVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    MainVC *mainVC = [[MainVC alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mainVC];
    nav.navigationBar.hidden = YES;
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}



@end
