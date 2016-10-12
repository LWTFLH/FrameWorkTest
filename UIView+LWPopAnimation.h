//
//  UIView+LWPopAnimation.h
//  LWFrameWorkTest
//
//  Created by 李伟 on 16/7/20.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <pop/POP.h>
@interface UIView (LWPopAnimation)
/**
 *  按照指定的参数返回一个pop object
 *
 *  @param springAnimationType springAnimation动画类型
 *  @param velocity            springAnimation 初试速度
 *  @param springBounces       springAnimation 弹簧效果
 *  @param springSpeed         springAnimation 弹簧速度
 *  @param dynamicsTension     springAnimation 重力学数值
 *  @param dynamicsFriction    springAnimation 重力学碎片数值
 *  @param dynamicsMass        springAnimation  重力学质量
 *
 *  @return  springAnimation Object
 */
+(POPSpringAnimation *)lwSpringPopAnimationWithAnimationType:(NSString *)springAnimationType springVelocity:(CGFloat)velocity springBounces:(CGFloat)springBounces springSpeed:(CGFloat)springSpeed springDynamicsTension:(CGFloat)dynamicsTension springDynamicsFriction:(CGFloat)dynamicsFriction springDynamicsMass:(CGFloat)dynamicsMass;
@end
