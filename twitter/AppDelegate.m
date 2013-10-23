//
//  AppDelegate.m
//  twitter
//
//  Created by Timothy Lee on 8/4/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "AppDelegate.h"
#import "TwitterClient.h"
#import "TimelineVC.h"
#import "SignedOutVC.h"

@interface AppDelegate ()

- (void)updateRootVC;

@property (nonatomic, strong) SignedOutVC *signedOutVC;
@property (nonatomic, strong) UINavigationController *timelineNVC;
@property (nonatomic, strong) UIViewController *currentVC;

@end



@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    self.window.rootViewController = self.currentVC;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateRootVC) name:UserDidLoginNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateRootVC) name:UserDidLogoutNotification object:nil];
    
/*
    self.window.rootViewController = [[TimelineVC alloc] init];
    
    if ([TwitterClient instance].accessToken == nil) {
        NSLog(@"Yo");
        [[TwitterClient instance] authorizeWithCallbackUrl:[NSURL URLWithString:@"cp-twitter://success"] success:^(AFOAuth1Token *accessToken, id responseObject) {
            NSLog(@"success: %@", accessToken.secret);
            NSLog(@"response: %@", responseObject);
            [[TwitterClient instance] getPath:@"1.1/statuses/home_timeline.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSLog(@"Success: %@", responseObject);
    //            NSArray *responseArray = (NSArray *)responseObject;
    //            [responseArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    //                NSLog(@"Success: %@", obj);
    //            }];
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"Error: %@", error);
            }];
        } failure:^(NSError *error) {
            NSLog(@"failure!");
        }];
    } else {
        [[TwitterClient instance] getPath:@"1.1/statuses/home_timeline.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"Success: %@", responseObject);
            //            NSArray *responseArray = (NSArray *)responseObject;
            //            [responseArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            //                NSLog(@"Success: %@", obj);
            //            }];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];        
    }
 */
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    NSNotification *notification = [NSNotification notificationWithName:kAFApplicationLaunchedWithURLNotification object:nil userInfo:[NSDictionary dictionaryWithObject:url forKey:kAFApplicationLaunchOptionsURLKey]];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Private methods

- (UIViewController *)currentVC {
    if ([User currentUser]) {
        return self.timelineNVC;
    } else {
        return self.signedOutVC;
    }
}

- (UINavigationController *)timelineNVC {
    if (!_timelineNVC) {
        TimelineVC *timelineVC = [[TimelineVC alloc] init];
        _timelineNVC = [[UINavigationController alloc] initWithRootViewController:timelineVC];
    }
    
    return _timelineNVC;
}

- (SignedOutVC *)signedOutVC {
    if (!_signedOutVC) {
        _signedOutVC = [[SignedOutVC alloc] init];
    }
    
    return _signedOutVC;
}

- (void)updateRootVC {
    self.window.rootViewController = self.currentVC;
}

@end
