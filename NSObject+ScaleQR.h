//
//  NSObject+ScaleQR.h
//  LWFrameWorkTest
//
//  Created by 李伟 on 16/8/23.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSObject (ScaleQR)
+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size;
@end
