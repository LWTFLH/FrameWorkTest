//
//  ViewController.m
//  LWFrameWorkTest
//
//  Created by 李伟 on 16/7/20.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import "ViewController.h"
#import <pop/POP.h>
//#import <MagicalRecord/CoreData+MagicalRecord.h>

//@import RTDraggableBadge;
//#import "RTDraggableBadge.h"
#import <ActionSheetPicker-3.0/ActionSheetPicker.h>
#import <SSZipArchive/SSZipArchive.h>

#import "UITabBarItem+Badge.h"
#import "UIView+Badge.h"
#import <JazzHands/IFTTTJazzHands.h>

typedef NS_ENUM(NSInteger, lwAnimationType) {
    lwAnimationTypeNone = 0,
    lwAnimationTypeLeft,
    lwAnimationTypeRight,
    lwAnimationTypeTop,
    lwAnimationTypeBottom

};

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

{
    lwAnimationType type;
}
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) UITableViewCell *cellView;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIImageView *zipImage;
/**
 *  动画对象
 */
@property (nonatomic, strong) IFTTTAnimator *animation;
@property(nonatomic,strong) NSFileManager *fileManager;
@end

@implementation ViewController

{

    UIScrollView *src;
    NSArray *strArr; //数据
    NSInteger selectedInd;
}
- (UIImageView *)zipImage {

    if (!_zipImage) {
        _zipImage = [[UIImageView alloc] initWithFrame:CGRectMake(90, 90, 200, 200)];
        _zipImage.image = [UIImage imageNamed:@"11.jpg"];
    }
    return _zipImage;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // [self frameWorkTest];
    //[self badgeValue];
    // self.animation = [IFTTTAnimator new];

    // [self animationScroll];

    //    UITextField *text = [[UITextField alloc] initWithFrame:CGRectMake(90, 90, 200, 20)];
    //    text.borderStyle = UITextBorderStyleRoundedRect;
    //    text.textColor = [UIColor cyanColor];
    //    text.placeholder = @"选择证件类别";
    //    [self.view addSubview:text];
    //    [text addTarget:self action:@selector(testCusActionSheet:) forControlEvents:UIControlEventTouchDown];

    // [self zip];
    [self.view addSubview:self.zipImage];
    [self tipDownload];
}
#pragma 更新
- (void)tipDownload {

    UIAlertAction *avtion = [UIAlertAction
    actionWithTitle:@"去更新"
              style:UIAlertActionStyleDefault
            handler:^(UIAlertAction *_Nonnull action) {

                // 模拟 服务器download
                NSString *pathZip = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
                stringByAppendingPathComponent:@"zipImage.zip"];
                NSArray *arrPaths = [NSArray array];
                arrPaths = @[[[NSBundle mainBundle] pathForResource:@"banner" ofType:@"png"],[[NSBundle mainBundle] pathForResource:@"01" ofType:@"jpg"],[[NSBundle mainBundle] pathForResource:@"11" ofType:@"jpg"],[[NSBundle mainBundle] pathForResource:@"21" ofType:@"jpg"]];

                BOOL isSuc = [SSZipArchive createZipFileAtPath:pathZip withFilesAtPaths:arrPaths];

                NSLog(@"<isSuc>%d", isSuc);
                // 加压
                NSString *unZipFile = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"unzipFile"];
                
                
          BOOL isSucUnZip = [SSZipArchive unzipFileAtPath:pathZip toDestination:unZipFile];
                NSLog(@"<解压状态>%d",isSucUnZip);

                
                // 更新UI
                self.fileManager = [NSFileManager defaultManager];
                
                NSArray *allZipPaths = [self.fileManager subpathsAtPath:unZipFile];//subpathsOfDirectoryAtPath:unZipFile error:nil
                
                //test
                NSArray *contArr = [self.fileManager contentsOfDirectoryAtPath:unZipFile error:nil];
                NSLog(@"<所有解压后的路径>%@",contArr);
                
                self.zipImage.image = [UIImage imageNamed:allZipPaths[3]];
                // 删除old的
            //   BOOL isDeleSuc = [self.fileManager removeItemAtPath:[[NSBundle mainBundle] pathForResource:@"01.jpg" ofType:nil] error:nil];
                
              //  NSLog(@"<isDeleSuc>%d",isDeleSuc);
                NSLog(@"%@",NSHomeDirectory());
            }];

    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消"
                                                     style:UIAlertActionStyleCancel
                                                   handler:^(UIAlertAction *_Nonnull action){

                                                   }];

    UIAlertController *alertVC =
    [UIAlertController alertControllerWithTitle:@"版本更新" message:@"框架更新" preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addAction:avtion];
    [alertVC addAction:cancel];
    [self presentViewController:alertVC
                       animated:YES
                     completion:^{
                         NSLog(@"finished");
                     }];
}

