//
//  MyParseRestaurantsOperation.h
//  MyRestaurants
//
//  Created by Arielle Jungwirth on 3/3/14.
//  Copyright (c) 2014 Paul A. Jungwirth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyParseRestaurantsOperation : NSOperation

@property (strong, nonatomic) NSArray *restaurants;

- (id)initWithData:(NSData *)d;

@end
