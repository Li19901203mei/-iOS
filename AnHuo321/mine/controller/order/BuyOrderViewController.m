//
//  BuyOrderViewController.m
//  AnHuo321
//
//  Created by 吕书涛 on 2019/4/7.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import "BuyOrderViewController.h"
#import "OrderCell.h"
#import "OrderModel.h"
#import "SendGoodsVC.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "UIView+Border.h"
#import "CancleOrderVC.h"
#import "BuyOrderDetailVC.h"
#import "EvaluationVC.h"
#import "CommonWebVC.h"
@interface BuyOrderViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,assign)NSInteger page;
@end

@implementation BuyOrderViewController
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
    if (self.status != nil) {
        [dicM setObject:self.status forKey:@"st"];
    }
    if (self.type) {
        [dicM setObject:@"1" forKey:@"my"];
    }
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
    if (self.type) {//卖家
        cell.BtnHeight.constant = 38;
        if ([model.status isEqualToString:@"0"]) {//待付款
            [cell.oneBtn setTitle:@"立即付款" forState:UIControlStateNormal];
            [cell.oneBtn boredWidth:1 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
            [[[cell.oneBtn rac_signalForControlEvents:UIControlEventTouchUpInside]takeUntil:cell.rac_prepareForReuseSignal]subscribeNext:^(__kindof UIControl * _Nullable x) {
               
            }];
            [cell.twoBtn setTitle:@"" forState:UIControlStateNormal];
            [cell.threeBtn setTitle:@"" forState:UIControlStateNormal];
            [cell.twoBtn boredWidth:0 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
            [cell.threeBtn boredWidth:0 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
        }else if ([model.status isEqualToString:@"1"]) {//发货
            [cell.oneBtn setTitle:@"发货" forState:UIControlStateNormal];
            [cell.oneBtn boredWidth:1 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
            [[[cell.oneBtn rac_signalForControlEvents:UIControlEventTouchUpInside]takeUntil:cell.rac_prepareForReuseSignal]subscribeNext:^(__kindof UIControl * _Nullable x) {
                SendGoodsVC *vc = [SendGoodsVC new];
                vc.orderId = model.order_no;
                [self.navigationController pushViewController:vc animated:YES];
            }];
            [cell.twoBtn setTitle:@"" forState:UIControlStateNormal];
            [cell.threeBtn setTitle:@"" forState:UIControlStateNormal];
            [cell.twoBtn boredWidth:0 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
            [cell.threeBtn boredWidth:0 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
        }else if ([model.status isEqualToString:@"2"]) {//待收货
            [cell.oneBtn setTitle:@"快递查询" forState:UIControlStateNormal];
            [cell.oneBtn boredWidth:1 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
            [[[cell.oneBtn rac_signalForControlEvents:UIControlEventTouchUpInside]takeUntil:cell.rac_prepareForReuseSignal]subscribeNext:^(__kindof UIControl * _Nullable x) {
                CommonWebVC *vc = [CommonWebVC new];
                vc.order_no = model.order_no;
                [self.navigationController pushViewController:vc animated:YES];
            }];
            [cell.twoBtn setTitle:@"" forState:UIControlStateNormal];
            [cell.threeBtn setTitle:@"" forState:UIControlStateNormal];
            [cell.twoBtn boredWidth:0 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
            [cell.threeBtn boredWidth:0 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
        }else if ([model.status isEqualToString:@"3"]) {//交易成功
            [cell.oneBtn setTitle:@"立即评价" forState:UIControlStateNormal];
            [cell.oneBtn boredWidth:1 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
            [[[cell.oneBtn rac_signalForControlEvents:UIControlEventTouchUpInside]takeUntil:cell.rac_prepareForReuseSignal]subscribeNext:^(__kindof UIControl * _Nullable x) {
                EvaluationVC *vc = [EvaluationVC new];
                vc.model = model;
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }];
            [cell.twoBtn setTitle:@"" forState:UIControlStateNormal];
            [cell.twoBtn boredWidth:0 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
            [cell.threeBtn setTitle:@"" forState:UIControlStateNormal];
            [cell.threeBtn boredWidth:0 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
        }else if ([model.status isEqualToString:@"5"]) {//已评价
            [cell.oneBtn setTitle:@"我的评价" forState:UIControlStateNormal];
            [cell.oneBtn boredWidth:1 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
            [[[cell.oneBtn rac_signalForControlEvents:UIControlEventTouchUpInside]takeUntil:cell.rac_prepareForReuseSignal]subscribeNext:^(__kindof UIControl * _Nullable x) {
                EvaluationVC *vc = [EvaluationVC new];
                vc.model = model;
                vc.isSeeEvalution = YES;
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }];
            [cell.twoBtn setTitle:@"" forState:UIControlStateNormal];
            [cell.twoBtn boredWidth:0 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
            [cell.threeBtn setTitle:@"" forState:UIControlStateNormal];
            [cell.threeBtn boredWidth:0 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
        }else if ([model.status isEqualToString:@"11"]) {//已互评
            [cell.oneBtn setTitle:@"我的评价" forState:UIControlStateNormal];
            [cell.oneBtn boredWidth:1 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
            [[[cell.oneBtn rac_signalForControlEvents:UIControlEventTouchUpInside]takeUntil:cell.rac_prepareForReuseSignal]subscribeNext:^(__kindof UIControl * _Nullable x) {
                EvaluationVC *vc = [EvaluationVC new];
                vc.model = model;
                vc.isSeeEvalution = YES;
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }];
            [cell.twoBtn setTitle:@"卖家的评价" forState:UIControlStateNormal];
            [cell.twoBtn boredWidth:1 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
            [[[cell.twoBtn rac_signalForControlEvents:UIControlEventTouchUpInside]takeUntil:cell.rac_prepareForReuseSignal]subscribeNext:^(__kindof UIControl * _Nullable x) {
                EvaluationVC *vc = [EvaluationVC new];
                vc.model = model;
                vc.isSeeEvalution = YES;
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }];
            [cell.threeBtn setTitle:@"" forState:UIControlStateNormal];
            [cell.threeBtn boredWidth:0 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
        }
        return cell;
    }else{//买家
        if ([model.status isEqualToString:@"0"]) {//待付款
            [cell.oneBtn setTitle:@"付款" forState:UIControlStateNormal];
            [cell.oneBtn boredWidth:1 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
            [[[cell.oneBtn rac_signalForControlEvents:UIControlEventTouchUpInside]takeUntil:cell.rac_prepareForReuseSignal]subscribeNext:^(__kindof UIControl * _Nullable x) {
               
            }];
            [cell.twoBtn setTitle:@"取消订单" forState:UIControlStateNormal];
            [[[cell.twoBtn rac_signalForControlEvents:UIControlEventTouchUpInside]takeUntil:cell.rac_prepareForReuseSignal]subscribeNext:^(__kindof UIControl * _Nullable x) {
                CancleOrderVC *vc = [CancleOrderVC new];
                vc.order_no = model.order_no;
                [self.navigationController pushViewController:vc animated:YES];
            }];
            [cell.threeBtn setTitle:@"" forState:UIControlStateNormal];
            [cell.twoBtn boredWidth:1 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
            [cell.threeBtn boredWidth:0 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
        }else if ([model.status isEqualToString:@"1"]) {//待发货
            [cell.oneBtn setTitle:@"取消订单" forState:UIControlStateNormal];
            [cell.oneBtn boredWidth:1 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
            [[[cell.oneBtn rac_signalForControlEvents:UIControlEventTouchUpInside]takeUntil:cell.rac_prepareForReuseSignal]subscribeNext:^(__kindof UIControl * _Nullable x) {
                BuyOrderDetailVC *vc = [BuyOrderDetailVC new];
                vc.order_no = model.order_no;
                vc.status = model.status;
                [self.navigationController pushViewController:vc animated:YES];
            }];
            [cell.twoBtn setTitle:@"催货" forState:UIControlStateNormal];
            [[[cell.twoBtn rac_signalForControlEvents:UIControlEventTouchUpInside]takeUntil:cell.rac_prepareForReuseSignal]subscribeNext:^(__kindof UIControl * _Nullable x) {
                BuyOrderDetailVC *vc = [BuyOrderDetailVC new];
                vc.order_no = model.order_no;
                vc.status = model.status;
                [self.navigationController pushViewController:vc animated:YES];
            }];
            [cell.threeBtn setTitle:@"" forState:UIControlStateNormal];
            [cell.twoBtn boredWidth:1 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
            [cell.threeBtn boredWidth:0 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
        }else if ([model.status isEqualToString:@"2"]) {//待收货
            [cell.oneBtn setTitle:@"确认收货" forState:UIControlStateNormal];
            [cell.oneBtn boredWidth:1 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
            [[[cell.oneBtn rac_signalForControlEvents:UIControlEventTouchUpInside]takeUntil:cell.rac_prepareForReuseSignal]subscribeNext:^(__kindof UIControl * _Nullable x) {
                BuyOrderDetailVC *vc = [BuyOrderDetailVC new];
                vc.order_no = model.order_no;
                vc.status = model.status;
                [self.navigationController pushViewController:vc animated:YES];
            }];
            [cell.twoBtn setTitle:@"快递查询" forState:UIControlStateNormal];
            [[[cell.twoBtn rac_signalForControlEvents:UIControlEventTouchUpInside]takeUntil:cell.rac_prepareForReuseSignal]subscribeNext:^(__kindof UIControl * _Nullable x) {
                CommonWebVC *vc = [CommonWebVC new];
                vc.order_no = model.order_no;
                [self.navigationController pushViewController:vc animated:YES];
            }];
            [cell.threeBtn setTitle:@"" forState:UIControlStateNormal];
            [cell.twoBtn boredWidth:1 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
            [cell.threeBtn boredWidth:0 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
        }else if ([model.status isEqualToString:@"3"]) {//交易成功
            [cell.oneBtn setTitle:@"立即评价" forState:UIControlStateNormal];
            [cell.oneBtn boredWidth:1 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
            [[[cell.oneBtn rac_signalForControlEvents:UIControlEventTouchUpInside]takeUntil:cell.rac_prepareForReuseSignal]subscribeNext:^(__kindof UIControl * _Nullable x) {
                EvaluationVC *vc = [EvaluationVC new];
                vc.model = model;
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }];
            [cell.twoBtn setTitle:@"" forState:UIControlStateNormal];
            [cell.twoBtn boredWidth:0 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
            [cell.threeBtn setTitle:@"" forState:UIControlStateNormal];
            [cell.threeBtn boredWidth:0 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
        }else if ([model.status isEqualToString:@"5"]) {//已评价
            [cell.oneBtn setTitle:@"我的评价" forState:UIControlStateNormal];
            [cell.oneBtn boredWidth:1 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
            [[[cell.oneBtn rac_signalForControlEvents:UIControlEventTouchUpInside]takeUntil:cell.rac_prepareForReuseSignal]subscribeNext:^(__kindof UIControl * _Nullable x) {
                EvaluationVC *vc = [EvaluationVC new];
                vc.model = model;
                vc.isSeeEvalution = YES;
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }];
            [cell.twoBtn setTitle:@"" forState:UIControlStateNormal];
            [cell.twoBtn boredWidth:0 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
            [cell.threeBtn setTitle:@"" forState:UIControlStateNormal];
            [cell.threeBtn boredWidth:0 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
        }else if ([model.status isEqualToString:@"11"]) {//已互评
            [cell.oneBtn setTitle:@"我的评价" forState:UIControlStateNormal];
            [cell.oneBtn boredWidth:1 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
            [[[cell.oneBtn rac_signalForControlEvents:UIControlEventTouchUpInside]takeUntil:cell.rac_prepareForReuseSignal]subscribeNext:^(__kindof UIControl * _Nullable x) {
                EvaluationVC *vc = [EvaluationVC new];
                vc.model = model;
                vc.isSeeEvalution = YES;
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }];
            [cell.twoBtn setTitle:@"卖家的评价" forState:UIControlStateNormal];
            [cell.twoBtn boredWidth:1 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
            [[[cell.twoBtn rac_signalForControlEvents:UIControlEventTouchUpInside]takeUntil:cell.rac_prepareForReuseSignal]subscribeNext:^(__kindof UIControl * _Nullable x) {
                EvaluationVC *vc = [EvaluationVC new];
                vc.model = model;
                vc.isSeeEvalution = YES;
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }];
            [cell.threeBtn setTitle:@"" forState:UIControlStateNormal];
            [cell.threeBtn boredWidth:0 boredColor:RGBACOLOR(188, 46, 52, 1) borderRadio:8];
        }
        
    }
    return cell;
}
@end
