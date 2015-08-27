//
//  CLLocationManager+Enhancements.m
//  SimpleWeather
//
//  Created by liushu on 15/8/27.
//  Copyright (c) 2015年 liushu. All rights reserved.
//

#import "CLLocationManager+Enhancements.h"
#import "SWSwizzleUtils.h"

@implementation CLLocationManager (Enhancements)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        [SWSwizzleUtils swizzleClass:[self class] method:@"setDelegate:"];
        [SWSwizzleUtils swizzleClass:[self class] method:@"onClientEventLocation:"];
        
//        Class class = [self class];
//        
//        SEL originalSelector = @selector(setDelegate:);
//        SEL swizzledSelector = @selector(override_setDelegate:);
//        
//        Method originalMethod = class_getInstanceMethod(class, originalSelector);
//        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
//        
//        BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
//        if (success) {
//            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
//        } else {
//            method_exchangeImplementations(originalMethod, swizzledMethod);
//        }
    });

}

- (void)override_onClientEventLocation:(id)foo {
    
}

- (void)override_setDelegate:(id<CLLocationManagerDelegate>)delegate {
    [self override_setDelegate:delegate];
}

- (void)simx_didUpdateLocation:(CLLocation *)location {
    id delegate = self.delegate;
    
    if ([delegate respondsToSelector:@selector(locationManager:didUpdateLocations:)]) {
        [delegate locationManager:self didUpdateLocations:@[location]];
    }
    
    if ([delegate respondsToSelector:@selector(locationManager:didUpdateToLocation:fromLocation:)]) {
        [delegate locationManager:self didUpdateToLocation:location fromLocation:nil];
    }
}

@end
