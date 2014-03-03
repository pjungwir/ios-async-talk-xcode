//
//  MyParseRestaurantsOperation.m
//  MyRestaurants
//
//  Created by Arielle Jungwirth on 3/3/14.
//  Copyright (c) 2014 Paul A. Jungwirth. All rights reserved.
//

#import "MyParseRestaurantsOperation.h"
#import "MyRestaurant.h"

@implementation MyParseRestaurantsOperation {
    NSData *_data;
}

- (id)initWithData:(NSData *)d {
    if (self = [super init]) {
        self->_data = d;
        return self;
    }
    return nil;
}

- (void)main {
    self.restaurants = [MyRestaurant parseJSON:self->_data];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ParseRestaurantsOperationFinished" object:self];
}

@end
