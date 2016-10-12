//
//  Person.h
//  LWFrameWorkTest
//
//  Created by 李伟 on 16/7/20.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(nonatomic,assign)NSInteger age;
@property(nonatomic,copy)NSString* name;
@property(nonatomic,copy)NSString*phone;
@property(nonatomic,assign)BOOL   gender;
@end
