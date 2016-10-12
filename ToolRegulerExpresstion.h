//
//  ToolRegulerExpresstion.h
//  LWFrameWorkTest
//
//  Created by 李伟 on 16/8/10.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToolRegulerExpresstion : NSObject
/**
 *  匹配手机号
 *
 *  @param phoneNumber 手机号
 *
 *  @return 是否匹配成功
 */
+(BOOL)toolPhoneNumberWitnString:(NSString *)phoneNumber;
/**
 *  匹配身份证(15位、18位)
 *
 *  @param number 身份证号码
 *
 *  @return yes /no
 */
+(BOOL)toolValidIDCardWithCardNumber:(NSString *)number;
/**
 *  验证邮件号是否合法
 *
 *  @param email 邮件账号
 *
 *  @return 是否匹配成功
 */
+(BOOL)toolValidEmailWithString:(NSString *)email;
/**
 *  只允许数字和字母的字符串
 *
 *  @param numAndString 输入的字符串
 *
 *  @return yes  no
 */
+(BOOL)toolValidNumberAndString:(NSString *)numAndString;
/**
 *  验证是否是数字
 *
 *  @param number 输入的数字
 *
 *  @return yes no
 */
+(BOOL)toolValidIsDigital:(NSString *)number;
+(BOOL)toolValidIsOnlyNDigital:(NSNumber *)n;
@end
