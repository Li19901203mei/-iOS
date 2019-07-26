//
//  SalesReturnVC.m
//  AnHuo321
//
//  Created by 123 on 2019/7/7.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import "SalesReturnVC.h"
#import "OrderCell.h"
#import "OrderModel.h"
#import "SendGoodsVC.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "UIView+Border.h"
#import "CancleOrderVC.h"
#import "BuyOrderDetailVC.h"
@interface SalesReturnVC ()
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,assign)NSInteger page;
@end

@implementation SalesReturnVC
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.table.mj_header beginRefreshing];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.page = 1;
    [self.table registerNib:[UINib nibWithNibName:@"OrderCell" bundle:nil] forCellReuseIdentifier:@"OrderCell"];
    self.table.rowHeight = UITableViewAutomaticDimension;
    self.table.estimatedRowHeight = 150;
    self.table.tableFooterView = [UIView new];
    LRWeakSelf(self);
    self.table.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.page = 1;
        [weakSelf obtainData];
    }];
    self.table.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        weakSelf.page += 1;
        [weakSelf obtainData];
    }];
    
    
}
- (void)obtainData{
    
    NSMutableDictionary *dicM = [NSMutableDictionary dictionary];
    if (self.type) {
        [dicM setObject:@"1" forKey:@"my"];
    }
    [dicM setObject:@"1" forKey:@"qx"];
    [dicM setObject:[GlobleStting getuserId] forKey:@"userid"];
    [dicM setObject:@(self.page) forKey:@"p"];
    [Manager requestGETWithURLStr:KURLNSString(Buy_All_Order_List) paramDic:dicM finish:^(id  _Nonnull dict) {
        [self.table.mj_footer endRefreshing];
        [self.table.mj_header endRefreshing];
        NSLog(@"---------%@",dict);
        if (self.page == 1) {
            self.dataArray = [OrderModel mj_objectArrayWithKeyValuesArray:dict[@"alist"]];
        }else{
            [self.dataArray addObjectsFromArray:[OrderModel mj_objectArrayWithKeyValuesArray:dict[@"alist"]]];
        }
        [self.table reloadData];
    } enError:^(NSError * _Nonnull error) {
        
    }];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    OrderModel *model = self.dataArray[indexPath.row];
    cell.model = model;
    cell.BtnHeight.constant = 0;
    if (self.type) {//卖家
        [cell.oneBtn setTitle:@"" forState:UIControlStateNormal];
        [cell.oneBtn boredWidth:0 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
        [cell.twoBtn setTitle:@"" forState:UIControlStateNormal];
        [cell.twoBtn boredWidth:0 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
        [cell.threeBtn setTitle:@"" forState:UIControlStateNormal];
        [cell.threeBtn boredWidth:0 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
    }else{//买家
            [cell.oneBtn setTitle:@"" forState:UIControlStateNormal];
            [cell.oneBtn boredWidth:0 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
            [cell.twoBtn setTitle:@"" forState:UIControlStateNormal];
            [cell.twoBtn boredWidth:0 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
            [cell.threeBtn setTitle:@"" forState:UIControlStateNormal];
            [cell.threeBtn boredWidth:0 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
    }
    return cell;
}
@end
