//
//  MeController.m
//  LWFrameWorkTest
//
//  Created by 李伟 on 16/7/21.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import "MeController.h"
#import "UITabBarItem+Badge.h"
@interface MeController ()

@end

@implementation MeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    __block NSInteger count = 100;
    [self.tabBarItem rt_setBadgeValue:[@(count) stringValue]
                           withHandle:^(RTDraggableBadge *badge, RTDragState state) {
                               if (state == RTDragStateDragged) {
                                   badge.text = [@(--count) stringValue];
                               }
                           }];
}

    


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
