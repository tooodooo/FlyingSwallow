//
//  AppDelegate.swift
//  Swallow
//
//  Created by 薛永胜 on 2017/5/24.
//  Copyright © 2017年 薛永胜. All rights reserved.
//

import Cocoa
import AppleScriptObjC

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var menuController:StatusMenuController!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        //关闭禁止睡眠
        if menuController.isKeepAwakeStatus {
            menuController.removeKeepAwake()
        }
        
    }
}

