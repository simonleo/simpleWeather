//
//  CLLocationManager+Enhancements.h
//  SimpleWeather
//
//  Created by liushu on 15/8/27.
//  Copyright (c) 2015年 liushu. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface CLLocationManager (Enhancements)
- (void)simx_didUpdateLocation:(CLLocation *)location;
@end
