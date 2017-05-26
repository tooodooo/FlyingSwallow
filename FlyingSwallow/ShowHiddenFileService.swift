//
//  ShowHiddenFileService.swift
//  FlyingSwallow
//
//  Created by 薛永胜 on 2017/5/25.
//  Copyright © 2017年 薛永胜. All rights reserved.
//

import Cocoa

class ShowHiddenFileService: NSObject {
    func show() {
        let bool = !self.getStatus()
        NSAppleScript(source: "do shell script \"defaults write com.apple.finder AppleShowAllFiles \(bool);killall Finder\"")?.executeAndReturnError(nil)
    }
    
    func getStatus() -> Bool {
        let result = NSAppleScript(source: "do shell script \"defaults read com.apple.finder AppleShowAllFiles\"")?.executeAndReturnError(nil)
        guard let isShowing = result?.booleanValue else {
            return false
        }
        return isShowing
    }
}
