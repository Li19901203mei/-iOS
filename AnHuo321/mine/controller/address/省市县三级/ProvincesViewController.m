//
//  ProvincesViewController.m
//  Vpay
//
//  Created by mac on 2018/10/16.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ProvincesViewController.h"
#import "CountyTableViewCell.h"
#import "CountyModel.h"
#import "CityViewController.h"
@interface ProvincesViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * provincesTableView;
@property(nonatomic,strong)NSMutableArray * titleArr;
@property(nonatomic,strong)NSDictionary * personDic;

@end

@implementation ProvincesViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    //[self setNavTitle:@"省"];
    self.titleArr = [[NSMutableArray alloc]init];
   // [self setLeftButton:@"" imgStr:@"return_grey" selector:@selector(personBlack)];
    self.view.backgroundColor = BassColor(241, 241, 241);
    [self create_personTableView];
    [self load_user_detail];
}
-(void)personBlack{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)create_personTableView{
    self.provincesTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    self.provincesTableView.delegate = self;
    self.provincesTableView.dataSource = self;
    self.provincesTableView.backgroundColor = BassColor(241, 241, 241);
    [self.provincesTableView registerClass:[CountyTableViewCell class] forCellReuseIdentifier:@"CountyTableViewCell"];
   // self.provincesTableView.scrollEnabled = NO;
    [self.view addSubview:self.provincesTableView];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.titleArr.count;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CountyTableViewCell * mineCell = [tableView dequeueReusableCellWithIdentifier:@"CountyTableViewCell"];
    mineCell.selectionStyle = UITableViewCellSelectionStyleNone;
    CountyModel * model =self.titleArr[indexPath.row];
    mineCell.leftLable.text = [NSString stringWithFormat:@"%@",model.province_name];
    return mineCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CityViewController * cityVC= [[CityViewController alloc]init];
    CountyModel * model =self.titleArr[indexPath.row];
    cityVC.hidesBottomBarWhenPushed = YES;
    cityVC.cityID =model.province_id;
    cityVC.nameTitle = model.province_name;
    cityVC.title =model.province_name;
    [self.navigationController pushViewController:cityVC animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return height(51);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    return 0.001;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * heardView = [[UIView alloc]init];
    heardView.backgroundColor = BassColor(241, 241, 241);
    heardView.frame = CGRectMake(0, 0, kScreenWidth, 0.001);
    
    return heardView;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView * footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
    footView.backgroundColor = [UIColor whiteColor];
    return footView;
}
-(void)load_user_detail{
    
    
//    NSDictionary * persionDic = @{@"session_key":[NSString  stringWithFormat:@"%@",SESSION_KEY],@"parinrid":@"1"};
    [HttpTool post:KURLNSString(addressPro) dic:@{} success:^(id responce) {
        if ([responce[@"result"] intValue]==1) {
            
            self.titleArr = [CountyModel mj_objectArrayWithKeyValuesArray:responce[@"data"]];
        }else{
             [SVProgressHUD showWithStatus:[NSString stringWithFormat:@"%@",responce[@"data"]]];
        }
        [SVProgressHUD dismissWithDelay:1];
        [self.provincesTableView reloadData];
    } faile:^(NSError *erroe) {
//        [self showToastInView:self.view message:@"网络错误" duration:0.8];
    }];
}
@end
