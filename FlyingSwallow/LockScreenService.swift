//
//  LockScreenService.swift
//  FlyingSwallow
//
//  Created by 薛永胜 on 2017/5/25.
//  Copyright © 2017年 薛永胜. All rights reserved.
//

import Cocoa

class LockScreenService: NSObject {
    func lock() {
        let libHandle = dlopen("/System/Library/PrivateFrameworks/login.framework/Versions/Current/login", RTLD_LAZY)
        let sym = dlsym(libHandle, "SACLockScreenImmediate")
        typealias myFunction = @convention(c) (Void) -> Void
        let SACLockScreenImmediate = unsafeBitCast(sym, to: myFunction.self)
        SACLockScreenImmediate()
    }
}
