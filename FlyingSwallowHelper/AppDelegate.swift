//
//  AppDelegate.swift
//  FlyingSwallowHelper
//
//  Created by 薛永胜 on 2017/5/25.
//  Copyright © 2017年 薛永胜. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        var appPath = "\(Bundle.main.bundlePath)"
        appPath = appPath.replacingOccurrences(of: "Contents/Library/LoginItems/FlyingSwallowHelper.app", with: "Contents/MacOS/FlyingSwallow")

        if !FileManager.default.fileExists(atPath: appPath) {
            return
        }
        let running = NSRunningApplication.runningApplications(withBundleIdentifier: "cn.realsnow.mac.swallow")
        if running.count > 0 {
            return
        }
        NSWorkspace.shared().launchApplication(appPath)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

