//
//  ViewController.swift
//  FlyingSwallow
//
//  Created by 薛永胜 on 2017/5/25.
//  Copyright © 2017年 薛永胜. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject {

    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var launchMenuItem: NSMenuItem!
    @IBOutlet weak var keepAwakeItem: NSMenuItem!
    @IBOutlet weak var hideDesktopItem: NSMenuItem!
    @IBOutlet weak var showAllFileItem: NSMenuItem!
    @IBOutlet weak var muteMicItem: NSMenuItem!
    
    
    fileprivate var launchService:LaunchAtLoginService!
    fileprivate var lockScreenService:LockScreenService!
    fileprivate var keepAwakeService:KeepAwakeService!
    fileprivate var hideDesktopService:HideDesktopService!
    fileprivate var showAllFileService:ShowHiddenFileService!
    fileprivate var muteMicService:MuteMicService!
    
    private var item:NSStatusItem!
    var isKeepAwakeStatus:Bool = false
    
    override func awakeFromNib() {
        let app = NSApplication.shared().delegate as! AppDelegate
        app.menuController = self
        //实例化一次ASOBJC，以加载AppleScripts
        ASObjC.shared()
        self.initService()
        self.initMenu()
    }
    
    private func initService() {
        launchService = LaunchAtLoginService()
        lockScreenService = LockScreenService()
        keepAwakeService = KeepAwakeService()
        hideDesktopService = HideDesktopService()
        showAllFileService = ShowHiddenFileService()
        muteMicService = MuteMicService()
    }
    
    private func initMenu() {
        self.item = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
        let icon = NSImage(named: "menu_icon")
        icon?.isTemplate = true
        self.item.image = icon
        self.item.highlightMode = true
        self.item.menu = statusMenu;
    }
    
    
    @IBAction func lockScreen(_ sender: Any) {
        lockScreenService.lock()
    }
    
    @IBAction func keepAwake(_ sender: Any) {
        self.isKeepAwakeStatus = keepAwakeService.keepAwake(enabel: !self.isKeepAwakeStatus)
    }
    
    func removeKeepAwake() {
        self.isKeepAwakeStatus = keepAwakeService.keepAwake(enabel: false)
    }
    
    @IBAction func launchAtLogin(_ sender: Any) {
        launchService.setLaunchAtLogin(enable: !launchService.getStatus())
    }
    
    @IBAction func hideDesktop(_ sender: Any) {
        hideDesktopService.hide()
    }
    
    @IBAction func showHiddenFile(_ sender: Any) {
        showAllFileService.show()
    }
    
    @IBAction func muteMic(_ sender: Any) {
        if muteMicService.getStatus() {
            muteMicService.unmute()
        } else {
            muteMicService.mute()
        }
    }
    
    @IBAction func showRecAudioWindow(_ sender: Any) {
        
    }
    
    @IBAction func quitApp(_ sender: Any) {
        NSApplication.shared().terminate(self)
    }
}


extension StatusMenuController : NSMenuDelegate {
    func menuWillOpen(_ menu: NSMenu) {
        launchMenuItem.state = launchService.getStatus() ? 1 : 0
        keepAwakeItem.state = self.isKeepAwakeStatus ? 1 : 0
        hideDesktopItem.state = hideDesktopService.getStatus() ? 1 : 0
        showAllFileItem.state = showAllFileService.getStatus() ? 1 : 0
        muteMicItem.state = muteMicService.getStatus() ? 1 : 0
    }
}
