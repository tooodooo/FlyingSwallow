//
//  KeepAwakeService.swift
//  FlyingSwallow
//
//  Created by 薛永胜 on 2017/5/25.
//  Copyright © 2017年 薛永胜. All rights reserved.
//

import Cocoa

class KeepAwakeService: NSObject {
    
    let controller = KeepAwakeServiceOC()
    
    func keepAwake(enabel:Bool) -> Bool {
        if enabel {
            let result = controller.preventSleep()
            return result
        } else {
            let result = controller.restoreSleep()
            return !result
        }
    }
}
