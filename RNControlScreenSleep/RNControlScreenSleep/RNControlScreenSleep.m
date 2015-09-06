//
//  RNControlScreenSleep.m
//  RNControlScreenSleep
//  Created by Ross Haker on 9/4/15.
//

#import "RNControlScreenSleep.h"

@implementation RNControlScreenSleep

// Expose this module to the React Native bridge
RCT_EXPORT_MODULE()

// Persist data
RCT_EXPORT_METHOD(turnSleep:(NSString *)sleepDesc
                  errorCallback:(RCTResponseSenderBlock)failureCallback
                  callback:(RCTResponseSenderBlock)successCallback) {
    
    if ([sleepDesc isEqual: @"sleepOff"]) {
        
        // Acquire a reference to the local UIApplication singleton
        UIApplication* app = [UIApplication sharedApplication];
        
        // If the timer is not disbled, prevent sleep
        if (![app isIdleTimerDisabled]) {
            
            [app setIdleTimerDisabled:true];
            
            // Show success message that screen has been put to sleep
            NSDictionary *resultsDict = @{
                                          @"success" : @YES,
                                          @"successMsg"  : @"App is now in keep awake mode"
                                          };
            
            // Call the JavaScript sucess handler
            successCallback(@[resultsDict]);
            return;
            
        } else {
            
            // Show failure message
            NSDictionary *resultsDict = @{
                                          @"success" : @NO,
                                          @"errMsg"  : @"App is already in keep awake mode."
                                          };
            
            // Execute the JavaScript failure callback handler
            failureCallback(@[resultsDict]);
            return;
            
        }
        
    } else if ([sleepDesc isEqual: @"sleepOn"]) {
        
        // Acquire a reference to the local UIApplication singleton
        UIApplication* app = [UIApplication sharedApplication];
        
        // If the timer is disbled, turn sleep mode back on
        if ([app isIdleTimerDisabled]) {
            
            [app setIdleTimerDisabled:false];
            
            // Show success message that screen is now in sleep mode
            NSDictionary *resultsDict = @{
                                          @"success" : @YES,
                                          @"successMsg"  : @"App will now be able to sleep."
                                          };
            
            // Call the JavaScript sucess handler
            successCallback(@[resultsDict]);
            return;
            
        } else {
            
            // Show failure message
            NSDictionary *resultsDict = @{
                                          @"success" : @NO,
                                          @"errMsg"  : @"App is already able to sleep."
                                          };
            
            // Execute the JavaScript failure callback handler
            failureCallback(@[resultsDict]);
            return;
            
        }
        
    } else if ([sleepDesc isEqual: @"sleepToggle"]) {
        
        // Acquire a reference to the local UIApplication singleton
        UIApplication* app = [UIApplication sharedApplication];
        
        // If the timer is disbled, turn sleep mode back on
        if ([app isIdleTimerDisabled]) {
            
            [app setIdleTimerDisabled:false];
            
            // Show success message that screen is now in sleep mode
            NSDictionary *resultsDict = @{
                                          @"success" : @YES,
                                          @"successMsg"  : @"App is now able to go to sleep."
                                          };
            
            // Call the JavaScript sucess handler
            successCallback(@[resultsDict]);
            return;
            
        } else {
            
            [app setIdleTimerDisabled:true];
            
            // Show success message that screen has been put to sleep
            NSDictionary *resultsDict = @{
                                          @"success" : @YES,
                                          @"successMsg"  : @"App is now in keep awake mode."
                                          };
            
            // Call the JavaScript sucess handler
            successCallback(@[resultsDict]);
            return;
        }
        
    } else {
        
        // Show failure message
        NSDictionary *resultsDict = @{
                                      @"success" : @NO,
                                      @"errMsg"  : @"Invalid sleep type. Set to either sleepOn, sleepOff, or sleepToggle."
                                      };
        
        // Execute the JavaScript failure callback handler
        failureCallback(@[resultsDict]);
        return;
        
    }
}

@end
