//
//  KeepAwakeService.m
//  FlyingSwallow
//
//  Created by 薛永胜 on 2017/5/25.
//  Copyright © 2017年 薛永胜. All rights reserved.
//

#import "KeepAwakeServiceOC.h"
#import <IOKit/pwr_mgt/IOPMLib.h>

@interface KeepAwakeServiceOC ()
@property (nonatomic) IOPMAssertionID assertionID;
@end

static NSString * const AssertionReason = @"UserActivited";

@implementation KeepAwakeServiceOC


- (Boolean)preventSleep
{
    CFStringRef type = kIOPMAssertPreventUserIdleDisplaySleep;
    IOPMAssertionLevel level = kIOPMAssertionLevelOn;
    CFStringRef reason = (__bridge CFStringRef)(AssertionReason);
    
    IOReturn status = IOPMAssertionCreateWithName(type, level,
                                                  reason, &_assertionID);
    BOOL success = (status == kIOReturnSuccess);
    if (!success) {
        NSLog(@"禁止睡眠失败: %d", status);
    }
    return success;
}

- (Boolean)restoreSleep
{
    IOReturn status = IOPMAssertionRelease(self.assertionID);
    BOOL success = (status == kIOReturnSuccess);
    if (!success) {
        NSLog(@"恢复睡眠失败: %d", status);
    }
    return success;
}

@end
