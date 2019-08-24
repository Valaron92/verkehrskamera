//
//  Verkehrkamera
//
//  Copyright (c) 2014 Markus. All rights reserved.
//
#import "AppDelegate.h"
#import "StartView.h"
#import "MasterViewController.h"
#import "GAI.h"
#import "GAILogger.h"

/** Google Analytics configuration constants **/
static NSString *const kGaPropertyId = @"UA-72796039-1"; // Placeholder property ID.
static NSString *const kTrackingPreferenceKey = @"allowTracking";

@implementation AppDelegate
@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Google Analyt
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    [GAI sharedInstance].dispatchInterval = 20;
    [[GAI sharedInstance] trackerWithTrackingId:@"UA-72796039-1"];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] ;
    StartView *masterViewController = [[StartView alloc] initWithNibName:@"StartView" bundle:nil] ;
    self.navigationController = [[UINavigationController alloc]  initWithRootViewController:masterViewController];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    [[UIApplication sharedApplication]statusBarOrientation];
//    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    return YES;
}
-(BOOL)prefersStatusBarHidden{
    return NO;
}

@end
