//
//  SortAddress.m
//  LWFrameWorkTest
//
//  Created by 李伟 on 16/8/26.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import "SortAddress.h"

@interface SortAddress () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableAddress;
@property (nonatomic, strong) NSArray *arrayOfCharacters;
@end

@implementation SortAddress
- (NSArray *)arrayOfCharacters {

    if (!_arrayOfCharacters) {
        _arrayOfCharacters = [NSArray array];
    }
    return _arrayOfCharacters;
}
- (UITableView *)tableAddress {

    if (!_tableAddress) {
        _tableAddress = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                                                     style:UITableViewStylePlain];
        _tableAddress.delegate = self;
        _tableAddress.dataSource = self;
        _tableAddress.sectionHeaderHeight = 25;
        _tableAddress.sectionFooterHeight = 0.01;
    }
    return _tableAddress;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 25.0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 0.01;
}
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {

    NSMutableArray *toBeReturned = [[NSMutableArray alloc] init];

    for (char c = 'A'; c <= 'Z'; c++)

        [toBeReturned addObject:[NSString stringWithFormat:@"%c", c]];

    return toBeReturned;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {

    NSInteger count = 0;

    for (NSString *character in self.arrayOfCharacters)

    {

        if ([character isEqualToString:title])

        {
            NSLog(@"count%ld",(long)count);
            return count;
        }
        NSLog(@"+++++++===");
        count++;
    }

    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 26;
}
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//
//    if ([self.arrayOfCharacters count] == 0) {
//        return @"";
//    } else {
//
//        return [self.arrayOfCharacters objectAtIndex:[tableView]];
//    }
//}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UILabel *sectionTitle = [[UILabel alloc]initWithFrame:CGRectMake(90, 0, 100, 20)];
  sectionTitle.text =self.arrayOfCharacters[section];
    return sectionTitle;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }

    cell.textLabel.text = @"222";
    return cell;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayOfCharacters = @[
        @"A",
        @"B",
        @"C",
        @"D",
        @"E",
        @"F",
        @"G",
        @"H",
        @"I",
        @"J",
        @"K",
        @"L",
        @"M",
        @"N",
        @"O",
        @"P",
        @"Q",
        @"R",
        @"S",
        @"T",
        @"U",
        @"V",
        @"W",
        @"X",
        @"Y",
        @"Z"
    ];
    [self.view addSubview:self.tableAddress];
    // Do any additional setup after loading the view.
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
