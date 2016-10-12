//
//  CutImage_LW.m
//  LWFrameWorkTest
//
//  Created by 李伟 on 16/8/11.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import "CutImage_LW.h"

@implementation CutImage_LW
+ (UIImage *)lw_CutImageWithOriginalImage:(UIImage *)originalImage {

    if (!originalImage) {
        return nil;
    }

    CGRect rect = CGRectMake(100, 90, 200, 200);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextClipToRect(currentContext, rect);

    CGContextDrawImage(currentContext, rect, originalImage.CGImage);
    UIImage *croppedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return croppedImage;
}
@end
