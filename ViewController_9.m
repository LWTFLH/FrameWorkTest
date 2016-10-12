//
//  ViewController_9.m
//  LWFrameWorkTest
//
//  Created by 李伟 on 16/8/11.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import "ViewController_9.h"
#import <Masonry/Masonry.h>
@interface ViewController_9 ()

@end

@implementation ViewController_9

{

    UIView *tempView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //[self newFeature_9];
    
}
#pragma ios 9
-(void)newFeature_9{
    
    
    UIStackView *stack = [[UIStackView alloc]init];
    [self.view addSubview:stack];

    
    [stack mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.size.mas_equalTo(CGSizeMake(self.view.frame.size.width, 300));
        make.top.equalTo(@90);
        make.leading.equalTo(@30);
    }];
    
    
    UIView *v1 =[[ UIView alloc]init];
    tempView = v1;
    v1.backgroundColor = [UIColor redColor];
    
    UIView *v2 =[[ UIView alloc]init];
    v2.backgroundColor = [UIColor yellowColor];

    [stack insertArrangedSubview:v1 atIndex:0];
    [stack insertArrangedSubview:v2 atIndex:1];
    
    stack.axis = UILayoutConstraintAxisVertical;
    stack.alignment = UIStackViewAlignmentCenter;
    stack.spacing = 10;
    stack.distribution = UIStackViewDistributionEqualSpacing;
    
    
    [v1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    [v2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 90));
    }];
    
    
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    imageV.image = [UIImage imageNamed:@"11.jpg"];
    
    [stack insertArrangedSubview:imageV atIndex:2];
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    
    tempView.hidden =YES;
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
