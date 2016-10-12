//
//  OpenSysConfig.m
//  LWFrameWorkTest
//
//  Created by 李伟 on 16/9/1.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import "OpenSysConfig.h"
#import <QHSpeechSynthesizerQueue/QHSpeechSynthesizerQueue.h>
@interface OpenSysConfig ()
@property(nonatomic,strong)QHSpeechSynthesizerQueue *queue;
@end

@implementation OpenSysConfig

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // [self lang];
    [self speech];
    
}
-(void)speech{

    [self.queue readLast:@"杭州同牛网络科技有限公司" withLanguage:@"zh-hans" andRate:0.2];
    [self.queue readNext:@"杭州市下城区同方财富大厦" withLanguage:@"zh-hans" andRate:.3 andClearQueue:(NO)];
    
}

-(void)lang{
    NSUserDefaults *defau =[ NSUserDefaults standardUserDefaults];
    
    
    NSArray *arr = [defau objectForKey:@"AppleLanguages"];
    NSLog(@"%@",arr);
    NSLog(@"<cur>%@",arr[0]);
    
   // [defau setObject:arr[0] forKey:@"userLanguages"];
//    UILabel *local = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 20)];
//    local.textColor = [UIColor cyanColor];
//    local.text = NSLocalizedString(@"des", nil);
//    [self.view addSubview:local];
    
    
}

- (IBAction)openWifi:(id)sender {
    // 关于本机   @"prefs:root=General&path=About"
    //    Accessibility — prefs:root=General&path=ACCESSIBILITY
    
    NSString *url = @"prefs:root=Privacy&path=Camera";
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:url]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString: url]];
    }

    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

   }
- (IBAction)openSystem:(id)sender {
    
    [self pushSys];

}
-(void)pushSys{

    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    }
    //
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
