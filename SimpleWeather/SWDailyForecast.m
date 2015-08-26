//
//  SWDailyForecast.m
//  SimpleWeather
//
//  Created by liushu on 15/8/26.
//  Copyright (c) 2015年 liushu. All rights reserved.
//

#import "SWDailyForecast.h"

@implementation SWDailyForecast

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    NSMutableDictionary *paths = [[super JSONKeyPathsByPropertyKey] mutableCopy];
    
    paths[@"tempHigh"] = @"temp.max";
    paths[@"tempLow"] = @"temp.min";
    
    return paths;
}

@end
