//
//  SWSwizzleUtils.m
//  SimpleWeather
//
//  Created by liushu on 15/8/27.
//  Copyright (c) 2015年 liushu. All rights reserved.
//

#import <objc/runtime.h>
#import "SWSwizzleUtils.h"

@implementation SWSwizzleUtils

+ (void)swizzleClass:(Class)class method:(NSString *)methodName {
    SEL originalSelector = NSSelectorFromString(methodName);
    SEL newSelector = NSSelectorFromString([NSString stringWithFormat:@"%@%@", @"override_", methodName]);
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method newMethod = class_getInstanceMethod(class, newSelector);
    
    method_exchangeImplementations(originalMethod, newMethod);
}

@end
