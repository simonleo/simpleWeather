//
//  SWManager.m
//  SimpleWeather
//
//  Created by liushu on 15/8/26.
//  Copyright (c) 2015年 liushu. All rights reserved.
//

#import "SWManager.h"
#import "SWClient.h"
#import "CLLocationManager+Enhancements.h"
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

- (id)init {
    if (self = [super init]) {
    //Method Swizzling -- override_setDelegate
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;

        
        _client = [[SWClient alloc] init];
        
        [[[[RACObserve(self, currentLocation) ignore:nil]
           flattenMap:^(CLLocation *newLocation) {
               return [RACSignal merge:@[
                                      [self updateCurrentConditions],
                                      [self updateDailyForecast],
                                      [self updateHourlyForecast]
                                      ]];
        }] deliverOn:RACScheduler.mainThreadScheduler]
         subscribeError:^(NSError *error) {
            [TSMessage showNotificationWithTitle:@"Error"
                                        subtitle:@"There was a problem fetching the latest weather."
                                            type:TSMessageNotificationTypeError];
        }];
    }
    return self;
}

- (void)findCurrentLocation {
    self.isFirstUpdate = YES;
    [self.locationManager startUpdatingLocation];
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:37.785834 longitude:-122.406417];
    [self.locationManager simx_didUpdateLocation:location];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *location = [locations lastObject];
    
    self.currentLocation = location;
    [self.locationManager stopUpdatingLocation];
}

- (RACSignal *)updateCurrentConditions {
    return [[self.client fetchCurrentConditionsForLocation:self.currentLocation.coordinate]
            doNext:^(SWCondition *condition) {
        self.currentCondition = condition;
    }];
}

- (RACSignal *)updateHourlyForecast {
    return [[self.client fetchHourlyForecastForLocation:self.currentLocation.coordinate]
            doNext:^(NSArray *conditions) {
                self.hourlyForecast = conditions;
            }];
}

- (RACSignal *)updateDailyForecast {
    return [[self.client fetchDailyForecastForLocation:self.currentLocation.coordinate]
            doNext:^(NSArray *conditions) {
                self.dailyForecast = conditions;
            }];
}
@end
