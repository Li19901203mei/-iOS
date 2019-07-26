//
//  MyJiaoYi_Two_ViewController.m
//  AnHuo321
//
//  Created by 吕书涛 on 2019/4/7.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import "MyJiaoYi_Two_ViewController.h"
#import "JiaoYiFaTableViewCell.h"
#import "IssueViewController.h"
#import "GuanModel.h"
@interface MyJiaoYi_Two_ViewController ()
<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * faTableView;
@property(nonatomic,strong)NSMutableArray * dataArr;
@property(nonatomic,assign)int page;
@end

@implementation MyJiaoYi_Two_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR;
    // Do any additional setup after
    self.faTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-NavHeight-kSafeAreaBottomHeight) style:UITableViewStyleGrouped];
    self.faTableView.backgroundColor =COLOR;
    [self.faTableView registerClass:[JiaoYiFaTableViewCell class] forCellReuseIdentifier:@"JiaoYiFaTableViewCell"];
    self.faTableView.delegate = self;
    self.faTableView.dataSource =self;
    [self.view addSubview:self.faTableView];
    self.page=1;
    LRWeakSelf(self);
    self.faTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.page = 1;
        [weakSelf loadDataMineFa:YES];
    }];
    self.faTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        weakSelf.page += 1;
        [weakSelf loadDataMineFa:NO];
    }];
    [self.faTableView.mj_header beginRefreshing];
    // Do any additional setup after loading the view.
}
-(void)loadDataMineFa:(BOOL)isYes{
    NSDictionary * jiaDic= @{@"p":[NSString stringWithFormat:@"%d",self.page],@"userid":[NSString stringWithFormat:@"%@",[GlobleStting getuserId]],@"type":@"biding"};
    [HttpTool post:KURLNSString(MineFaBu) dic:jiaDic success:^(id  _Nonnull responce) {
      //  if ([responce[@"result"] integerValue]==1) {
            if (isYes==YES) {
                self.dataArr = [GuanModel mj_objectArrayWithKeyValuesArray:responce[@"alist"]];
            }else{
                [self.dataArr addObjectsFromArray:[GuanModel mj_objectArrayWithKeyValuesArray:responce[@"alist"]]];
            }
//        }else{
//            [SVProgressHUD showWithStatus:[NSString stringWithFormat:@"%@",responce[@"data"]]];
//            [self.faTableView.mj_footer setHidden:YES];
//        }
        [SVProgressHUD dismissWithDelay:1];
        [self.faTableView.mj_footer endRefreshing];
        [self.faTableView.mj_header endRefreshing];
        [self.faTableView reloadData];
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
   JiaoYiFaTableViewCell * cell= [tableView dequeueReusableCellWithIdentifier:@"JiaoYiFaTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.deleteBtn addTarget:self action:@selector(deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.deleteBtn.tag= indexPath.row;
    
    GuanModel * model = self.dataArr[indexPath.row];
    if ([model.uid isEqualToString:@"0"]) {
     [cell.editBtn addTarget:self action:@selector(editBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }else{
        [cell.editBtn setTitle:@"禁止编辑" forState:0];
    }
     [cell chuanZhiGuanModel:model];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return height(140);
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
    
}
-(void)deleteBtnClick:(UIButton*)btn{
    LRWeakSelf(self);
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:[NSString stringWithFormat:@"您确定删除该笔交易吗？"] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *centain = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        GuanModel * model = self.dataArr[btn.tag];
        NSDictionary * jiaDic= @{@"pid":[NSString stringWithFormat:@"%@",model.pid]};
        [HttpTool post:KURLNSString(Minedel_auction ) dic:jiaDic success:^(id  _Nonnull responce) {
            //  if ([responce[@"result"] integerValue]==1) {
            [self loadDataMineFa:YES];
            //        }else{
            //            [SVProgressHUD showWithStatus:[NSString stringWithFormat:@"%@",responce[@"data"]]];
            //            [self.faTableView.mj_footer setHidden:YES];
            //        }
            [SVProgressHUD dismissWithDelay:1];
            [self.faTableView.mj_footer endRefreshing];
            [self.faTableView.mj_header endRefreshing];
            [self.faTableView reloadData];
        } faile:^(NSError * _Nonnull erroe) {
            
        }];
    }];
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alert addAction:centain];
    [alert addAction:cancle];
    [self presentViewController:alert animated:YES completion:nil];
}
-(void)editBtnClick{
    IssueViewController *issVC = [[IssueViewController alloc] init];
    issVC.title = @"我的发布";
    [self.navigationController pushViewController:issVC animated:YES];
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
