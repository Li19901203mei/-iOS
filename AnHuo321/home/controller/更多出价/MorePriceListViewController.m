//
//  MorePriceListViewController.m
//  AnHuo321
//
//  Created by 吕书涛 on 2019/4/7.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import "MorePriceListViewController.h"
#import "MorePriceListCell.h"

@interface MorePriceListViewController ()<UITableViewDelegate,UITableViewDataSource>
kPropertyStrong(UITableView, tableview);
kPropertyStrong(NSMutableArray, dataArray);
@end

@implementation MorePriceListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self setHeaderView];
    
    [self.view addSubview:self.tableview];
    // Do any additional setup after loading the view.
}

- (void)setHeaderView{
    NSArray *arr = @[@"报价人",@"单价",@"数量",@"电话",@"成交"];
    for (int i=0; i<5; i++) {
        UILabel *lab = [AHControll createLabelWithFrame:CGRectMake(SCREEN_WIDTH/5*i, kNavBarHAbove7, SCREEN_WIDTH/5, 50) Font:15 Text:arr[i] textColor:UIColor.blackColor NSTextAlignment:NSTextAlignmentCenter];
        lab.backgroundColor = UIColor.whiteColor;
        [self.view addSubview:lab];
    }
}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MorePriceListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    return cell;
}
- (UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 50+kNavBarHAbove7, SCREEN_WIDTH, SCREEN_HEIGHT-50-kNavBarHAbove7)];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.backgroundColor = COLOR;
        [_tableview registerNib:[UINib nibWithNibName:@"MorePriceListCell" bundle:nil] forCellReuseIdentifier:@"cell"];
        _tableview.rowHeight = 60;
        _tableview.tableFooterView = [AHControll viewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, .001) viewColor:COLOR];
    }
    return _tableview;
}
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _dataArray;
}
@end
