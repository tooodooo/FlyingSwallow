//
//  HideDesktopService.swift
//  FlyingSwallow
//
//  Created by 薛永胜 on 2017/5/25.
//  Copyright © 2017年 薛永胜. All rights reserved.
//

import Cocoa

class HideDesktopService: NSObject {
    
    func hide() {
        let bool = !self.getStatus()
        if bool {
            NSAppleScript(source: "do shell script \"defaults write com.apple.finder CreateDesktop -bool FALSE;killall Finder\"")?.executeAndReturnError(nil)
        } else {
            NSAppleScript(source: "do shell script \"defaults delete com.apple.finder CreateDesktop;killall Finder\"")?.executeAndReturnError(nil)
        }
    }
    
    func getStatus() -> Bool {
        let result = NSAppleScript(source: "do shell script \"defaults read com.apple.finder CreateDesktop\"")?.executeAndReturnError(nil)
        guard let isHidden = result?.booleanValue else {
            return false
        }
        return !isHidden
    }
}
