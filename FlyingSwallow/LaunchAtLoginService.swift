//
//  LaunchAtLoginController.swift
//  FlyingSwallow
//
//  Created by 薛永胜 on 2017/5/25.
//  Copyright © 2017年 薛永胜. All rights reserved.
//

import Cocoa
import ServiceManagement

class LaunchAtLoginService: NSObject {
    
    private let launcherAppIdentifier = "cn.realsnow.mac.flyingswallowhelper"
    
    func setLaunchAtLogin(enable:Bool) {
        
        let helperPath = "\(Bundle.main.bundlePath)/Contents/Library/LoginItems/FlyingSwallowHelper.app"

        if !FileManager.default.fileExists(atPath: helperPath) {
            return
        }

        let helperUrl = URL(fileURLWithPath: helperPath)
        
        // Registering helper app
        LSRegisterURL(helperUrl as CFURL, true)
        
        // Setting login
        // com.xxx.xxx为Helper的BundleID,ture/false设置开启还是关闭
        if !SMLoginItemSetEnabled(launcherAppIdentifier as CFString, enable) {
//            let alert = NSAlert()
//            alert.messageText = "设置自启动失败"
//            alert.addButton(withTitle: "OK")
//            alert.alertStyle = .informational
//            alert.runModal()
            return
        }
    }
    
    func getStatus() -> Bool {
        var startedAtLogin = false
        for app in NSWorkspace.shared().runningApplications {
            if app.bundleIdentifier == launcherAppIdentifier {
                startedAtLogin = true
                break
            }
        }
        return startedAtLogin
    }
    
    private func appURL() -> URL {
        return URL(fileURLWithPath: Bundle.main.bundlePath)
    }
}
