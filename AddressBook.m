//
//  AddressBook.m
//  LWFrameWorkTest
//
//  Created by 李伟 on 16/8/26.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import "AddressBook.h"
#import <AddressBook/ABPerson.h>
#import <AddressBookUI/ABPeoplePickerNavigationController.h>
#import <AddressBookUI/ABPersonViewController.h>
@interface AddressBook () <ABPeoplePickerNavigationControllerDelegate>

@end

@implementation AddressBook

- (void)viewDidLoad {
    [super viewDidLoad];
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_sync(queue, ^{
       
        NSLog(@"task1");
    });
    
    dispatch_sync(queue, ^{
        
        NSLog(@"task2");
    });
    dispatch_sync(queue, ^{
        
        NSLog(@"task3");
    });
    dispatch_sync(queue, ^{
        
        NSLog(@"task4");
    });

    dispatch_barrier_sync(queue, ^{
        NSLog(@"task1-2-3-4");
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"final task");
    });
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_group_t group = dispatch_group_create();
//    dispatch_group_async(group, queue, ^{
//       // [NSThread sleepForTimeInterval:1];
//        NSLog(@"group1");
//    });
//    dispatch_group_async(group, queue, ^{
//      //  [NSThread sleepForTimeInterval:2];
//        NSLog(@"group2");
//    });
//    dispatch_group_async(group, queue, ^{
//       // [NSThread sleepForTimeInterval:3];
//        NSLog(@"group3");
//    });
//    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//        NSLog(@"updateUi"); 
//    });
    
    
     //    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
    //
    //        ABAddressBookRequestAccessWithCompletion(addressAcess, ^(bool granted, CFErrorRef error) {
    //
    //            if (granted) {
    //                NSLog(@"授权完毕");
    //                 [self showPersonNav];
    //            }else{
    //
    //                dispatch_sync(dispatch_get_main_queue(), ^{
    //                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"通信录授权"
    //                    message:@"此app不能访问您的通讯录，需要设置允许" delegate:nil cancelButtonTitle:@"取消"
    //                    otherButtonTitles:@"确定", nil];
    //                    [alert show];
    //                });
    //
    //
    //            }
    //
    //        });
    //    });
    //
    
    
    
   //    dispatch_group_async(group, queue, ^{
//       
//        NSLog(@"最后执行");
//    });
    
    
    
    
    
//    dispatch_group_t group2 = dispatch_group_create();
//    dispatch_queue_t queue2 = dispatch_get_global_queue(0, 0);
//    ABAddressBookRef addressAcess = nil;
//
//    dispatch_group_async(group2, queue2, ^{
//        NSLog(@"thread1");
//        ABAddressBookRequestAccessWithCompletion(addressAcess, ^(bool granted, CFErrorRef error) {
//
//            if (granted) {
//                NSLog(@"授权完毕");
//                [self showPersonNav];
//            } else {
//
//                dispatch_sync(dispatch_get_main_queue(), ^{
//                    UIAlertView *alert =
//                    [[UIAlertView alloc] initWithTitle:@"通信录授权"
//                                               message:@"此app不能访问您的通讯录，需要设置允许"
//                                              delegate:nil
//                                     cancelButtonTitle:@"取消"
//                                     otherButtonTitles:@"确定", nil];
//                    [alert show];
//                });
//            }
//
//        });
//
//    });
//    
//    dispatch_group_async(group2, queue2, ^{
//        [NSThread sleepForTimeInterval:2];
//        NSLog(@"thread 2");
//    });
//    dispatch_group_notify(group2, queue2, ^{
//        NSLog(@"执行完毕");
//        
//    });
//    
//    dispatch_barrier_async(queue2, ^{
//        [NSThread sleepForTimeInterval:3];
//        NSLog(@"睡眠3 s");
//    });
}



