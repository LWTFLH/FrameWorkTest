//
//  SSToolKitTest.m
//  LWFrameWorkTest
//
//  Created by 李伟 on 16/8/2.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import "SSToolKitTest.h"
#import <Masonry/Masonry.h>

#import "OpenUDID.h"

@interface SSToolKitTest ()
@property(nonatomic,strong)UIImageView *loginIMage;
@property(nonatomic,strong)UITextField *userName;
@property(nonatomic,strong)UITextField *userPass;
@end

@implementation SSToolKitTest

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *udid = [OpenUDID value];
    NSLog(@"<udid>%@",udid);
    //[self configUI];
    [self ios9_stackView];
   // [self addressBar];
}


-(void)ios9_stackView{
    
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor redColor];
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor orangeColor];
    UIStackView *subStackView = [[UIStackView alloc] initWithArrangedSubviews:@[view1,view2]];
    subStackView.axis = UILayoutConstraintAxisHorizontal;
    subStackView.alignment = UIStackViewAlignmentFill;
    subStackView.distribution = UIStackViewDistributionFillEqually;
    subStackView.spacing = 10;
    subStackView.translatesAutoresizingMaskIntoConstraints = YES;
    [self.view addSubview:subStackView];
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    //[btn setImage:[UIImage imageNamed:@"home_red_envelope.png"] forState:UIControlStateNormal];
//    [btn setTitle:@"1223" forState:UIControlStateNormal];
//    [btn setBackgroundColor:[UIColor redColor]];
//    
//    NSArray *btns = @[btn,btn,btn,btn];
//    UIStackView *stack = [[UIStackView alloc]init];
//    [stack insertArrangedSubview:btn atIndex:0];
//    stack.axis = UILayoutConstraintAxisVertical;
//    stack.distribution = UIStackViewDistributionFillEqually;
//    stack.alignment = UIStackViewAlignmentBottom;
//    stack.spacing = 10;
//    [self.view addSubview:stack];
}
#pragma SAMAddressBar
- (void)addressBar {

    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    title.textColor = [UIColor cyanColor];
    title.text = @"asadsadsa";

    SAMAddressBar *add = [[SAMAddressBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    //  add.titleLabel = title;
    // self.navigationController.navigationBar = add;
    [self.view addSubview:add];
}


-(void)configUI{

    self.loginIMage  =[[UIImageView alloc]init];
    self.loginIMage.image = [UIImage imageNamed:@"01.jpg"];
    [self.view addSubview:self.loginIMage];
    self.loginIMage.clipsToBounds= YES;
    self.loginIMage.layer.cornerRadius  = 75;
    self.userName = [[UITextField alloc]init];
    self.userName.textAlignment = NSTextAlignmentLeft;
    self.userName.textColor = [UIColor cyanColor];
    self.userName.placeholder = @"哈哈";
    self.userName.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.userName];
    
    self.userPass = [[UITextField alloc]init];
    self.userPass.textAlignment = NSTextAlignmentLeft;
    self.userPass.textColor = [UIColor greenColor];
    self.userPass.placeholder = @"密码";
    self.userPass.borderStyle  = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.userPass];

    
    [self.loginIMage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(150, 150));
        make.topMargin.equalTo(@90);
        make.centerX.equalTo(self.view);
    }];
    
    
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(self.view.frame.size.width-40, 30));
        make.center.equalTo(self.view);
    }];
    
    [self.userPass mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userName.mas_bottom).offset(10);
        make.size.equalTo(self.userName);
        make.centerX.equalTo(self.userName);
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
