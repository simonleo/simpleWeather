//
//  SWManager.m
//  SimpleWeather
//
//  Created by liushu on 15/8/26.
//  Copyright (c) 2015年 liushu. All rights reserved.
//

#import "SWManager.h"
#import "SWClient.h"
#import <TSMessages/TSMessage.h>

@interface SWManager ()
@property (nonatomic, strong, readwrite) SWCondition *currentCondition;
@property (nonatomic, strong, readwrite) CLLocation *currentLocation;
@property (nonatomic, strong, readwrite) NSArray *hourlyForecast;
@property (nonatomic, strong, readwrite) NSArray *dailyForecast;

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, assign) BOOL isFirstUpdate;
@property (nonatomic, strong) SWClient *client;
@end

@implementation SWManager
+ (instancetype)sharedManager {
    static id _sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self alloc] init];
    });
    
    return _sharedManager;
}
@end
