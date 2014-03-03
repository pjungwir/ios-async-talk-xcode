//
//  MyRestaurant.h
//  MyRestaurants
//
//  Created by Arielle Jungwirth on 3/2/14.
//  Copyright (c) 2014 Paul A. Jungwirth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyRestaurant : NSObject {
    NSString *name;
    int rating;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic) int rating;

- (id)initWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)parseJSON:(NSData *)d;

@end
