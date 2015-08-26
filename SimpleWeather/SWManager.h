//
//  SWManager.h
//  SimpleWeather
//
//  Created by liushu on 15/8/26.
//  Copyright (c) 2015年 liushu. All rights reserved.
//

@import Foundation;
@import CoreLocation;
#import <ReactiveCocoa.h>

#import "SWCondition.h"

@interface SWManager : NSObject<CLLocationManagerDelegate>
+ (instancetype)sharedManager;
@property (nonatomic, strong, readonly) CLLocation *currentLocation;
@property (nonatomic, strong, readonly) SWCondition *currentCondition;
@property (nonatomic, strong, readonly) NSArray *hourlyForecast;
@property (nonatomic, strong, readonly) NSArray *dailyForecast;

- (void)findCurrentLocation;

@end
