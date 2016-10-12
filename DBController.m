//
//  DBController.m
//  LWFrameWorkTest
//
//  Created by 李伟 on 16/8/30.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import "DBController.h"

#import "SortAddress.h"

@interface DBController ()

@property(nonatomic,strong)UILabel *test;
//{
//    NSString *dbPath1;
//    NSString *dbPath2;
//    
//    NSString *originKey;
//    NSString *newKey;
//}
@end

@implementation DBController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *directory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
//    dbPath1 = [directory stringByAppendingPathComponent:@"db1.db"];
//    dbPath2 = [directory stringByAppendingPathComponent:@"db2.db"];
//    
//    originKey = @"aaa";
//    newKey = @"bbb";
//    NSLog(@"<非加密 path%@",dbPath1);
    
    
    self.test = [[UILabel alloc]initWithFrame:CGRectMake(90, 90, 200, 20)];
    [self.test sizeToFit];
    self.test.backgroundColor = [UIColor greenColor];
    self.test.textColor= [UIColor cyanColor];
    self.test.textAlignment  = NSTextAlignmentCenter;
    self.test.text = @"hehhehe";
    [self.view addSubview:self.test];
    
    
    
   }

-(void)viewDidDisappear:(BOOL)animated{

    [super viewDidDisappear:animated];
    
    
    NSLog(@"<viewDidDisappear>%@",self.test);
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self.navigationController pushViewController:[[SortAddress alloc] init] animated:YES];
    
    
    

}

