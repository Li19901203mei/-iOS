
//
//  GeRenViewController.m
//  AnHuo321
//
//  Created by 二恒 on 2019/7/22.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import "GeRenViewController.h"
#import "GeRenTableViewCell.h"
#import "AppDelegate.h"
#import "PhoneRenViewController.h"
#import "EmailRenViewController.h"
@interface GeRenViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView * geTableView;

@end

@implementation GeRenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =BassColor(241, 241, 241);
    self.navigationItem.title = @"个人信息";
    // Do any additional setup after loading the view.
    self.geTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, height(550)) style:UITableViewStyleGrouped];
    _geTableView.delegate =self;
    _geTableView.dataSource= self;
    [_geTableView registerClass:[GeRenTableViewCell class] forCellReuseIdentifier:@"GeRenTableViewCell"];
    [self.view addSubview:self.geTableView];
    UIButton * tuiBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [tuiBtn setTitle:@"退出当前用户" forState:0];
    [tuiBtn setTitleColor:[UIColor whiteColor] forState:0];
    tuiBtn.backgroundColor =[UIColor redColor];
    [self.view addSubview:tuiBtn];
    [tuiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-kSafeAreaBottomHeight);
        make.height.mas_equalTo(45);
    }];
    [[tuiBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"username"];
        UIWindow *window = ((AppDelegate*)([UIApplication sharedApplication].delegate)).window;
        MainTabbarViewController *mainVC = [[MainTabbarViewController alloc]init];
        window.rootViewController = mainVC;
        mainVC.selectedIndex = 2;
        [window makeKeyWindow];
    }];
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 8;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GeRenTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"GeRenTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section==0) {
        cell.leftLable.text = @"头像";
        cell.rightLable.hidden=YES;
    }else if (indexPath.section==1) {
        cell.leftLable.text = @"账号";
        cell.rightLable.text =[GlobleStting getusername];
        cell.rightImg.hidden=YES;
    }else if (indexPath.section==2) {
        cell.leftLable.text = @"昵称";
        cell.rightLable.text =self.model.nickname;
    }else if (indexPath.section==3) {
        cell.leftLable.text = @"姓名";
        cell.rightLable.text =[NSString stringWithFormat:@"%@",self.model.truename];
    }else if (indexPath.section==4) {
        cell.leftLable.text = @"性别";
        if (self.model.sex.length==0) {
           cell.rightLable.text =@"未知";
        }else{
          cell.rightLable.text =[NSString stringWithFormat:@"%@",self.model.sex];
        }
        
    }else if (indexPath.section==5) {
        
        if (self.model.verify_email==YES) {
           cell.rightLable.text =[NSString stringWithFormat:@"%@",self.model.email];
            cell.leftLable.text = @"修改邮箱";
        }else{
            cell.rightLable.text =@"未认证";
            cell.leftLable.text = @"邮箱";
        }
        
    }else if (indexPath.section==6) {
        
        if (self.model.verify_mobile==YES) {
            cell.rightLable.text =[NSString stringWithFormat:@"%@",self.model.mobile];
            cell.leftLable.text = @"修改手机号";
        }else{
         cell.rightLable.text =@"未认证";
        cell.leftLable.text = @"手机号";
        }
    }else  {
        cell.leftLable.text = @"收货地址";
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return height(90);
    }
    return height(45);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.0001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
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
    footView.frame =CGRectMake(0, 0, kScreenWidth, 10);
    return footView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        
    }else if (indexPath.section==1){
        
    }else if (indexPath.section==2){
        
    }else if (indexPath.section==3){
        
    }else if (indexPath.section==4){
        
    }else if (indexPath.section==5){
        EmailRenViewController * emailVC =[[EmailRenViewController alloc]init]; if (self.model.verify_email==YES) {
            emailVC.title =@"修改邮箱";
            emailVC.typeIndex=1;
        }else{
            emailVC.title =@"邮箱认证";
            emailVC.typeIndex=0;
        }
        [self.navigationController pushViewController:emailVC animated:YES];
    }else if (indexPath.section==6){
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
    }else{
        
    }
}

@end
