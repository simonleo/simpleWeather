//
//  SWSwizzleUtils.h
//  SimpleWeather
//
//  Created by liushu on 15/8/27.
//  Copyright (c) 2015年 liushu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWSwizzleUtils : NSObject
+ (void)swizzleClass:(Class)class method:(NSString *)methodName;
@end
