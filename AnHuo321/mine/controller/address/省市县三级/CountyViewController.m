//
//  CountyViewController.m
//  Vpay
//
//  Created by mac on 2018/10/16.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "CountyViewController.h"
#import "CountyTableViewCell.h"
#import "CountyModel.h"
#import "ADD_Address_ViewController.h"
@interface CountyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * countyTableView;
@property(nonatomic,strong)NSMutableArray * titleArr;
@property(nonatomic,strong)NSDictionary * personDic;

@end

@implementation CountyViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    //[self setNavTitle:@"县"];
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
    self.countyTableView= [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    self.countyTableView.delegate = self;
    self.countyTableView.dataSource = self;
    self.countyTableView.backgroundColor = BassColor(241, 241, 241);
    [self.countyTableView registerClass:[CountyTableViewCell class] forCellReuseIdentifier:@"CountyTableViewCell"];
    // self.provincesTableView.scrollEnabled = NO;
    [self.view addSubview:self.countyTableView];
    
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
    mineCell.leftLable.text = [NSString stringWithFormat:@"%@",model.area_name];
    return mineCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CountyModel * model =self.titleArr[indexPath.row];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"county" object:[NSString stringWithFormat:@"%@ %@",self.countyName,model.area_name]];
    NSArray * idArr =[[NSArray alloc]initWithObjects:self.proID,self.countyID,model.area_id, nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"chuanID" object:idArr];
    for (UIViewController * controller in self.navigationController.viewControllers) {
    if ([controller isKindOfClass:[ADD_Address_ViewController class]]) {
    //
    
   // }
    [self.navigationController popToViewController:controller animated:YES];
    }
      }
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
    
    
    NSDictionary * areaDic=@{@"city_id":[NSString stringWithFormat:@"%@",self.countyID]};
    [HttpTool post:KURLNSString(addressgetArea) dic:areaDic success:^(id responce) {
        if ([responce[@"result"] intValue]==1) {
            
            self.titleArr = [CountyModel mj_objectArrayWithKeyValuesArray:responce[@"data"]];
        }else{
          [SVProgressHUD showWithStatus:[NSString stringWithFormat:@"%@",responce[@"data"]]];
        }
        [SVProgressHUD dismissWithDelay:1];
        [self.countyTableView reloadData];
    } faile:^(NSError *erroe) {
//        [self showToastInView:self.view message:@"网络错误" duration:0.8];
    }];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"county" object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"chuanID" object:nil];
}
@end
