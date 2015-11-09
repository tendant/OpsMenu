//
//  AppDelegate.swift
//  OpsMenu
//
//  Created by MacMini on 11/8/15.
//  Copyright © 2015 VariableName. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    @IBOutlet weak var statusMenu: NSMenuItem!
    
    var statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)
    
    var timer: NSTimer?
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "update", userInfo: nil, repeats: true)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
        timer?.invalidate()
    }

    func update() {
        let now = NSDate()
        
        let formatter = NSDateFormatter();
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss";
        formatter.timeZone = NSTimeZone(abbreviation: "UTC");
        let utcStr = formatter.stringFromDate(now);
        statusItem.title = utcStr
    }
}

