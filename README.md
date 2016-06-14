UITimerLabel
============

A UILabel subclass to mimic the WKInterfaceTimer from Apple's WatchKit but for iOS.

Written in Swift 2.0

## Usage

`func setDate(date: NSDate)` - Sets the date to count down to, and when set, shows the current duration it will run. 

`func start()` - Starts the timer label to count down to the set date. Does nothing if the date is not set.

`func stop()` - Stops the timer label from running, freezing the label at the current time.
