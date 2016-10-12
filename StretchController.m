//
//  StretchController.m
//  LWFrameWorkTest
//
//  Created by 李伟 on 16/8/10.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import "CutImage_LW.h"
#import "StretchController.h"
#import "UINavigationBar+Background.h"
#import "LWCustomerStatus/LWCustomerStatus.h"
#import <SDCycleScrollView/SDCycleScrollView.h>
@interface StretchController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *stretchTable;
@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) SDCycleScrollView *cycleView;
@end

@implementation StretchController {

    CGRect originalFrame;
    UILabel*loginUser;
}
- (SDCycleScrollView *)cycleView {

    if (!_cycleView) {
        _cycleView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 160)
                                                        delegate:(id)self
                                                placeholderImage:[UIImage imageNamed:@"21.jpg"]];

        _cycleView.localizationImageNamesGroup = @[
            [UIImage imageNamed:@"11.jpg"],
            [UIImage imageNamed:@"2.jpg"],
            [UIImage imageNamed:@"31.jpg"],
            [UIImage imageNamed:@"banner.png"]
        ];
        _cycleView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    }
    NSLog(@"<cycle frame>%@", NSStringFromCGRect(_cycleView.frame));
    return _cycleView;
}
- (UITableView *)stretchTable {

    if (!_stretchTable) {
        _stretchTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                                                     style:UITableViewStylePlain];
        _stretchTable.delegate = self;
        _stretchTable.dataSource = self;
        [self.view addSubview:_stretchTable];
    }
    return _stretchTable;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }

    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行", indexPath.row];
    return cell;
}
- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}
- (void)viewDidDisappear:(BOOL)animated {

    [super viewDidDisappear:animated];

    [self.navigationController.navigationBar cnReset];
}


-(void)showDataStatus:(NSString *)message{

    [[[LWCustomerStatus alloc]init] showStatusWithMessage:message];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self showDataStatus:@"已经没有数据了"];
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.navigationItem.titleView = [[UISwitch alloc] init];
    // self.title = @"fafafafafa";
    NSLog(@"<title nav >%@", self.navigationController);
    self.imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, -150, self.view.frame.size.width, 150)];
    originalFrame = self.imageV.frame;
    self.imageV.contentMode = UIViewContentModeScaleAspectFill;
    self.imageV.clipsToBounds = YES;
    self.imageV.image = [UIImage imageNamed:@"2.jpg"];

    UILabel *login = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 60) / 2, (self.imageV.frame.size.height-60)/2.0, 60, 60)];
  //  login.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin;
    login.text = @"登入";
  //  login.center = CGPointMake(self.view.frame.size.width/2, 60);
    login.backgroundColor = [UIColor redColor];
    login.layer.masksToBounds = YES;
    login.layer.cornerRadius  =30;
    loginUser = login;
    //  self.edgesForExtendedLayout = UIRectEdgeNone;
    // login.backgroundColor = [[UIColor greenColor]colorWithAlphaComponent:.5];
   // login.autoresizesSubviews = YES;

   // login.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    login.textAlignment = NSTextAlignmentCenter;
    login.textColor = [UIColor cyanColor];
    self.imageV.userInteractionEnabled = YES;
     [self.imageV addSubview:login];

   // [self.imageV addSubview:self.cycleView];
    NSLog(@"<图片 frame>%@", NSStringFromCGRect(self.imageV.frame));
    [self.stretchTable addSubview:self.imageV];
    self.stretchTable.contentInset = UIEdgeInsetsMake(150, 0, 0, 0);

    // [self cutImage];
}

#pragma cutImage

- (void)cutImage {

    UIImage *relust = [CutImage_LW lw_CutImageWithOriginalImage:[UIImage imageNamed:@"11.jpg"]];

    UIImageView *cutView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 90, relust.size.width, relust.size.height)];
    cutView.image = relust;

    NSLog(@"%@", NSStringFromCGRect(cutView.frame));
    [self.view addSubview:cutView];
}


#pragma ios 9
-(void)newFeature_9{
    
    
    UIStackView *stack = [[UIStackView alloc]init];
    
    UIView *v1 =[[ UIView alloc]init];
    v1.backgroundColor = [UIColor redColor];
    
    
    UIView *v2 =[[ UIView alloc]init];
    v1.backgroundColor = [UIColor yellowColor];
    
    [stack insertArrangedSubview:v1 atIndex:0];
    [stack insertArrangedSubview:v2 atIndex:1];
    
    stack.axis = UILayoutConstraintAxisHorizontal;
    stack.alignment = UIStackViewAlignmentCenter;
    stack.spacing = 10;
    stack.distribution = UIStackViewDistributionEqualSpacing;
    
    
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    CGFloat offsetY = scrollView.contentOffset.y;
    NSLog(@"<offset>%f", offsetY);

    if (offsetY < 150 * -1) {
        //开始前就模糊掉
        [self.navigationController.navigationBar cnSetBackgroundColor:[[[UIColor alloc] init] colorWithAlphaComponent:0.00001]];

        self.navigationItem.titleView.alpha = 0.0000001;

        CGRect currentFrame = self.imageV.frame;
        currentFrame.origin.y = offsetY;
        currentFrame.size.height = -1 * offsetY;
        self.imageV.frame = currentFrame;
// Login
        
//        CGRect userLog = loginUser.frame;
//        userLog.size.height = -1*offsetY;
//        userLog.size.width = -1*offsetY;
//        loginUser.frame = userLog;
//        loginUser.clipsToBounds = YES;
//        loginUser.layer.cornerRadius  =-1*offsetY/2;
        
        NSLog(@"<frame>%@", NSStringFromCGRect(self.imageV.frame));
    } else {

        UIColor *color = [UIColor colorWithRed:200 / 255.0 green:100 / 255.0 blue:45 / 255.0 alpha:1];

        [self.navigationController.navigationBar cnSetBackgroundColor:[color colorWithAlphaComponent:1 - (-offsetY / 150.0)]];

        self.navigationItem.titleView.alpha = 1 - (-offsetY / 150.0);
        // 缩小circle
//        CGRect userLog = loginUser.frame;
//        userLog.size.height = -1*offsetY;
//        userLog.size.width = -1*offsetY;
//        loginUser.frame = userLog;
//        loginUser.clipsToBounds = YES;
//        loginUser.layer.cornerRadius  =-1*offsetY/2;
//        
    }

    
  
   }
@end
