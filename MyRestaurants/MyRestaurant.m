//
//  MyRestaurant.m
//  MyRestaurants
//
//  Created by Arielle Jungwirth on 3/2/14.
//  Copyright (c) 2014 Paul A. Jungwirth. All rights reserved.
//

#import "MyRestaurant.h"

@implementation MyRestaurant

@synthesize name, rating;

- (id) initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        name = [dict valueForKey:@"name"];
        rating = [[dict objectForKey:@"rating"] intValue];
        return self;
    }
    return nil;
}

+ (NSArray *)parseJSON:(NSData *)d {
    NSMutableArray *restaurants = [NSMutableArray new];
    NSError *jsonError = nil;
    NSArray *restFile = [NSJSONSerialization JSONObjectWithData:d options:0 error:&jsonError];
    for (NSDictionary *dict in restFile) {
        MyRestaurant *r = [[MyRestaurant alloc] initWithDictionary:dict];
        [restaurants addObject:r];
    }
    return restaurants;
}

@end
