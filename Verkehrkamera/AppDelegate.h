//
//  Verkehrkamera
//
//  Copyright (c) 2014 Markus. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) UIWindow *window;
@property(nonatomic, strong) id<GAITracker> tracker;

@end