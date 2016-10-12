//
//  Mask_ViewController.m
//  LWFrameWorkTest
//
//  Created by 李伟 on 16/8/12.
//  Copyright © 2016年 TFLH. All rights reserved.
//
#define LWWeak(type) __weak typeof(type) weak##type = type
#define toast(str) [NSString stringWithFormat:@"%@", @ #str]
#import "Mask_ViewController.h"
#import "NSObject+ScaleQR.h"
#import "UIImage+LW_CircleImage.h"
#import "ZYAnimationLayer.h"
#import "BlockController.h"
#import <CoreImage/CoreImage.h>
#import <SystemConfiguration/CaptiveNetwork.h>
#import <SystemConfiguration/SystemConfiguration.h>
@interface Mask_ViewController ()
@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UIDevice *device;
@end

@implementation Mask_ViewController {

    UIView *maskVi;
    CALayer *maskLay;
    UIImageView *qrIMage;
}

- (void)generateQR {

    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];

    NSString *dataStr = @"http://www.newbenben.com";
    NSData *data = [dataStr dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKeyPath:@"inputMessage"];
    CIImage *outImage = [filter outputImage];
    qrIMage.image = [NSObject createNonInterpolatedUIImageFormCIImage:outImage withSize:100];

    UIImageView *userIma =
    [[UIImageView alloc] initWithFrame:CGRectMake((qrIMage.frame.size.width - 50) / 2, (qrIMage.frame.size.height - 50) / 2, 50, 50)];
    userIma.clipsToBounds = YES;
    userIma.layer.cornerRadius = 25;
    userIma.image = [UIImage imageNamed:@"21.jpg"];
    [qrIMage addSubview:userIma];
}

//  scale qr

- (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat)size {
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size / CGRectGetWidth(extent), size / CGRectGetHeight(extent));

    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);

    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationHigh);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);

    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //[self mask];

    //  [self sttringSize];

    //  [self textEnevt];

    //  [self deviceInfos];
    // LWWeak(self);

    // [weakself mask];

    //  NSLog(@"%@",[self fetchSSIInfo][@"SSIDDATA"]);

    qrIMage = [[UIImageView alloc] initWithFrame:CGRectMake(90, 90, 200, 200)];
    [self.view addSubview:qrIMage];

    //[self generateQR];

    [ZYAnimationLayer createAnimationLayerWithString:@"肖胖子....i will kill you   \n\r  he he "
                                             andRect:self.view.bounds
                                             andView:self.view
                                             andFont:[UIFont boldSystemFontOfSize:20]
                                      andStrokeColor:[UIColor cyanColor]];
}

- (NSDictionary *)fetchSSIInfo {

    NSArray *ifs = (__bridge NSArray *)CNCopySupportedInterfaces();
    if (!ifs) {
        return nil;
    }
    NSDictionary *info = nil;
    for (NSString *ifnam in ifs) {
        info = (__bridge_transfer NSDictionary *)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        if (info && [info count]) {
            break;
        }
    }
    return info;
}

//- (NSString *)getGatewayIpForCurrentWiFi {
//    NSString *address = @"error";
//    struct ifaddrs *interfaces = NULL;
//    struct ifaddrs *temp_addr = NULL;
//    int success = 0;
//    // retrieve the current interfaces - returns 0 on success
//    success = getifaddrs(&interfaces);
//    if (success == 0) {
//        // Loop through linked list of interfaces
//        temp_addr = interfaces;
//        //*/
//        while(temp_addr != NULL) {
//            /*/
//             int i=255;
//             while((i--)>0)
//             //*/
//            if(temp_addr->ifa_addr->sa_family == AF_INET) {
//                // Check if interface is en0 which is the wifi connection on the iPhone
//                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"])
//                {
//                    // Get NSString from C String //ifa_addr
//                    //ifa->ifa_dstaddr is the broadcast address, which explains the "255's"
//                    //                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in
//                    *)temp_addr->ifa_dstaddr)->sin_addr)];
//                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in
//                    *)temp_addr->ifa_addr)->sin_addr)];
//                    //routerIP----192.168.1.255 广播地址
//                    NSLog(@"broadcast address--%@",[NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in
//                    *)temp_addr->ifa_dstaddr)->sin_addr)]);
//                    //--192.168.1.106 本机地址
//                    NSLog(@"local device ip--%@",[NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in
//                    *)temp_addr->ifa_addr)->sin_addr)]);
//                    //--255.255.255.0 子网掩码地址
//                    NSLog(@"netmask--%@",[NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in
//                    *)temp_addr->ifa_netmask)->sin_addr)]);
//                    //--en0 端口地址
//                    NSLog(@"interface--%@",[NSString stringWithUTF8String:temp_addr->ifa_name]);
//                }
//            }
//            temp_addr = temp_addr->ifa_next;
//        }
//    }
//    // Free memory
//    freeifaddrs(interfaces);
//    in_addr_t i = inet_addr([address cStringUsingEncoding:NSUTF8StringEncoding]);
//    in_addr_t* x = &i;
//    unsigned char *s = getdefaultgateway(x);
//    NSString *ip=[NSString stringWithFormat:@"%d.%d.%d.%d",s[0],s[1],s[2],s[3]];
//    free(s);
//    return ip;
//}

