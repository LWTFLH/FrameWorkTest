//
//  ChartController.m
//  LWFrameWorkTest
//
//  Created by 李伟 on 16/8/10.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import "ChartController.h"
#import <PNChart/PNChart.h>
@interface ChartController ()<PNChartDelegate>
@property (nonatomic, strong) PNLineChart *chart;
@property (nonatomic, strong) PNBarChart *bar;
@property (nonatomic, strong) PNCircleChart *circleChart;
@property (nonatomic, strong) PNPieChart *pieChart;
@property (nonatomic, strong) PNRadarChart *radarChart;
@end

@implementation ChartController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // [self initChart];

    //[self barChart];
    // [self circle];

     [self pieChartUI];

   // [self radio];
}
- (void)initChart {

    self.chart = [[PNLineChart alloc] initWithFrame:CGRectMake(10, 90, self.view.frame.size.width - 20, 300)];
    self.chart.yLabelFormat = @"%.2f";
    self.chart.backgroundColor = [UIColor clearColor];
    [self.chart setXLabels:@[@"1", @"2", @"3", @"4", @"5", @"6", @"7"]];
    self.chart.showCoordinateAxis = YES;
    self.chart.yFixedValueMax = 300.0;
    self.chart.yFixedValueMin = 0.0;

    [self.chart setYLabels:@[
        @"0 min",
        @"50 min",
        @"100 min",
        @"150 min",
        @"200 min",
        @"250 min",
        @"300 min",
    ]];

    NSArray *data01Array = @[@60.1, @160.1, @126.4, @0.0, @186.2, @127.2, @176.2];
    PNLineChartData *data01 = [PNLineChartData new];
    data01.dataTitle = @"Alpha";
    data01.color = PNFreshGreen;
    data01.alpha = 0.3f;
    data01.itemCount = data01Array.count;
    data01.inflexionPointColor = PNRed;
    data01.inflexionPointStyle = PNLineChartPointStyleTriangle;
    data01.getData = ^(NSUInteger index) {
        CGFloat yValue = [data01Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };

    NSArray *data02Array = @[@0.0, @180.1, @26.4, @202.2, @126.2, @167.2, @276.2];
    PNLineChartData *data02 = [PNLineChartData new];
    data02.dataTitle = @"Beta";
    data02.color = PNTwitterColor;
    data02.alpha = 0.5f;
    data02.itemCount = data02Array.count;
    data02.inflexionPointStyle = PNLineChartPointStyleCircle;
    data02.getData = ^(NSUInteger index) {
        CGFloat yValue = [data02Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };

    self.chart.chartData = @[data01, data02];

    [self.chart strokeChart];
    [self.view addSubview:self.chart];

    UIView *legend = [self.chart getLegendWithMaxWidth:320];
    [legend setFrame:CGRectMake(30, 380, legend.frame.size.width, legend.frame.size.width)];
    [self.view addSubview:legend];
}

- (void)barChart {

    static NSNumberFormatter *barChartFormatter;
    if (!barChartFormatter) {
        barChartFormatter = [[NSNumberFormatter alloc] init];
        barChartFormatter.numberStyle = NSNumberFormatterCurrencyAccountingStyle;
        barChartFormatter.allowsFloats = NO;
        barChartFormatter.maximumFractionDigits = 0;
    }

    self.bar = [[PNBarChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 200.0)];
    self.bar.showLabel = YES;
    self.bar.backgroundColor = [UIColor clearColor];
    self.bar.yLabelFormatter = ^(CGFloat yValue) {
        return [barChartFormatter stringFromNumber:[NSNumber numberWithFloat:yValue]];
    };

    self.bar.yChartLabelWidth = 20.0;
    self.bar.chartMarginLeft = 30.0;
    self.bar.chartMarginRight = 10.0;
    self.bar.chartMarginTop = 5.0;
    self.bar.chartMarginBottom = 10.0;

    self.bar.labelMarginTop = 5.0;
    self.bar.showChartBorder = YES;
    [self.bar setXLabels:@[@"2", @"3", @"4", @"5", @"2", @"3", @"4", @"5"]];
    //       self.barChart.yLabels = @[@-10,@0,@10];
    //        [self.barChart setYValues:@[@10000.0,@30000.0,@10000.0,@100000.0,@500000.0,@1000000.0,@1150000.0,@2150000.0]];
    [self.bar setYValues:@[@10.82, @1.88, @6.96, @33.93, @10.82, @1.88, @6.96, @33.93]];
    [self.bar setStrokeColors:@[PNGreen, PNGreen, PNRed, PNGreen, PNGreen, PNGreen, PNRed, PNGreen]];
    self.bar.isGradientShow = YES;
    self.bar.isShowNumbers = YES;

    [self.bar strokeChart];

    // self.bar.delegate = self;

    [self.view addSubview:self.bar];
}

- (void)circle {

    self.circleChart =
    [[PNCircleChart alloc] initWithFrame:CGRectMake(0, 150.0, SCREEN_WIDTH, 100.0) total:@100 current:@60 clockwise:YES];

    self.circleChart.backgroundColor = [UIColor clearColor];

    [self.circleChart setStrokeColor:[UIColor clearColor]];
    [self.circleChart setStrokeColorGradientStart:[UIColor blueColor]];
    [self.circleChart strokeChart];

    NSLog(@"%@", self.circleChart.current);
    NSLog(@"%@", self.circleChart.total);
    [self.view addSubview:self.circleChart];
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(step) userInfo:nil repeats:YES];
}
- (void)step {

    NSNumber *temp = self.circleChart.current;

    if ([temp integerValue] != 100) {
        NSInteger stepper = [temp integerValue];
        stepper++;
        self.circleChart.current = [NSNumber numberWithInteger:stepper];
        [self.circleChart strokeChart];

    } else {
    }
}
- (void)pieChartUI {

    NSArray *items = @[
        [PNPieChartDataItem dataItemWithValue:10 color:PNLightGreen description:@"李伟"],
        [PNPieChartDataItem dataItemWithValue:20 color:[UIColor purpleColor] description:@"同方联合"],
        [PNPieChartDataItem dataItemWithValue:40 color:[UIColor cyanColor] description:@"牛犇犇"],
    ];

    self.pieChart = [[PNPieChart alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2.0 - 100, 135, 200.0, 200.0) items:items];
    self.pieChart.descriptionTextColor = [UIColor whiteColor];
    self.pieChart.descriptionTextFont = [UIFont fontWithName:@"Avenir-Medium" size:11.0];
    self.pieChart.descriptionTextShadowColor = [UIColor yellowColor];
    self.pieChart.showAbsoluteValues = NO;
    self.pieChart.showOnlyValues = NO;
    [self.pieChart setDelegate:self];
    self.pieChart.shouldHighlightSectorOnTouch = YES;
    [self.pieChart strokeChart];
    // 测试
    UILabel *total = [[UILabel alloc]
    initWithFrame:CGRectMake((self.pieChart.frame.size.width - 60) / 2, (self.pieChart.frame.size.height - 20) / 2, 60, 20)];
    total.textColor = [UIColor redColor];
    total.textAlignment = NSTextAlignmentCenter;
    total.text = @"$999999";
    [total sizeToFit];
    [self.pieChart addSubview:total];

    self.pieChart.legendStyle = PNLegendItemStyleSerial;
    self.pieChart.legendFont = [UIFont boldSystemFontOfSize:12.0f];

    UIView *legend = [self.pieChart getLegendWithMaxWidth:200];
    [legend setFrame:CGRectMake(130, 350, legend.frame.size.width, legend.frame.size.height)];
    [self.view addSubview:legend];

    [self.view addSubview:self.pieChart];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.pieChart updateChartData:@[
            [PNPieChartDataItem dataItemWithValue:30 color:PNLightGreen description:@"同牛科技"],
            [PNPieChartDataItem dataItemWithValue:40 color:[UIColor purpleColor] description:@"同方联合"],
            [PNPieChartDataItem dataItemWithValue:30 color:[UIColor cyanColor] description:@"同方集团"]
        ]];
        [self.pieChart strokeChart];

        NSLog(@"end");
    });
}

- (void)radio {

    NSArray *items = @[
        [PNRadarChartDataItem dataItemWithValue:3 description:@"同方联合"],
        [PNRadarChartDataItem dataItemWithValue:2 description:@"同牛"],
        [PNRadarChartDataItem dataItemWithValue:8 description:@"牛犇犇"],
        [PNRadarChartDataItem dataItemWithValue:5 description:@"科技公司"],
        [PNRadarChartDataItem dataItemWithValue:4 description:@"哈哈"],
    ];
    self.radarChart = [[PNRadarChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 300.0) items:items valueDivider:1];
    [self.radarChart strokeChart];
    
    self.radarChart.labelStyle = PNRadarChartLabelStyleCircle;
    self.radarChart.isShowGraduation = YES;
    self.radarChart.isLabelTouchable = YES;
    [self.view addSubview:self.radarChart];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma de 

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