//- (IBAction)createUnencryptDb1:(id)sender {
//    DbService *dbService = [[DbService alloc] initWithPath:dbPath1 encrypt:NO];
//    NSLog(@"<dbpath>%@", dbPath1);
//    [self createTable:dbService];
//    [self insertPeople:dbService];
//    [[[UIAlertView alloc] initWithTitle:nil
//                                message:@"创建成功"
//                               delegate:nil
//                      cancelButtonTitle:nil
//                      otherButtonTitles:@"好的", nil] show];
//}
//
//- (IBAction)createEncryptDb2:(id)sender {
//    [FMEncryptDatabase setEncryptKey:originKey];
//    DbService *dbService = [[DbService alloc] initWithPath:dbPath2 encrypt:YES];
//    NSLog(@"<加密db2>%@",dbPath2);
//    [self createTable:dbService];
//    [self insertPeople:dbService];
//    [[[UIAlertView alloc] initWithTitle:nil
//                                message:@"创建成功"
//                               delegate:nil
//                      cancelButtonTitle:nil
//                      otherButtonTitles:@"好的", nil] show];
//}
//
//- (IBAction)readUnencryptDb1:(id)sender {
//    DbService *dbService = [[DbService alloc] initWithPath:dbPath1 encrypt:NO];
//    NSInteger count = [dbService rowCount:@"People"];
//    [[[UIAlertView alloc] initWithTitle:nil
//                                message:[NSString stringWithFormat:@"读取出%ld个人", count]
//                               delegate:nil
//                      cancelButtonTitle:nil
//                      otherButtonTitles:@"好的", nil] show];
//    /*@[@"str1", @"str2", @"float1", @"double1", @"short1", @"long1", @"date1", @"bool1", @"data1"]*/
//    NSArray *models =
//    [dbService executeQuery:@"select * from People"
//       withArgumentsInArray:nil
//                 modelClass:[PersonModel class]];
//    
//    for (PersonModel *person in models) {
//        
//        NSLog(@"<ID>%ld", person.peopleId);
//        NSLog(@"<NAME>%@", person.name);
//        NSLog(@"<GENDER>%@", person.gender);
//        NSLog(@"<W>%lf", person.weight);
//        NSLog(@"<H>%lf", person.height);
//        NSLog(@"<AGE>%d", person.age);
//        NSLog(@"<Score>%ld", person.score);
//        NSLog(@"%@", person.createTime);
//        NSLog(@"%d", person.married);
//        NSLog(@"%@", person.desc);
//    }
//}
//
//- (IBAction)readEncryptDb2:(id)sender {
//    [FMEncryptDatabase setEncryptKey:originKey];
//    DbService *dbService = [[DbService alloc] initWithPath:dbPath2 encrypt:YES];
//    NSInteger count = [dbService rowCount:@"People"];
//    [[[UIAlertView alloc] initWithTitle:nil
//                                message:[NSString stringWithFormat:@"读取出%ld个人", count]
//                               delegate:nil
//                      cancelButtonTitle:nil
//                      otherButtonTitles:@"好的", nil] show];
//    NSArray *models = [dbService executeQuery:@"Select * from People " withArgumentsInArray:nil modelClass:[PersonModel class]];
//    
//    NSLog(@"==========================加密数据库start===================================");
//    for (PersonModel *person in models) {
//        
//        NSLog(@"<ID>%ld", person.peopleId);
//        NSLog(@"<NAME>%@", person.name);
//        NSLog(@"<GENDER>%@", person.gender);
//        NSLog(@"<W>%lf", person.weight);
//        NSLog(@"<H>%lf", person.height);
//        NSLog(@"<AGE>%d", person.age);
//        NSLog(@"<Score>%ld", person.score);
//        NSLog(@"%@", person.createTime);
//        NSLog(@"%d", person.married);
//        NSLog(@"%@", person.desc);
//    }
//    NSLog(@"==========================加密数据库end===================================");
//    
//    
//}
//
//- (IBAction)encryptDb1:(id)sender {
//    [FMEncryptHelper encryptDatabase:dbPath1];
//    
//    NSLog(@"<加密path1>%@",dbPath1);
//    [[[UIAlertView alloc] initWithTitle:nil
//                                message:@"加密成功"
//                               delegate:nil
//                      cancelButtonTitle:nil
//                      otherButtonTitles:@"好的", nil] show];
//}
//
//- (IBAction)unencryptDb2:(id)sender {
//    [FMEncryptHelper unEncryptDatabase:dbPath2];
//    [[[UIAlertView alloc] initWithTitle:nil
//                                message:@"解密成功"
//                               delegate:nil
//                      cancelButtonTitle:nil
//                      otherButtonTitles:@"好的", nil] show];
//}
//
//- (IBAction)readEncryptDb1:(id)sender {
//    [FMEncryptDatabase setEncryptKey:originKey];
//    DbService *dbService = [[DbService alloc] initWithPath:dbPath1 encrypt:YES];
//    NSInteger count = [dbService rowCount:@"People"];
//    [[[UIAlertView alloc] initWithTitle:nil
//                                message:[NSString stringWithFormat:@"读取出%ld个人", count]
//                               delegate:nil
//                      cancelButtonTitle:nil
//                      otherButtonTitles:@"好的", nil] show];
//}
//
//- (IBAction)readUnencryptDb2:(id)sender {
//    DbService *dbService = [[DbService alloc] initWithPath:dbPath2 encrypt:NO];
//    NSInteger count = [dbService rowCount:@"People"];
//    [[[UIAlertView alloc] initWithTitle:nil
//                                message:[NSString stringWithFormat:@"读取出%ld个人", count]
//                               delegate:nil
//                      cancelButtonTitle:nil
//                      otherButtonTitles:@"好的", nil] show];
//    
//    [dbService executeQuery:@"select * from People"
//       withArgumentsInArray:nil
//                 modelClass:[PersonModel class]];
//    
//}
//
//- (IBAction)changeDb1EncryptKey:(id)sender {
//    [FMEncryptHelper changeKey:dbPath1 originKey:originKey newKey:newKey];
//    [[[UIAlertView alloc] initWithTitle:nil
//                                message:@"改密成功"
//                               delegate:nil
//                      cancelButtonTitle:nil
//                      otherButtonTitles:@"好的", nil] show];
//}
//
//- (IBAction)readEncryptDb1WithNewKey:(id)sender {
//    [FMEncryptDatabase setEncryptKey:newKey];
//    DbService *dbService = [[DbService alloc] initWithPath:dbPath1 encrypt:YES];
//    NSInteger count = [dbService rowCount:@"People"];
//    [[[UIAlertView alloc] initWithTitle:nil
//                                message:[NSString stringWithFormat:@"读取出%ld个人", count]
//                               delegate:nil
//                      cancelButtonTitle:nil
//                      otherButtonTitles:@"好的", nil] show];
//}
//
//- (IBAction)deleteDb:(id)sender {
//    NSError *error;
//    [[NSFileManager defaultManager] removeItemAtPath:dbPath1 error:&error];
//    [[NSFileManager defaultManager] removeItemAtPath:dbPath2 error:&error];
//    
//    if (error) {
//        [[[UIAlertView alloc] initWithTitle:nil
//                                    message:[NSString stringWithFormat:@"删除失败：%@", error]
//                                   delegate:nil
//                          cancelButtonTitle:nil
//                          otherButtonTitles:@"好的", nil] show];
//        
//    } else {
//        [[[UIAlertView alloc] initWithTitle:nil
//                                    message:[NSString stringWithFormat:@"删除成功"]
//                                   delegate:nil
//                          cancelButtonTitle:nil
//                          otherButtonTitles:@"好的", nil] show];
//    }
//}
//
//#pragma mark - Private Method
//- (BOOL)createTable:(DbService *)service {
//    NSString *sql = @"CREATE TABLE if not exists People (                     \
//    id INTEGER PRIMARY KEY AUTOINCREMENT,   \
//    str1 TEXT,                              \
//    str2 TEXT,                              \
//    float1 REAL,                            \
//    double1 INTEGER,                        \
//    short1 REAL,                            \
//    long1 REAL,                             \
//    date1 TEXT,                             \
//    bool1 INTEGER,                          \
//    data1 BLOB                              \
//    )";
//    return [service executeUpdate:sql param:nil];
//}
//
//- (void)insertPeople:(DbService *)service {
//    NSString *sql =
//    @"insert into People(str1, str2, float1, double1, short1, long1, date1, bool1, data1) values(?,?,?,?,?,?,?,?,?)";
//    
//    NSString *text = @"dataValue";
//    NSData *data = [text dataUsingEncoding:NSUTF8StringEncoding];
//    
//    NSArray *param = @[@"bomo", @"male", @70, @175l, @22, @(arc4random() % 999), [NSDate date], @NO, data];
//    
//    for (int i = 0; i < 100; i++) {
//        [service executeUpdate:sql param:param];
//    }
//}

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
