//
//  UIImage+LW_CircleImage.m
//  LWFrameWorkTest
//
//  Created by 李伟 on 16/8/22.
//  Copyright © 2016年 TFLH. All rights reserved.




#import "UIImage+LW_CircleImage.h"

@implementation UIImage (LW_CircleImage)
- (UIImage *)cutCircleImage {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    CGContextRef ctr = UIGraphicsGetCurrentContext();

    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctr, rect);

    CGContextClip(ctr);
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
