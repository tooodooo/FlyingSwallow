//
//  MuteMic.swift
//  FlyingSwallow
//
//  Created by 薛永胜 on 2017/5/26.
//  Copyright © 2017年 薛永胜. All rights reserved.
//

import Cocoa
import AppleScriptObjC

class MuteMicService: NSObject {
    private let mixer = Mixer()
    
    func mute() {
        
        mixer.mute()
    }
    
    func unmute() {
        mixer.unmute()
    }
    
    func getStatus() -> Bool {
        return mixer.muted
    }
}
