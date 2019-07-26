//
//  MineNewVC.m
//  AnHuo321
//
//  Created by 123 on 2019/7/8.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import "MineNewVC.h"
#import "BaseModel.h"
#import "OrderViewController.h"
#import "AddrViewController.h"
#import "InformationViewController.h"
#import "SetViewController.h"
#import "MyJiaoYiViewController.h"
#import "MoneyViewController.h"
#import "MPNViewController.h"
#import "ChangePSWViewController.h"
#import "EmailRenViewController.h"
#import "IssueViewController.h"
#import "MyAttention_One_ViewController.h"
#import "MyAttentionViewController.h"
#import "AInformationViewController.h"
#import "GeRenViewController.h"
#import "SendMessageVC.h"
@interface MineNewVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *headerImg;
@property (weak, nonatomic) IBOutlet UILabel *nickName;
@property (weak, nonatomic) IBOutlet UIButton *clickBtn;
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (nonatomic,strong) NSArray *sectionOneArray;
@property (nonatomic,strong) NSArray *sectionTwoArray;
@property (nonatomic,strong) BaseModel *model;
@end

@implementation MineNewVC
- (IBAction)goToClickBtn:(UIButton *)sender {
    if ([GlobleStting getusername].length>0){
        GeRenViewController * geRenVC =[[GeRenViewController alloc]init];
        geRenVC.model = self.model;
        geRenVC.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:geRenVC animated:YES];
    }else{
        LoginViewController *vc = [[LoginViewController alloc]init];
        vc.title = @"账号登录";
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if ([GlobleStting getusername].length>0) {
        [self obtainData];
        
    }else{
        self.nickName.text = @"登录 | 注册";
        self.headerImg.image = [UIImage imageNamed:@"tx"];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.sectionOneArray = @[@"账号信息",@"资金信息",@"提醒/站内信",@"发送站内信"];
    self.sectionTwoArray = @[@"发布交易",@"关注的交易",@"我的交易"];
    self.table.tableFooterView = [UIView new];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return self.sectionOneArray.count;
    }else{
        return self.sectionTwoArray.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = self.sectionOneArray[indexPath.row];
    }else{
        cell.textLabel.text = self.sectionTwoArray[indexPath.row];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([GlobleStting getusername].length>0){
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            AInformationViewController * ainVC =[[AInformationViewController alloc]init];
            ainVC.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:ainVC animated:YES];
        }else if (indexPath.row == 1){
            MoneyViewController * moneyVC =[[MoneyViewController alloc]init];
            moneyVC.title = @"资金明细";
            [self.navigationController pushViewController:moneyVC animated:YES];
        }else if (indexPath.row == 2){
            InformationViewController *vc = [[InformationViewController alloc]init];
            vc.title = @"消息通知";
            [self.navigationController pushViewController:vc animated:YES];
        }else if (indexPath.row == 3){
            SendMessageVC *vc = [SendMessageVC new];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }else{
        if (indexPath.row == 0) {
            IssueViewController *vc = [IssueViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }else if (indexPath.row == 1){
            MyAttentionViewController *vc = [MyAttentionViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }else if (indexPath.row == 2){
            OrderViewController *vc = [OrderViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    }else{
        LoginViewController *vc = [[LoginViewController alloc]init];
        vc.title = @"账号登录";
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 48;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    view.backgroundColor = backGroundCorlor;
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001f;
}
- (void)obtainData{
    //    https://321ah.com/index.php?s=/Memberapi/index&userid=3
    NSMutableDictionary *dicM = [NSMutableDictionary dictionary];
    [dicM setObject:[GlobleStting getuserId] forKey:@"userid"];
    [Manager requestGETWithURLStr:KURLNSString(@"index.php?s=/Memberapi/index") paramDic:dicM finish:^(id  _Nonnull dict) {
        self.model = [BaseModel mj_objectWithKeyValues:dict[@"info"]];
        NSLog(@"---------%@",dict);
        self.headerImg.image = [UIImage imageNamed:@"tx"];
        self.nickName.text = self.model.nickname;
    } enError:^(NSError * _Nonnull error) {

    }];

}
@end
