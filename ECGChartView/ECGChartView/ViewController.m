//
//  ViewController.m
//  ECGChartView
//
//  Created by HOrange on 2021/6/3.
//

#import "ViewController.h"
#import "ECGReportViewController.h"
#import "RealTimeViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController{
    NSArray *_arr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"HealthChartView";
    _arr = @[@"心电图报告",@"实时心电图-单条轨迹",@"实时心电图-双轨迹"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.rowHeight = 60;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arr.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = _arr[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *title = _arr[indexPath.row];
    //    _arr = @[@"心电图报告",@"实时心电图-单条轨迹",@"实时心电图-双轨迹"];

    if ([title isEqualToString:@"心电图报告"]) {
        [self.navigationController pushViewController:[ECGReportViewController new] animated:YES];
        return;
    }
    if ([title isEqualToString:@"实时心电图-单条轨迹"]) {
        RealTimeViewController *real = [RealTimeViewController new];
        real.isOnly = NO;
        [self.navigationController pushViewController:real animated:YES];
        return;
    }
    
    if ([title isEqualToString:@"实时心电图-双轨迹"]) {
        RealTimeViewController *real = [RealTimeViewController new];
        real.isOnly = YES;
        [self.navigationController pushViewController:real animated:YES];
        return;
    }
}

@end
