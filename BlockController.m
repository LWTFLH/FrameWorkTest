//
//  BlockController.m
//  LWFrameWorkTest
//
//  Created by 李伟 on 16/8/26.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import "BlockController.h"

@interface BlockController ()

@end

@implementation BlockController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.stringBloc(@"12345");
}

-(void)viewDidDisappear:(BOOL)animated{

    [super viewDidDisappear:animated];
    
        NSString *result = self.stringBloc(@"wwwwww");
    NSLog(@"<block 回传>%@",result);
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
