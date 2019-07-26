//
//  MyAttention_Two_ViewController.m
//  AnHuo321
//
//  Created by 吕书涛 on 2019/4/7.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import "MyAttention_Two_ViewController.h"
#import "FocusUserTableViewCell.h"
#import "PublisherDetailsViewController.h"
#import "GuanModel.h"
@interface MyAttention_Two_ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * focusTableView;
@property(nonatomic,strong)NSMutableArray * dataArr;
@property(nonatomic,assign)int page;
@end

@implementation MyAttention_Two_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.page=1;
    self.view.backgroundColor = COLOR;
    // Do any additional setup after
    self.focusTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-NavHeight-kSafeAreaBottomHeight) style:UITableViewStyleGrouped];
    self.focusTableView.backgroundColor =COLOR;
    [self.focusTableView registerClass:[FocusUserTableViewCell class] forCellReuseIdentifier:@"FocusUserTableViewCell"];
    self.focusTableView.delegate = self;
    self.focusTableView.dataSource =self;
    [self.view addSubview:self.focusTableView];
    // Do any additional setup after loading the view.
    LRWeakSelf(self);
    self.focusTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.page = 1;
        [weakSelf loadDataGuanZhuFocus:YES];
    }];
    self.focusTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        weakSelf.page += 1;
        [weakSelf loadDataGuanZhuFocus:NO];
    }];
    [self.focusTableView.mj_header beginRefreshing];
}
-(void)loadDataGuanZhuFocus:(BOOL)isYes{
    NSDictionary * guanDic= @{@"page":[NSString stringWithFormat:@"%d",self.page],@"rows":@"12"};
    [HttpTool post:KURLNSString(gzYongHu) dic:guanDic success:^(id  _Nonnull responce) {
        if ([responce[@"result"] integerValue]==1) {
            if (isYes==YES) {
                self.dataArr = [GuanModel mj_objectArrayWithKeyValuesArray:responce[@"data"]];
            }else{
                [self.dataArr addObjectsFromArray:[GuanModel mj_objectArrayWithKeyValuesArray:responce[@"data"]]];
            }
        }else{
            [SVProgressHUD showWithStatus:[NSString stringWithFormat:@"%@",responce[@"data"]]];
            [self.focusTableView.mj_footer setHidden:YES];
        }
        [SVProgressHUD dismissWithDelay:1];
        [self.focusTableView.mj_footer endRefreshing];
        [self.focusTableView.mj_header endRefreshing];
        [self.focusTableView reloadData];
    } faile:^(NSError * _Nonnull erroe) {
        
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FocusUserTableViewCell * cell= [tableView dequeueReusableCellWithIdentifier:@"FocusUserTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    GuanModel * fouscModel =self.dataArr[indexPath.row];
    
    [cell chuanZhiFocusUser:fouscModel];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return height(110);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * heardView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.0001)];
    
    heardView.backgroundColor =BassColor(12, 37, 54);;//BassColor(10, 30, 45);
    return heardView;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.0001)];
    footView.backgroundColor = BassColor(10, 30, 45);;
    return footView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PublisherDetailsViewController * pubVC = [[PublisherDetailsViewController alloc]init];
    pubVC.title = @"用户详情";
    [self.navigationController pushViewController:pubVC animated:YES];
}

@end
