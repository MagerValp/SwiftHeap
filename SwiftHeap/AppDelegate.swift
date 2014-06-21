//
//  AppDelegate.swift
//  SwiftHeap
//
//  Created by Pelle on 2014-06-21.
//  Copyright (c) 2014 AutoMac. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
                            
    @IBOutlet var window: NSWindow


    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        var heap = SwiftArrayHeap()
        
        let batchSize = 128
        let batchCount = 1
        var buffer = Int[]()
        
        srandom(0xf00dface)
        for var i = 0; i < batchSize * batchCount; i++ {
            buffer.append(random())
        }
        
        let startTime = NSDate()
        
        for var offset: Int = 0; offset < batchSize * batchCount; offset += batchSize {
            for var i: Int = 0; i < batchSize; i++ {
                heap.push(buffer[offset + i])
            }
            while heap.size > 0 {
                heap.pop()
            }
        }
        
        let endTime = NSDate()
        let elapsed = endTime.timeIntervalSinceDate(startTime)
        NSLog("benchmark result: \(elapsed)")

    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }


}

