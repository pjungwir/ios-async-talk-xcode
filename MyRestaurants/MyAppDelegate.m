//
//  MyAppDelegate.m
//  MyRestaurants
//
//  Created by Arielle Jungwirth on 3/2/14.
//  Copyright (c) 2014 Paul A. Jungwirth. All rights reserved.
//

#import "MyAppDelegate.h"
#import "MyViewController.h"
#import "MyRestaurant.h"
#import "MyParseRestaurantsOperation.h"

@implementation MyAppDelegate {
    NSArray *_restaurants;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self fetchRestaurants];
    [NSTimer scheduledTimerWithTimeInterval:2
                                     target:self
                                   selector:@selector(fetchRestaurants)
                                   userInfo:nil
                                    repeats:YES];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    MyViewController *vc = [[MyViewController alloc] init];
    self.window.rootViewController = vc;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)fetchRestaurants {
    NSURL *url = [NSURL URLWithString:kAPIRestaurantsURL];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    NSOperationQueue *q = [NSOperationQueue mainQueue];
    [NSURLConnection sendAsynchronousRequest:req
                                       queue:q
                           completionHandler:
     ^(NSURLResponse *resp, NSData *d, NSError *err) {
         if (d) {
             MyParseRestaurantsOperation *op = [[MyParseRestaurantsOperation alloc] initWithData:d];
             [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(parsedRestaurants:) name:@"ParseRestaurantsOperationFinished" object:op];
             NSOperationQueue *background = [NSOperationQueue new];
             [background addOperation:op];
         }
     }];
}

- (void)parsedRestaurants:(NSNotification *)n {
    [self performSelectorOnMainThread:@selector(updateRestaurants:)
                           withObject:((MyParseRestaurantsOperation*)[n object]).restaurants
                        waitUntilDone:NO];
}

- (void)updateRestaurants:(NSObject *)restaurants {
    self->_restaurants = (NSArray *)restaurants;
    [((MyViewController *)self.window.rootViewController).tableView reloadData];
}

- (NSArray *)restaurants {
    return self->_restaurants;
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

@end
