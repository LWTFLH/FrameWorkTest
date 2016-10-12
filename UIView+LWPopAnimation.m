//
//  UIView+LWPopAnimation.m
//  LWFrameWorkTest
//
//  Created by 李伟 on 16/7/20.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import "UIView+LWPopAnimation.h"

@implementation UIView (LWPopAnimation)
+ (POPSpringAnimation *)lwSpringPopAnimationWithAnimationType:(NSString *)springAnimationType
                                               springVelocity:(CGFloat)springVelocity
                                                springBounces:(CGFloat)springBounces
                                                  springSpeed:(CGFloat)springSpeed
                                        springDynamicsTension:(CGFloat)dynamicsTension
                                       springDynamicsFriction:(CGFloat)dynamicsFriction
                                           springDynamicsMass:(CGFloat)dynamicsMass {

    NSAssert(springAnimationType != nil, @"springAnimationType  is nil");
    POPSpringAnimation *aniomation = [POPSpringAnimation animationWithPropertyNamed:springAnimationType];

    aniomation.velocity = @(springVelocity);
    aniomation.springBounciness = springBounces;
    aniomation.springSpeed = springSpeed;
    aniomation.dynamicsTension = dynamicsTension;
    aniomation.dynamicsFriction = dynamicsFriction;
    aniomation.dynamicsMass = dynamicsMass;

    return aniomation;
}
@end
