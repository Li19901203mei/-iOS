//
//  AInformationViewController.m
//  AnHuo321
//
//  Created by 二恒 on 2019/7/19.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import "AInformationViewController.h"
#import "AinTableViewCell.h"
#import "AccountsSecurityViewController.h"
#import "EmailRenViewController.h"
#import "PhoneRenViewController.h"
#import "ChangePSWViewController.h"
#import "MPNViewController.h"
#import "AboutViewController.h"
#import "AddrViewController.h"
#import "HelpViewController.h"
@interface AInformationViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView * ainTableView;

@end

@implementation AInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =BassColor(241, 241, 241);
    self.navigationItem.title = @"账号信息";
    // Do any additional setup after loading the view.
    self.ainTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-45-kSafeAreaBottomHeight) style:UITableViewStyleGrouped];
    _ainTableView.delegate =self;
    _ainTableView.dataSource= self;
    [_ainTableView registerClass:[AinTableViewCell class] forCellReuseIdentifier:@"AinTableViewCell"];
    [self.view addSubview:self.ainTableView];
    
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AinTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"AinTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
     if(indexPath.section==0){
         if (self.model.verify_email==YES) {
             cell.leftLable.text =@"修改邮箱";
         }else{
             cell.leftLable.text =@"邮箱认证";
         }
        
    }else if(indexPath.section==1){
        if (self.model.verify_mobile==YES) {
           cell.leftLable.text =@"修改手机号";
        }else{
            cell.leftLable.text =@"手机认证";
        }
        
    }else if (indexPath.section==2){
        cell.leftLable.text =@"修改登录密码";
    }else if (indexPath.section==3){
        cell.leftLable.text =@"我的地址";
    }else if (indexPath.section==4){
        cell.leftLable.text =@"帮助中心";
    }else{
        cell.leftLable.text =@"关于我们";
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
    return 0.0001;
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
    footView.frame =CGRectMake(0, 0, kScreenWidth, 0.0001);
    return footView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   if(indexPath.section==0)
    {
        EmailRenViewController * emailVC =[[EmailRenViewController alloc]init]; if (self.model.verify_email==YES) {
            emailVC.title =@"修改邮箱";
            emailVC.typeIndex=1;
        }else{
            emailVC.title =@"邮箱认证";
            emailVC.typeIndex=0;
        }
        [self.navigationController pushViewController:emailVC animated:YES];
    }else if (indexPath.section==1){
        PhoneRenViewController * phoneVC =[[PhoneRenViewController alloc]init];
        if (self.model.verify_mobile==YES) {
            phoneVC.title =@"修改手机号";
            phoneVC.typeIndex=1;
        }else{
            phoneVC.title =@"手机认证";
            phoneVC.typeIndex=0;
        }
        phoneVC.hidesBottomBarWhenPushed =YES;
        
        [self.navigationController pushViewController:phoneVC animated:YES];
    }else if (indexPath.section==2){
        ChangePSWViewController * changeVC =[[ChangePSWViewController alloc]init];
        changeVC.title = @"修改登录密码";
        [self.navigationController pushViewController:changeVC animated:YES];
    }else if (indexPath.section==3){
        AddrViewController *vc = [[AddrViewController alloc]init];
        vc.title = @"我的地址";
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section==4){
        HelpViewController *vc = [[HelpViewController alloc]init];
        vc.title = @"帮助中心";
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        AboutViewController * aboutVC=[[AboutViewController alloc]init];
        aboutVC.title = @"关于我们";
        [self.navigationController pushViewController:aboutVC animated:YES];
    }
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
