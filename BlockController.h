//
//  BlockController.h
//  LWFrameWorkTest
//
//  Created by 李伟 on 16/8/26.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NSString *(^stringBlock)(NSString *);
@interface BlockController : UIViewController
@property(nonatomic,copy)stringBlock stringBloc;
@end
