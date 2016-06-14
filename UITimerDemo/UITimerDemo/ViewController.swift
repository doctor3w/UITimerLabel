//
//  ViewController.swift
//  UITimerDemo
//
//  Created by Drew Dunne on 6/14/16.
//  Copyright © 2016 Drew Dunne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerView: UITimerLabel!
    var duration: Double = 300
    var elapsedTime: NSTimeInterval = 0
    var startTime: NSTimeInterval = -1

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func start() {
        startTime = NSDate.timeIntervalSinceReferenceDate()
        timerView.setDate(NSDate(timeIntervalSinceNow: duration-elapsedTime))
        timerView.start()
    }
    
    @IBAction func stop() {
        timerView.stop()
        elapsedTime += NSDate.timeIntervalSinceReferenceDate() - startTime
        timerView.setDate(NSDate(timeIntervalSinceNow: duration-elapsedTime))
    }
    
    @IBAction func restart() {
        elapsedTime = 0;
        timerView.setDate(NSDate(timeIntervalSinceNow: duration-elapsedTime))
        timerView.start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