#pragma zip
- (void)zip {

    NSMutableArray *paths = [NSMutableArray array];

    for (int i = 0; i < 4; i++) {
        NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%d1.jpg", i] ofType:nil];
        [paths addObject:path];
    }
    NSString *pathZip = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
    stringByAppendingPathComponent:@"zipImage.zip"];
    NSLog(@"<压缩 路径>%@", pathZip);

    NSString *contentPath = [[NSBundle mainBundle].bundleURL URLByAppendingPathComponent:@"Image" isDirectory:YES].path;

    NSLog(@"<内容Path >%@", contentPath);

    NSString *imaPath = [[NSBundle mainBundle] pathForResource:@"bg.png" ofType:nil];

    //   // NSString *sampleDataPath = [[NSBundle mainBundle].bundleURL
    //                                URLByAppendingPathComponent:@"Image"
    //                                isDirectory:YES].path;

    NSArray *arr = [NSArray array]; //  ,[[NSBundle mainBundle]pathForResource:@"banner" ofType:@"png"]
    arr = @[[[NSBundle mainBundle] pathForResource:@"banner" ofType:@"png"]];

    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"banner.png" ofType:nil];
    BOOL isSuc = [SSZipArchive createZipFileAtPath:pathZip withFilesAtPaths:arr];

    //  BOOL isSuc = [SSZipArchive createZipFileAtPath:pathZip withContentsOfDirectory:path2];

    NSLog(@"<suc >%d", isSuc);

    //  BOOL isSuc = [SSZipArchive createZipFileAtPath:pathZip withFilesAtPaths:paths];

    //    NSLog(@"<suc >%d",isSuc);
    //  unzip
    //  [SSZipArchive unzipFileAtPath:pathZip toDestination:@"/Users/a/Desktop/未命名文件夹"];
}

#pragma 测试cus框架

- (void)testCusActionSheet:(UITextField *)text {
    /**

     "ActionSheetCustomPickerDelegate.h"
     "AbstractActionSheetPicker.h"
     "ActionSheetCustomPicker.h"
     "ActionSheetDatePicker.h"
     "ActionSheetDistancePicker.h"
     "ActionSheetLocalePicker.h"
     "ActionSheetStringPicker.h"
     "ActionSheetMultipleStringPicker.h"
     */

    strArr = @[
        @"私人定制",
        @"同方联合",
        @"李伟",
        @"牛犇犇",
        @"下城区凤起路同方财富大厦",
        @"快"
        @"点选择"
    ];
    [ActionSheetStringPicker showPickerWithTitle:@"证件类型选择"
                                            rows:strArr
                                initialSelection:0
                                          target:self
                                   successAction:@selector(idWasSelected:element:)
                                    cancelAction:@selector(actionSheeetDidCanceled:)
                                          origin:text];
}

#pragma func

- (void)actionSheeetDidCanceled:(ActionSheetStringPicker *)pick {
}
- (void)idWasSelected:(NSNumber *)selectedIndex element:(id)element {
    selectedInd = [selectedIndex integerValue];

    NSLog(@"<选中类别>%@", strArr[selectedInd]);

    NSLog(@"<element>%@", element);
    // may have originated from textField or barButtonItem, use an IBOutlet instead of element
    //    self.animalTextField.text = (self.animals)[(NSUInteger) self.selectedIndex];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    // [self jazzHands];
}

