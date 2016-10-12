//
//  main.m
//  LWFrameWorkTest
//
//  Created by 李伟 on 16/7/20.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

//#import <FBAllocationTracker/FBAllocationTracker.h>
#import <FBAllocationTracker/FBAllocationTrackerManager.h>


    //  开启
//    [[FBAllocationTrackerManager sharedManager]startTrackingAllocations];
//    [[FBAllocationTrackerManager sharedManager]enableGenerations];
    int main(int argc, char * argv[]) {
        @autoreleasepool {
            return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        }
    }