-(void)connent{

    dispatch_queue_t queue = dispatch_queue_create("**test.rongfzh.yc", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        // [NSThread sleepForTimeInterval:2];
        NSLog(@"dispatch_async1");
    });
    dispatch_async(queue, ^{
        // [NSThread sleepForTimeInterval:4];
        NSLog(@"dispatch_async2");
    });
    dispatch_barrier_async(queue, ^{
        NSLog(@"dispatch_barrier_async");
        // [NSThread sleepForTimeInterval:4];
    });
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"dispatch_async3");
    });

}
- (void)showPersonNav {

    ABPeoplePickerNavigationController *nav = [[ABPeoplePickerNavigationController alloc] init];
    nav.peoplePickerDelegate = self;
    if ([[UIDevice currentDevice].systemVersion floatValue] > 8.0) { //  oher  dismiss
        nav.predicateForSelectionOfPerson = [NSPredicate predicateWithValue:false];
    }
    [self presentViewController:nav animated:YES completion:nil];
}
- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker {

    [peoplePicker dismissViewControllerAnimated:YES completion:nil];
}
/*
 NSString * name = (__bridge NSString *)ABRecordCopyCompositeName(person);

 //判断点击区域

 if (property == kABPersonPhoneProperty) {

 //取出当前点击的区域中所有的内容

 ABMutableMultiValueRef phoneMulti = ABRecordCopyValue(person, kABPersonPhoneProperty);

 //根据点击的哪一行对应的identifier取出所在的索引

 int index = ABMultiValueGetIdentifierAtIndex(phoneMulti, identifier);

 //根据索引把相应的值取出

 NSString * phone = (__bridge NSString *)ABMultiValueCopyValueAtIndex(phoneMulti, index);
 //        NSString * phone2 = [self isMobileNumber:phone];

 if ([phone isEqualToString:@"无"]) {

 thePhoneTF.text = @"手机号码格式错误";

 }else{

 NSString * myStr = [NSString stringWithFormat:@"%@%@",phone,name];

 NSMutableAttributedString * theString1 = [[NSMutableAttributedString alloc]initWithString:myStr attributes:nil];

 [theString1 addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:5/255.0 green:5/255.0 blue:5/255.0
 alpha:1.0] range:NSMakeRange(0, 13)];

 [theString1 addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:143/255.0 green:143/255.0 blue:143/255.0
 alpha:1.0] range:NSMakeRange(13, [myStr length] - 13)];

 thePhoneTF.attributedText = theString1;

 }

 }

 */
- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker
                         didSelectPerson:(ABRecordRef)person
                                property:(ABPropertyID)property
                              identifier:(ABMultiValueIdentifier)identifier {
    NSString *name = (__bridge NSString *)ABRecordCopyCompositeName(person);
    NSLog(@"<name>%@", name);

    if (property == kABPersonAlternateBirthdayProperty) {

        ABMultiValueRef mu = ABRecordCopyValue(person, kABPersonAlternateBirthdayProperty);

        long indx = ABMultiValueGetIndexForIdentifier(person, identifier);

        NSDictionary *dic = (__bridge NSDictionary *)ABMultiValueCopyValueAtIndex(mu, indx);
        NSLog(@"<prifile>%@", dic);
    }

    if (property == kABPersonPhoneProperty) {

        NSLog(@"phone  attribute");
        ABMutableMultiValueRef phoneMulti = ABRecordCopyValue(person, kABPersonPhoneProperty);

        int index = ABMultiValueGetIdentifierAtIndex(phoneMulti, identifier);

        NSString *phone = (__bridge NSString *)ABMultiValueCopyValueAtIndex(phoneMulti, index);
        //        NSString * phone2 = [self isMobileNumber:phone];

        if ([phone isEqualToString:@" "]) {

            NSLog(@"not ");
        } else {

            NSString *myStr = [NSString stringWithFormat:@"%@%@", phone, name];

            NSLog(@"<拼接后>%@", myStr);
            NSMutableAttributedString *theString1 = [[NSMutableAttributedString alloc] initWithString:myStr attributes:nil];

            [theString1 addAttribute:NSForegroundColorAttributeName
                               value:[UIColor colorWithRed:5 / 255.0 green:5 / 255.0 blue:5 / 255.0 alpha:1.0]
                               range:NSMakeRange(0, 13)];

            [theString1 addAttribute:NSForegroundColorAttributeName
                               value:[UIColor colorWithRed:143 / 255.0 green:143 / 255.0 blue:143 / 255.0 alpha:1.0]
                               range:NSMakeRange(13, [myStr length] - 13)];
        }
    }
    //    ABMultiValueRef  phone =ABRecordCopyValue(person, kABPersonAddressProperty);
    //    long index = ABMultiValueGetIndexForIdentifier(phone, identifier);
    //    NSDictionary *phoneNO = (__bridge NSDictionary *)ABMultiValueCopyValueAtIndex(phone, index);
    //    /*
    //    if ([phoneNO hasPrefix:@"+"]) {
    //        phoneNO = [phoneNO substringFromIndex:3];
    //    }
    //
    //    phoneNO = [phoneNO stringByReplacingOccurrencesOfString:@"-" withString:@""];
    //     */
    //
    //
    //
    //    NSLog(@"%@", phoneNO);

    //[peoplePicker dismissViewControllerAnimated:YES completion:nil];
}
- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker
                         didSelectPerson:(ABRecordRef)person {

    ABPersonViewController *personVC = [[ABPersonViewController alloc] init];
    personVC.displayedPerson = person;
    [peoplePicker pushViewController:personVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
