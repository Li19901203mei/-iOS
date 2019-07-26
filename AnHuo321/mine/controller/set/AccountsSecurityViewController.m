//
//  AccountsSecurityViewController.m
//  AnHuo321
//
//  Created by mac on 2019/6/18.
//  Copyright © 2019年 macbookpro. All rights reserved.
//

#import "AccountsSecurityViewController.h"
#import "AccountsSecurityTableViewCell.h"
#import "ChangePSWViewController.h"
#import "EmailRenViewController.h"
#import "PhoneRenViewController.h"
#import "MPNViewController.h"
@interface AccountsSecurityViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView * ASTableView;
@property(nonatomic,copy)NSArray * titleArr;
@end

@implementation AccountsSecurityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    
    self.titleArr =[[NSArray alloc]initWithObjects:@"用户名",@"修改手机号",@"修改登录密码",@"注销账号",@"手机认证",@"邮箱认证", nil];
    self.ASTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-NavHeight-kSafeAreaBottomHeight) style:UITableViewStyleGrouped];
    _ASTableView.delegate =self;
    _ASTableView.dataSource= self;
    _ASTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_ASTableView registerClass:[AccountsSecurityTableViewCell class] forCellReuseIdentifier:@"AccountsSecurityTableViewCell"];
    [self.view addSubview:self.ASTableView];
//    UIButton * tuiBtn =[UIButton buttonWithType:UIButtonTypeCustom];
//    [tuiBtn setTitle:@"退出当前用户" forState:0];
//    [tuiBtn setTitleColor:[UIColor whiteColor] forState:0];
//    tuiBtn.backgroundColor =[UIColor redColor];
//    [self.view addSubview:tuiBtn];
//    [tuiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.mas_equalTo(self.view);
//        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-kSafeAreaBottomHeight);
//        make.height.mas_equalTo(45);
//    }];
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.titleArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AccountsSecurityTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"AccountsSecurityTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.leftLable.text =self.titleArr[indexPath.section];
    if (indexPath.section==0) {
        cell.rightLable.text =@"在2345";
    }else if(indexPath.section==1){
       cell.rightLable.text =@"18338451006";
    }else if(indexPath.section==4){
        cell.rightLable.text =@"已认证";
    }else if(indexPath.section==5){
        cell.rightLable.text =@"未认证";
        cell.rightLable.textColor =[UIColor redColor];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return height(45);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
   
    return 0.0001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return height(5);
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * heardView =[[UIView alloc]init];
    heardView.backgroundColor= BassColor(241, 241, 241);
        heardView.frame =CGRectMake(0, 0, kScreenWidth, 0.0001);
    return heardView;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * footView =[[UIView alloc]init];
    footView.backgroundColor= BassColor(241, 241, 241);
    footView.frame =CGRectMake(0, 0, kScreenWidth, height(5));
    return footView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            MPNViewController * mpnVC =[[MPNViewController alloc]init];
            mpnVC.title=@"手机号修改";
            [self.navigationController pushViewController:mpnVC animated:YES];
        }
            break;
        case 2:
        {
            ChangePSWViewController * changeVC =[[ChangePSWViewController alloc]init];
            changeVC.title = @"修改登录密码";
            [self.navigationController pushViewController:changeVC animated:YES];
        }
            break;
        case 3:
        {
            
        }
            break;
        case 4:
        {
            PhoneRenViewController * phoneVC =[[PhoneRenViewController alloc]init];
            phoneVC.hidesBottomBarWhenPushed =YES;
            phoneVC.title =@"手机认证";
            [self.navigationController pushViewController:phoneVC animated:YES];
        }
            break;
        case 5:
        {
            EmailRenViewController * emailVC =[[EmailRenViewController alloc]init];
            emailVC.title = @"邮箱认证";
            [self.navigationController pushViewController:emailVC animated:YES];
        }
            break;
        default:
            break;
    }
}
@end
