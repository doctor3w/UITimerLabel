
UITimerLabel
============

A UILabel subclass to mimic the WKInterfaceTimer from Apple's WatchKit but for iOS.

Written in Swift 2.0 - Requires iOS 9.0 or higher. 

## Functions

`func setDate(date: NSDate)` - Sets the date to count down to, and when set, shows the current duration it will run. 

`func start()` - Starts the timer label to count down to the set date. Does nothing if the date is not set.

`func stop()` - Stops the timer label from running, freezing the label at the current time.

`func setFontSizeAndWeight(size: CGFloat, weight: CGFloat)` - Sets the font size and weight based on the `UIFont.monospacedDigitSystemFontOfSize(size, weight: weight)`



## Usage

There is a demo project, but here is an easy example on how to use it: 

```
var duration: Double = 3
var elapsedTime: NSTimeInterval = 0
var startTime: NSTimeInterval = -1
@IBAction func start() {
    startTime = NSDate.timeIntervalSinceReferenceDate()
    let delay = NSDate.timeIntervalSinceReferenceDate() - startTime
    timerView.setDate(NSDate(timeIntervalSinceNow: duration-elapsedTime-delay))
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
```