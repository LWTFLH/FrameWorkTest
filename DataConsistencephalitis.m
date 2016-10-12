//
//  DataConsistencephalitis.m
//  LWFrameWorkTest
//
//  Created by 李伟 on 16/8/30.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import "DataConsistencephalitis.h"


@interface DataConsistencephalitis ()

@end

@implementation DataConsistencephalitis {

  //  FMDatabase *_db;
}
- (void)viewDidLoad {
    [super viewDidLoad];
  //  [self encrtptDBWithPrivacyKey:nil];
    
   // [self testDB];
}

//- (void)encrtptDBWithPrivacyKey:(NSString *)privateKey {
//
//    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//
//    _db = [FMDatabase databaseWithPath:[path stringByAppendingPathComponent:@"lw.db"]];
//
//     BOOL isSucKey = [_db setKey:@"hgghvavsjghdagjadd"];
//    
//    NSLog(@"<是否加密suc>%d",isSucKey);
//    NSString *cacheDir = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
//    //
//    
//    
//    
//    NSString *filePath = [cacheDir stringByAppendingPathComponent:@"contact.db"];
//    NSLog(@"<沙盒>%@",filePath);
//    _db = [FMDatabase databaseWithPath:filePath];
//   // [_db setKey:@"qftyjwdfqjdajhcv37t8872to82tr972kahcgakg"];
//
//    BOOL flag = [_db open];
//    if (flag) {
//        NSLog(@"数据库打开成功");
//    } else {
//        NSLog(@"数据库打开失败");
//    }
//
//    BOOL create =
//    [_db executeUpdate:@"create table if not exists t_health(id integer primary key  autoincrement, name text,phone text)"];
//
//    if (create) {
//        NSLog(@"创建表成功");
//    } else {
//        NSLog(@"创建表失败");
//    }
//}
//
//-(void)testDB{
//
//    UIView *userView = [[UIView alloc]initWithFrame:CGRectMake(90, 90, 200, 200)];
//  //  userView.backgroundColor  =[UIColor grayColor];
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn setFrame:CGRectMake(0, 0, 70, 30)];
//    [btn setBackgroundColor:[UIColor purpleColor]];
//    btn.layer.shadowColor = [UIColor greenColor].CGColor;
//    btn.layer.shadowOffset  = CGSizeMake(10, -10);
//    [btn setTitle:@"insert" forState:UIControlStateNormal];
//    [btn setTintColor:[UIColor cyanColor]];
//    
//    [userView addSubview:btn];
//    userView.center = self.view.center;
//    [btn addTarget:self action:@selector(insert:) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:userView];
//    
//    UIButton *dele = [UIButton buttonWithType:UIButtonTypeCustom];
//    [dele setFrame:CGRectMake(100, 150, 70, 30)];
//    [dele setBackgroundColor:[UIColor purpleColor]];
//    dele.layer.shadowColor = [UIColor greenColor].CGColor;
//    dele.layer.shadowOffset  = CGSizeMake(10, -10);
//    [dele setTitle:@"delet" forState:UIControlStateNormal];
//    [dele setTintColor:[UIColor cyanColor]];
//    [dele addTarget:self action:@selector(delete:) forControlEvents:UIControlEventTouchUpInside];
//    
//    
//    [self.view addSubview:dele];
//    
//    
//    
//    UIButton *sele = [UIButton buttonWithType:UIButtonTypeCustom];
//    [sele setFrame:CGRectMake(100, 200, 70, 30)];
//    [sele setBackgroundColor:[UIColor purpleColor]];
//    sele.layer.shadowColor = [UIColor greenColor].CGColor;
//    sele.layer.shadowOffset  = CGSizeMake(10, -10);
//    [sele setTitle:@"select" forState:UIControlStateNormal];
//    [sele setTintColor:[UIColor cyanColor]];
//    [sele addTarget:self action:@selector(select:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:sele];
//    
//    
//}
//
//- (void)insert:(UIButton *)sender {
//
//    BOOL insert = [_db executeUpdate:@"insert into t_health (name,phone) values(?,?)", @"李伟", @"120"];
//    if (insert) {
//        NSLog(@"插入数据成功");
//    } else {
//        NSLog(@"插入数据失败");
//    }
//}
//
//- (void) delete:(UIButton *)sender {
//    BOOL delete = [_db executeUpdate:@"delete from t_health where name like ?", @"李伟"];
//    if (delete) {
//        NSLog(@"删除数据成功");
//    } else {
//        NSLog(@"删除数据失败");
//    }
//}
//
//- (void)update:(UIButton *)sender {
//    BOOL update = [_db executeUpdate:@"update t_health set name = ?  where phone = '%@'", @"120"];
//    if (update) {
//        NSLog(@"更新数据成功");
//    } else {
//        NSLog(@"更新数据失败");
//    }
//}
//
//- (void)select:(UIButton *)sender {
//    FMResultSet *set = [_db executeQuery:@"select * from t_health "];
//    while ([set next]) {
//        NSString *name = [set stringForColumn:@"name"];
//        NSString *phone = [set stringForColumn:@"phone"];
//        NSLog(@"name : %@ phone: %@", name, phone);
//    }
//
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
