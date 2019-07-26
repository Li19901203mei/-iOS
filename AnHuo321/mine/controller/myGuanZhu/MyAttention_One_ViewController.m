//
//  MyAttention_One_ViewController.m
//  AnHuo321
//
//  Created by 吕书涛 on 2019/4/7.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import "MyAttention_One_ViewController.h"
#import "MyJiaoTableViewCell.h"
#import "HomeDetailsViewController.h"
#import "GuanModel.h"
@interface MyAttention_One_ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * jiaoTableView;
@property(nonatomic,strong)NSMutableArray * dataArr;
@property(nonatomic,assign)int page;
@end

@implementation MyAttention_One_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.page=1;
    self.title = @"关注的交易";
    self.view.backgroundColor = COLOR;
    self.jiaoTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-NavHeight-kSafeAreaBottomHeight) style:UITableViewStyleGrouped];
    self.jiaoTableView.backgroundColor =COLOR;
    [self.jiaoTableView registerClass:[MyJiaoTableViewCell class] forCellReuseIdentifier:@"MyJiaoTableViewCell"];
    self.jiaoTableView.delegate = self;
    self.jiaoTableView.dataSource =self;
    [self.view addSubview:self.jiaoTableView];
    LRWeakSelf(self);
    self.jiaoTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.page = 1;
        [weakSelf loadDataGuanZhu:YES];
    }];
    self.jiaoTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        weakSelf.page += 1;
        [weakSelf loadDataGuanZhu:NO];
    }];
    [self.jiaoTableView.mj_header beginRefreshing];
}
-(void)loadDataGuanZhu:(BOOL)isYes{
    NSDictionary * guanDic= @{@"page":[NSString stringWithFormat:@"%d",self.page],@"rows":@"12"};
    [HttpTool post:KURLNSString(gzJiaoYiList) dic:guanDic success:^(id  _Nonnull responce) {
        if ([responce[@"result"] integerValue]==1) {
            if (isYes==YES) {
                self.dataArr = [GuanModel mj_objectArrayWithKeyValuesArray:responce[@"data"]];
            }else{
                [self.dataArr addObjectsFromArray:[GuanModel mj_objectArrayWithKeyValuesArray:responce[@"data"]]];
            }
        }else{
            [SVProgressHUD showWithStatus:[NSString stringWithFormat:@"%@",responce[@"data"]]];
            [self.jiaoTableView.mj_footer setHidden:YES];
        }
        [SVProgressHUD dismissWithDelay:1];
        [self.jiaoTableView.mj_footer endRefreshing];
        [self.jiaoTableView.mj_header endRefreshing];
        [self.jiaoTableView reloadData];
    } faile:^(NSError * _Nonnull erroe) {
        
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyJiaoTableViewCell * cell= [tableView dequeueReusableCellWithIdentifier:@"MyJiaoTableViewCell"];
//    cell.backgroundColor = BassColor(12, 37, 54);
    GuanModel * model =self.dataArr[indexPath.section];
    [cell chuanZhiModel:model];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
   // [cell chuanOrderModel:model];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return height(150);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return height(50);
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * heardView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, height(60))];
    UIButton * chaBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    chaBtn.titleLabel.font = VPFont(15);
    [chaBtn setTitle:@"查看全部" forState:0];
    [chaBtn setTitleColor:BassColor(102, 102, 102)
                 forState:0];
    [chaBtn addTarget:self action:@selector(chaKanAll:) forControlEvents:UIControlEventTouchUpInside];
    [heardView addSubview:chaBtn];
    [chaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(heardView.mas_right).offset(-width(20));
        make.centerY.mas_equalTo(heardView.mas_centerY);
        make.width.mas_equalTo(width(80));
        make.height.mas_equalTo(height(18));
    }];
    heardView.backgroundColor =BassColor(241,241, 241);;//BassColor(10, 30, 45);
    return heardView;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.0001)];
    footView.backgroundColor = BassColor(10, 30, 45);;
    return footView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    HomeModel *model = [self.dataArray objectAtIndex:indexPath.row];
    HomeDetailsViewController *goods = [[HomeDetailsViewController alloc]init];
    goods.title = @"详情";
    //goods.idString = model.productId;
    [self.navigationController pushViewController:goods animated:YES];
}
//查看全部
-(void)chaKanAll:(UIButton*)btn{
    
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