- (void)sttringSize {

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 90, 180, 20)];
    label.text = @"sgfsjhfgjshgjhScgja<HG agfilqFQlimzho;MDO;IQbdqkyfgwaukeyfgiulbfgiluBKFUA "
                 @"ZFDHAB˚ÓÅBDKADUKGFAUHBGANDZGLAIXF;AWYW;AOHFIXM;oiN;OIREYNOI;TY;EOIGRYMCmye;ngyeo;gmu;eug;";
    label.numberOfLines = 0;
    [label sizeToFit];

    [self.view addSubview:label];
}

- (void)mask {

    UIImageView *imaV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];

    imaV.image = [UIImage imageNamed:@"jobs_gray.png"];

    [self.view addSubview:imaV];

    UIImageView *imag2 = [[UIImageView alloc] initWithFrame:imaV.frame];
    imag2.image = [UIImage imageNamed:@"jobs_color.png"];
    [self.view addSubview:imag2];

    maskLay = [CALayer layer];
    UIImage *maskIma = [UIImage imageNamed:@"01.jpg"];

    maskLay.contents = (id)maskIma.CGImage;
    maskLay.frame = CGRectMake(0, 0, maskIma.size.width, maskIma.size.height);
    maskLay.position = self.view.center;

    imag2.layer.mask = maskLay;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    BlockController *block = [[BlockController alloc]init];
    block.stringBloc = ^(NSString *str){
      
      return  [str stringByAppendingString:@"uttfuafcuyfc"];
        
    };
    if (self.navigationController) {
         [self.navigationController pushViewController:block animated:YES];
    }else{
    
        [self presentViewController:block animated:YES completion:nil];
    }
   
    
}
- (CAShapeLayer *)bezia {
    UIBezierPath *startPath =
    [UIBezierPath bezierPathWithArcCenter:CGPointMake(0, 0) radius:0 startAngle:0 endAngle:M_PI * 2 clockwise:YES];

    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.view.center.x, self.view.center.y)
                                                        radius:300
                                                    startAngle:0
                                                      endAngle:M_PI * 2
                                                     clockwise:YES];

    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.fillRule = @"even-odd";
    shape.path = path.CGPath;
    CABasicAnimation *base = [CABasicAnimation animationWithKeyPath:@"path"];
    base.duration = 2;
    base.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    base.fromValue = startPath;
    base.toValue = path;
    [shape addAnimation:base forKey:nil];

    return shape;
}

- (void)textEnevt {

    UITextField *field = [[UITextField alloc] initWithFrame:CGRectMake(0, 90, 100, 20)];
    field.placeholder = @"adadadada";
    [field addTarget:self action:@selector(valyeChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:field];
}

- (void)deviceInfos {

    self.device = [[UIDevice alloc] init];

    NSLog(@"%@", self.device.name);
    NSLog(@"%@", self.device.model);
    NSLog(@"%@", self.device.localizedModel);
    NSLog(@"%@", self.device.systemName);
    NSLog(@"%@", self.device.systemVersion);
    NSLog(@"%f", self.device.batteryLevel);
    NSLog(@"%ld", (long)self.device.batteryState);

    UIImage *advance = [UIImage imageNamed:@"11.jpg"];

    advance = [advance cutCircleImage];
    self.view.layer.contents = (id)advance.CGImage;
}
- (void)valyeChange:(UITextField *)text {

    NSLog(@"%@", text);
}

//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    //  http://weixin.qq.com/r/OEzUzGjEzTWyrSyv9xkq
//    //   weixin://qr/JnXv90fE6hqVrQOU9yA0
//
//    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqzone://"]]) {
//
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mqzone://"]];
//
//        NSLog(@"suc");
//    } else {
//
//        NSLog(@"failed ");
//    }
//}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    UITouch *touchView = [touches anyObject];

    CGPoint point = [touchView locationInView:self.view];

    maskLay.position = point;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
