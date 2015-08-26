//
//  SWClient.h
//  SimpleWeather
//
//  Created by liushu on 15/8/26.
//  Copyright (c) 2015年 liushu. All rights reserved.
//

//#import <Foundation/Foundation.h>
@import CoreLocation;
#import <ReactiveCocoa.h>

@import Foundation;

@interface SWClient : NSObject
- (RACSignal *)fetchJSONFromURL:(NSURL *)url;
- (RACSignal *)fetchCurrentConditionsForLocation:(CLLocationCoordinate2D)coordinate;
- (RACSignal *)fetchHourlyForecastForLocation:(CLLocationCoordinate2D)coordinate;
- (RACSignal *)fetchDailyForecastForLocation:(CLLocationCoordinate2D)coordinate;
@end
