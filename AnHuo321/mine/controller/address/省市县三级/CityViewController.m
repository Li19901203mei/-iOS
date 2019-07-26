//
//  CityViewController.m
//  Vpay
//
//  Created by mac on 2018/10/16.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "CityViewController.h"
#import "CountyTableViewCell.h"
#import "CountyModel.h"
#import "CountyViewController.h"
@interface CityViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * cityTableView;
@property(nonatomic,strong)NSMutableArray * titleArr;
@property(nonatomic,strong)NSDictionary * personDic;

@end

@implementation CityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self setNavTitle:@"市"];
    self.titleArr = [[NSMutableArray alloc]init];
    //[self setLeftButton:@"" imgStr:@"return_grey" selector:@selector(personBlack)];
    self.view.backgroundColor = BassColor(241, 241, 241);
    [self create_personTableView];
    [self load_user_detail];
}
-(void)personBlack{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)create_personTableView{
    self.cityTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    self.cityTableView.delegate = self;
    self.cityTableView.dataSource = self;
    self.cityTableView.backgroundColor = BassColor(241, 241, 241);
    [self.cityTableView registerClass:[CountyTableViewCell class] forCellReuseIdentifier:@"CountyTableViewCell"];
    // self.provincesTableView.scrollEnabled = NO;
    [self.view addSubview:self.cityTableView];
    
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
    mineCell.leftLable.text = [NSString stringWithFormat:@"%@",model.city_name];
    return mineCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CountyViewController * countyVC= [[CountyViewController alloc]init];
    CountyModel * model =self.titleArr[indexPath.row];
    countyVC.hidesBottomBarWhenPushed = YES;
    countyVC.proID = self.cityID;
    countyVC.countyID =model.city_id;
    countyVC.countyName = [NSString stringWithFormat:@"%@ %@",self.nameTitle,model.city_name];
    countyVC.title = [NSString stringWithFormat:@"%@",model.city_name];
    [self.navigationController pushViewController:countyVC animated:YES];
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
    
   
    NSDictionary * cityDic= @{@"province_id":[NSString stringWithFormat:@"%@",self.cityID]};
    [HttpTool post:KURLNSString(addressCity) dic:cityDic success:^(id responce) {
        if ([responce[@"result"] intValue]==1) {
            
            self.titleArr = [CountyModel mj_objectArrayWithKeyValuesArray:responce[@"data"]];
        }else{
            [SVProgressHUD showWithStatus:[NSString stringWithFormat:@"%@",responce[@"data"]]];
        }
        [SVProgressHUD dismissWithDelay:1];
        [self.cityTableView reloadData];
    } faile:^(NSError *erroe) {
//        [self showToastInView:self.view message:@"网络错误" duration:0.8];
    }];
}
@end
