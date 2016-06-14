//
//  UITimerView.swift
//
//  Created by Drew Dunne on 6/14/16.
//  Copyright © 2016 Drew Dunne. All rights reserved.
//

import UIKit

class UITimerLabel: UILabel {
    
    private var timer: NSTimer?
    private var runToDate: NSDate?
    private var timerRunning: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.common()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.common()
    }
    
    private func common() {
        NSLog("Initing")
        self.text = "00:00"
    }
    
    // Sets the date which the timer counts down to (or up to)
    func setDate(date: NSDate) {
        runToDate = date
        self.setTimeDisplay(self.runToDate!.timeIntervalSinceNow)
    }
    
    // Start counting down to the date
    func start() {
        // If the date is not set it won't start
        // Also if already running won't start another timer
        if runToDate != nil && !timerRunning {
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(UITimerLabel.updateTime), userInfo: nil, repeats: true)
            
            // Timer needs to run on main loop for obvious reasons
            NSRunLoop.currentRunLoop().addTimer(timer!, forMode: NSDefaultRunLoopMode)
            timerRunning = true
        } else {
            setTimeDisplay(0)
        }
    }
    
    // Stop the timer
    func stop() {
        timer!.invalidate()
        timerRunning = false
    }
    
    // Updates the time
    @objc private func updateTime() {
        self.setTimeDisplay(self.runToDate!.timeIntervalSinceNow)
    }
    
    // Formats the time interval for displaying
    private func setTimeDisplay(displayTime: NSTimeInterval) {
        if displayTime >= 0 {
            let (m,s) = secondsToMinutesSeconds(Int(displayTime))
            self.text = String(format: "%02d:%02d",m,s)
        } else {
            let (m,s) = secondsToMinutesSeconds(Int(abs(displayTime)))
            self.text = String(format: "+%02d:%02d",m,s)
        }
    }
    
    // Converts the seconds to minutes and seconds
    private func secondsToMinutesSeconds (seconds : Int) -> (Int, Int) {
        return ( (seconds % 3600) / 60, (seconds % 3600) % 60)
    }

}