- (void)jazzHands {

    UIImageView *aniIma = [[UIImageView alloc] initWithFrame:CGRectMake(90, 90, 100, 100)];
    aniIma.image = [UIImage imageNamed:@"2.jpg"];
    [self.view addSubview:aniIma];
    IFTTTAlphaAnimation *alphaAni = [IFTTTAlphaAnimation animationWithView:src];
    [alphaAni addKeyframeForTime:30 alpha:1];
    [alphaAni addKeyframeForTime:60 alpha:0];
    [self.animation addAnimation:alphaAni];
}
#pragma scroll
- (void)animationScroll {

    src = [[UIScrollView alloc] init];
    src.frame = self.view.frame;
    src.pagingEnabled = YES;
    [self.view addSubview:src];
    for (int i = 0; i < 4; i++) {
        UIImageView *ima = [[UIImageView alloc]
        initWithFrame:CGRectMake(i * self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
        ima.tag = i;
        ima.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d1.jpg", i]];
        [src addSubview:ima];
    }

    src.contentSize = CGSizeMake(4 * self.view.frame.size.width, self.view.frame.size.height);

    src.delegate = self;
    src.backgroundColor = [UIColor yellowColor];

    NSLog(@"%@", NSStringFromCGRect(src.frame));

    IFTTTAlphaAnimation *alphaAni = [IFTTTAlphaAnimation animationWithView:src];
    [alphaAni addKeyframeForTime:30 alpha:1];
    [alphaAni addKeyframeForTime:60 alpha:0];

    // IFTTTScaleAnimation *scale = [IFTTTScaleAnimation animationWithView:<#(UIView *)#>]

    // [self.animation addAnimation:alphaAni];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    int temp = scrollView.contentOffset.x / self.view.frame.size.width;

    switch (temp) {
        case 3: {
            IFTTTScaleAnimation *scale = [IFTTTScaleAnimation animationWithView:[scrollView viewWithTag:temp]];

            [scale addKeyframeForTime:3
                                scale:.8
                   withEasingFunction:^CGFloat(CGFloat t) {
                       return 2;
                   }];

            [self.animation addAnimation:scale];
        }
        case 1: {

            IFTTTRotationAnimation *rotation = [IFTTTRotationAnimation animationWithView:[scrollView viewWithTag:temp]];

            [rotation addKeyframeForTime:4 rotation:M_PI_4];
            [self.animation addAnimation:rotation];

        }

        break;

        default:
            break;
    }

    //  [self.animation animate:scrollView.contentOffset.x];
}

#pragma delegate

//- (void)badgeValue {
//
//    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
//    // [self.button setTitle:@"click" forState:UIControlStateNormal];
//    //    [self.button setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
//    //    [self.button setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
//    [self.button setFrame:CGRectMake(90, 90, 50, 20)];
//    //  [self.button sizeToFit];
//
//    [self.view addSubview:self.button];
//
//    [[RTDraggableBadge appearance] setBadgeColor:[UIColor redColor]];
//
//    [self.button rt_setBadge:@"登录"
//                  withHandle:^(RTDraggableBadge *badge, RTDragState state) {
//                      badge.contentInsets = UIEdgeInsetsMake(0, 0, 0, 0);
//                      if (state == RTDragStateDragged) {
//                          badge.text = @"n";
//                      }
//                  }];
//
//    //    self.badge.font = [UIFont systemFontOfSize:36];
//    //    self.badge.breakLength = 220.f;
//    //    self.badge.touchAreaOutsets = UIEdgeInsetsMake(20, 20, 20, 20);
//    //    [self.badge setDragStateHandle:^(RTDraggableBadge *badge, RTDragState state) {
//    //        if (state == RTDragStateDragged) {
//    //            badge.text = @"0";
//    //        }
//    //        if (state == RTDragStateStart) {
//    //            /*
//    //             dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(),
//    ^{
//    //             badge.dragEnabled = NO;
//    //             });
//    //             */
//    //        }
//    //        if (state == RTDragStateCanceled) {
//    //            NSLog(@"Canceled");
//    //        }
//    //    }];
//
//    NSLog(@"Xcode 智能提示");
//
//    // self.tabBarItem.badgeValue  = @"19";
//    __block NSInteger count = 12;
//    [self.tabBarItem rt_setBadgeValue:[@(count) stringValue]
//                           withHandle:^(RTDraggableBadge *badge, RTDragState state) {
//                               if (state == RTDragStateDragged) {
//                                   badge.text = [@(--count) stringValue];
//                               }
//                           }];
//}
//
//#pragma init table
//
//- (void)initTba {
//    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
//                                              style:UITableViewStylePlain];
//    [self.table setDelegate:self];
//    [self.table setDataSource:self];
//    [self.view addSubview:self.table];
//}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//
//    return 30;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//        self.cellView = cell;
//    }
//
//    cell.textLabel.text = [NSString stringWithFormat:@"%ld行", indexPath.row];
//    //  [self startAnimationWithDelay:indexPath.row*0.02];
//
//    cell.transform = CGAffineTransformMakeTranslation(self.view.frame.size.width, 0);
//    [UIView animateWithDuration:1.
//                          delay:indexPath.row * 0.01
//         usingSpringWithDamping:0.6
//          initialSpringVelocity:0
//                        options:0
//                     animations:^{
//                         cell.transform = CGAffineTransformIdentity;
//                     }
//                     completion:NULL];
//
//    return cell;
//}
//
//- (void)startAnimationWithDelay:(CGFloat)delayTime {
//    self.cellView.transform = CGAffineTransformMakeTranslation(self.view.frame.size.width, 0);
//    [UIView animateWithDuration:1.
//                          delay:delayTime
//         usingSpringWithDamping:0.6
//          initialSpringVelocity:0
//                        options:0
//                     animations:^{
//                         self.cellView.transform = CGAffineTransformIdentity;
//                     }
//                     completion:NULL];
//}
//
//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//
//    [self frameWorkTest];
//}
//#pragma 框架测试
//- (void)frameWorkTest {
//
//    UIView *popView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    popView.center = self.view.center;
//    popView.layer.masksToBounds = YES;
//    popView.layer.cornerRadius = popView.frame.size.width / 2;
//    popView.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:popView];
//
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 90, 100, 20)];
//    label.textColor = [UIColor greenColor];
//    // label.center = popView.center;
//    label.text = @"你看见了吗";
//    label.textAlignment = NSTextAlignmentCenter;
//    [popView addSubview:label];
//    //    POPSpringAnimation *testANi = [POPSpringAnimation animationWithPropertyNamed:kPOPLabelTextColor];
//    //    testANi.toValue = [UIColor purpleColor];
//    //    [label.layer pop_addAnimation:testANi forKey:nil];
//
//    // image
//    UIImage *ima = [UIImage imageNamed:@"2.jpg"];
//    UIImageView *imag = [[UIImageView alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(label.frame), 100, 100)];
//    imag.contentMode = UIViewContentModeRedraw;
//    imag.image = ima;
//
//    [popView addSubview:imag];
//    //  btn
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn setTitle:@"收藏" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
//    [btn setFrame:CGRectMake(CGRectGetMaxX(imag.frame), imag.frame.origin.y, 80, 20)];
//
//    [popView addSubview:btn];
//
//    POPSpringAnimation *spring = [POPSpringAnimation animationWithPropertyNamed:kPOPNavigationBarBarTintColor];
//    spring.fromValue = [UIColor yellowColor];
//    spring.toValue = [UIColor purpleColor];
//    //  spring.velocity = @100;
//    //  spring.springBounciness  = 20;
//    // spring.springSpeed  = 20;
//    // spring.dynamicsTension  = 20;
//    //  spring.dynamicsFriction  = 90;
//    // spring.dynamicsMass  = 50;
//    //  spring.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 300, 300)];
//    //  [self.navigationController.navigationBar.layer pop_addAnimation:spring forKey:@" "];
//
//    //    POPDecayAnimation *decay = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionX];
//    //  //  decay.deceleration = .1;
//    //
//    //    decay.velocity = @500;
//    //  //  [popView pop_addAnimation:decay forKey:@"decay"];
//    //
//    //
//    //    POPBasicAnimation *base = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
//    //    base.fromValue  =@0;
//    //    base.toValue = @1;
//    //    base.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    //    base.duration = 2;
//    //   // [popView pop_addAnimation:base forKey:nil];
//}
//#pragma coreDta MagicalRecord
//
//- (void)coreDataTest {
//}
//
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
