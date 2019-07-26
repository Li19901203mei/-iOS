//
//  MyJiaoYi_One_ViewController.m
//  AnHuo321
//
//  Created by 吕书涛 on 2019/4/7.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import "MyJiaoYi_One_ViewController.h"
#import "JiaoYiTableViewCell.h"
#import "GuanModel.h"
#import "HomeDetailsViewController.h"
@interface MyJiaoYi_One_ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * jiaTableView;
@property(nonatomic,strong)NSMutableArray * dataArr;
@property(nonatomic,assign)int page;
@end

@implementation MyJiaoYi_One_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.page=1;
    self.view.backgroundColor = COLOR;
    // Do any additional setup after
    self.jiaTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-NavHeight-kSafeAreaBottomHeight) style:UITableViewStyleGrouped];
    self.jiaTableView.backgroundColor =COLOR;
    [self.jiaTableView registerClass:[JiaoYiTableViewCell class] forCellReuseIdentifier:@"JiaoYiTableViewCell"];
    self.jiaTableView.delegate = self;
    self.jiaTableView.dataSource =self;
    [self.view addSubview:self.jiaTableView];
    // Do any additional setup after loading the view.
    LRWeakSelf(self);
    self.jiaTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.page = 1;
        [weakSelf loadDataYiBaoJia:YES];
    }];
    self.jiaTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        weakSelf.page += 1;
        [weakSelf loadDataYiBaoJia:NO];
    }];
    [self.jiaTableView.mj_header beginRefreshing];
}
-(void)loadDataYiBaoJia:(BOOL)isYes{
    NSDictionary * jiaDic= @{@"p":[NSString stringWithFormat:@"%d",self.page],@"userid":[NSString stringWithFormat:@"%@",[GlobleStting getuserId]],@"type":@"pm"};
    [HttpTool post:KURLNSString(YiBaoJia) dic:jiaDic success:^(id  _Nonnull responce) {
//        if ([responce[@"result"] integerValue]==1) {
            if (isYes==YES) {
                self.dataArr = [GuanModel mj_objectArrayWithKeyValuesArray:responce[@"alist"]];
            }else{
                [self.dataArr addObjectsFromArray:[GuanModel mj_objectArrayWithKeyValuesArray:responce[@"alist"]]];
            }
//        }else{
//            [SVProgressHUD showWithStatus:[NSString stringWithFormat:@"%@",responce[@"data"]]];
//            [self.jiaTableView.mj_footer setHidden:YES];
//        }
        [SVProgressHUD dismissWithDelay:1];
        [self.jiaTableView.mj_footer endRefreshing];
        [self.jiaTableView.mj_header endRefreshing];
        [self.jiaTableView reloadData];
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
    JiaoYiTableViewCell * cell= [tableView dequeueReusableCellWithIdentifier:@"JiaoYiTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    GuanModel * model =self.dataArr[indexPath.row];
     [cell chuanZhiGuanModel:model];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return height(90);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * heardView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.0001)];
    
    heardView.backgroundColor =BassColor(12, 37, 54);;//BassColor(10, 30, 45);
    return heardView;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
    footView.backgroundColor = BassColor(10, 30, 45);;
    return footView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GuanModel *model = [self.dataArr objectAtIndex:indexPath.row];
    HomeDetailsViewController *goods = [[HomeDetailsViewController alloc]init];
    goods.title = @"详情";
    goods.idString = model.pid;
    [self.navigationController pushViewController:goods animated:YES];
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
