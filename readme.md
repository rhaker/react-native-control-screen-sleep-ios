# react-native-control-screen-sleep-ios

This is a wrapper for react-native that controls whether a screen can sleep. The options are sleep on, sleep off, or toggle. This is for an ios device.

# Add it to your project

npm install react-native-control-screen-sleep-ios --save

In XCode, in the project navigator, right click Libraries ➜ Add Files to [your project's name]

Go to node_modules ➜ react-native-control-screen-sleep-ios and add RNControlScreenSleep.xcodeproj

In XCode, in the project navigator, select your project. Add libRNControlScreenSleep.a to your project's Build Phases ➜ Link Binary With Libraries

Click RNControlScreenSleep.xcodeproj in the project navigator and go the Build Settings tab. Make sure 'All' is toggled on (instead of 'Basic'). Look for Header Search Paths and make sure it contains both $(SRCROOT)/../react-native/React and $(SRCROOT)/../../React - mark both as recursive.

Run your project (Cmd+R)

Setup trouble?

If you get stuck, take a look at Brent Vatne's blog. His blog is my go to reference for this stuff.

# Api Setup

var React = require('react-native');

var { NativeModules } = React;

var { RNControlScreenSleep } = NativeModules;

RNControlScreenSleep.turnSleep(

    "sleepOn", // sleepOn, sleepOff, sleepToggle

    function errorCallback(results) {

        console.log('JS Error: ' + results['errMsg']);

    },

    function successCallback(results) {

        console.log('JS Success: ' + results['successMsg']);

    }
);

# Error Callback

The following will cause an error callback (use the console.log to see the specific message):

1) Parameter not "sleepOn", "sleepOff", or "sleepToggle"

2) Mode requested is already active. For example, calling sleepOff when the app is already in keep awake mode.

# Additional notes

The toggle feature ("sleepToggle") changes the mode from on-to-off or off-to-on.

# Acknowledgements

Special thanks to Brent Vatne for his posts on creating a react native packager. Some portions of this code have been based on answers from stackoverflow. This package also owes a special thanks to the tutorial by Jay Garcia at Modus Create on how to create a custom react native module.
