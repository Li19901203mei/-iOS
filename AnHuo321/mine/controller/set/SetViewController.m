//
//  SetViewController.m
//  AnHuo321
//
//  Created by 吕书涛 on 2019/3/13.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import "SetViewController.h"
#import "SetTableViewCell.h"
#import "AccountsSecurityViewController.h"
#import "AboutViewController.h"
#import "AppDelegate.h"
#import "EditDataViewController.h"
@interface SetViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView * setTableView;
@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    self.setTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-45-kSafeAreaBottomHeight) style:UITableViewStyleGrouped];
    _setTableView.delegate =self;
    _setTableView.dataSource= self;
    [_setTableView registerClass:[SetTableViewCell class] forCellReuseIdentifier:@"SetTableViewCell"];
    [self.view addSubview:self.setTableView];
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
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SetTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"SetTableViewCell"];
    if (indexPath.section==0) {
        cell.leftLable.text =@"账号安全";
    }else{
        cell.leftLable.text =@"关于321AH";
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return height(45);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return height(90);
    }
    return 0.0001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return height(10);
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * heardView =[[UIView alloc]init];
    heardView.backgroundColor= BassColor(241, 241, 241);
    if (section==0) {
        heardView.frame =CGRectMake(0, 0, kScreenWidth, height(90));
        UIImageView * touImg =[[UIImageView alloc]init];
        touImg.image =[UIImage imageNamed:@"tx"];
        [heardView addSubview:touImg];
        [touImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(heardView.mas_centerY);
            make.left.mas_equalTo(heardView).offset(width(15));
            make.width.mas_equalTo(width(60));
            make.height.mas_equalTo(touImg.mas_width);
        }];
        UILabel * nameLabel=[[UILabel alloc]init];
        nameLabel.text = @"虎虎生威";
        nameLabel.font = VFont;
        nameLabel.textColor =BassColor(30, 30, 30);
        [heardView addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(touImg.mas_right).offset(width(10));
            make.top.mas_equalTo(touImg.mas_top).offset(height(10));
            make.right.mas_equalTo(heardView.mas_right).offset(-width(60));
            make.height.mas_equalTo(height(20));
        }];
        UILabel * accoutLabel=[[UILabel alloc]init];
        accoutLabel.text = [NSString stringWithFormat:@"会员号:%@",[GlobleStting getusername]];
        accoutLabel.font = VFont;
        accoutLabel.textColor =BassColor(30, 30, 30);
        [heardView addSubview:accoutLabel];
        [accoutLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(touImg.mas_right).offset(width(10));
            make.bottom.mas_equalTo(touImg.mas_bottom).offset(-height(10));
            make.right.mas_equalTo(heardView.mas_right).offset(-width(60));
            make.height.mas_equalTo(height(20));
        }];
        UIButton * editBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        [editBtn setTitle:@"编辑" forState:0];
        [editBtn setTitleColor:[UIColor redColor] forState:0];
        editBtn.titleLabel.font= VFont;
        [heardView addSubview:editBtn];
        [editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(heardView.mas_right).offset(-width(10));
            make.centerY.mas_equalTo(heardView.mas_centerY);
            make.width.mas_equalTo(width(40));
            make.height.mas_equalTo(height(20));
        }];
        editBtn.layer.borderColor =[UIColor redColor].CGColor;
        editBtn.layer.borderWidth = 1;
        [[editBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            EditDataViewController * editVC =[[EditDataViewController alloc]init];
            editVC.title = @"编辑资料";
            [self.navigationController pushViewController:editVC animated:YES];
        }];
    }else{
       heardView.frame =CGRectMake(0, 0, kScreenWidth, 0.0001);
    }
    return heardView;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * footView =[[UIView alloc]init];
    footView.backgroundColor= BassColor(241, 241, 241);
    footView.frame =CGRectMake(0, 0, kScreenWidth, height(10));
    return footView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        AccountsSecurityViewController *ASVC =[[AccountsSecurityViewController alloc]init];
        ASVC.title = @"账户安全";
        [self.navigationController pushViewController:ASVC animated:YES];
    }else
    {
        AboutViewController * aboutVC=[[AboutViewController alloc]init];
        aboutVC.title = @"关于321AH";
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
