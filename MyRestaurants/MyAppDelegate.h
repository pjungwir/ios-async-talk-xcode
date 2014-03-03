//
//  MyAppDelegate.h
//  MyRestaurants
//
//  Created by Arielle Jungwirth on 3/2/14.
//  Copyright (c) 2014 Paul A. Jungwirth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

#define kAPIURL @"http://ios-async-talk.illuminatedcomputing.com"
#define kAPIRestaurantsURL [kAPIURL stringByAppendingString:@"/restaurants.json"]

-(NSArray *)restaurants;

@end
