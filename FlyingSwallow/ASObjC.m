//
//  ASObjC.m
//  FlyingSwallow
//
//  Created by 薛永胜 on 2017/5/26.
//  Copyright © 2017年 薛永胜. All rights reserved.
//

#import "ASObjC.h"

@implementation ASObjC

+ (void)initialize
{
    if (self == [ASObjC class]) {
        [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];
    }
}

+ (ASObjC *)sharedASObjC
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ASObjC alloc] init];
    });
    
    return sharedInstance;
}

@end
