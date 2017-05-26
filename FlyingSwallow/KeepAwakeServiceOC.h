//
//  KeepAwakeService.h
//  FlyingSwallow
//
//  Created by 薛永胜 on 2017/5/25.
//  Copyright © 2017年 薛永胜. All rights reserved.
//

#ifndef KeepAwakeService_h
#define KeepAwakeService_h

#import <Foundation/Foundation.h>
@import AppKit;

@interface KeepAwakeServiceOC : NSObject

- (Boolean)preventSleep;
- (Boolean)restoreSleep;

@end


#endif /* KeepAwakeService_h */
