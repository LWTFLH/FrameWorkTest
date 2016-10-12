//
//  ToolRegulerExpresstion.m
//  LWFrameWorkTest
//
//  Created by 李伟 on 16/8/10.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import "ToolRegulerExpresstion.h"

@implementation ToolRegulerExpresstion

+(BOOL)toolPhoneNumberWitnString:(NSString *)phoneNumber{

    NSAssert(phoneNumber!=nil, @"phone not nil");
    NSString *format= @"^1[3|4|5|7|8][0-9]\\d{8}$";
    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",format];
    return [numberPre evaluateWithObject:phoneNumber];
    
}

+(BOOL)toolValidIDCardWithCardNumber:(NSString *)number{

    NSAssert(number!=nil, @"nmber not nil");
    
    NSString *format= @"\\d{14}[[0-9],0-9xX]";
    
    NSPredicate *numPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %",format];
    
    return [numPre evaluateWithObject:number];
    
}
+(BOOL)toolValidEmailWithString:(NSString *)email{

    NSAssert(email!=nil, @"email not nil");
      NSString *format= @"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
    NSPredicate *emalFormat = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",format];
    
    return [emalFormat evaluateWithObject:email];
    
}

+(BOOL)toolValidNumberAndString:(NSString *)numAndString{

    NSAssert(numAndString != nil, @"numAndString not nil");
    NSString *format= @"^[A-Za-z0-9]+$";
    NSPredicate *emalFormat = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",format];
    
    return [emalFormat evaluateWithObject:numAndString];

    
    
}

+(BOOL)toolValidIsDigital:(NSString *)number{

    NSAssert(number !=nil, @"number not nil");
    NSString *format= @"^[0-9]*$";
    NSPredicate *emalFormat = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",format];
    
    return [emalFormat evaluateWithObject:number];
    
    
}

+(BOOL)toolValidIsOnlyNDigital:(NSNumber*)n{

    NSString *format= @"^\\d{n}$";
    NSPredicate *emalFormat = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",format];
    
    return [emalFormat evaluateWithObject:n];
    
    
}
@end
