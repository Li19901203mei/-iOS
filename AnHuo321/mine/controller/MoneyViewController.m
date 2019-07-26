//
//  MoneyViewController.m
//  AnHuo321
//
//  Created by mac on 2019/6/20.
//  Copyright © 2019年 macbookpro. All rights reserved.
//

#import "MoneyViewController.h"
#import "MoneyCell.h"
#import "TopUpViewController.h"
#import "WithdrawalViewController.h"
#import "YuRecordViewController.h"
@interface MoneyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView*moneyTableView;
@end

@implementation MoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =BassColor(241, 241, 241);
    self.moneyTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    self.moneyTableView.backgroundColor = BassColor(241, 241, 241);
    self.moneyTableView.dataSource =self;
    self.moneyTableView.delegate =self;
    self.moneyTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.moneyTableView registerClass:[MoneyCell class] forCellReuseIdentifier:@"MoneyCell"];
    [self.view addSubview:self.moneyTableView];
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MoneyCell * cell =[tableView dequeueReusableCellWithIdentifier:@"MoneyCell"];
    cell.backgroundColor =[UIColor whiteColor];
    cell.rightImg1.hidden=YES;
    if (indexPath.section==0) {
        cell.leftLable.text = @"在线充值";
        cell.leftImg.image =[UIImage imageNamed:@"zaixianchongzhi"];
    }else if (indexPath.section==1){
       cell.leftLable.text = @"余额提现";
        cell.leftImg.image =[UIImage imageNamed:@"tixian"];
    }else{
        cell.leftLable.text = @"余额记录";
        cell.leftImg.image =[UIImage imageNamed:@"jilu"];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return height(50);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return height(15);
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * heardView =[[UIView alloc]init];
    if (section==0) {
        heardView.frame =CGRectMake(0, 0, kScreenWidth, 0.0001);
        
    }else{
      heardView.frame =CGRectMake(0, 0, kScreenWidth,0.0001);
    }
    return heardView;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * footerView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, height(15))];
    return footerView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        TopUpViewController * topVC =[[TopUpViewController alloc]init];
        topVC.title = @"在线充值";
        [self.navigationController pushViewController:topVC animated:YES];
    }else if(indexPath.section==1){
        WithdrawalViewController * tiVC =[[WithdrawalViewController alloc]init];
        tiVC.title = @"余额提现";
        [self.navigationController pushViewController:tiVC animated:YES];
    }else{
        YuRecordViewController * recordVC =[[YuRecordViewController alloc]init];
        recordVC.title = @"余额记录";
        [self.navigationController pushViewController:recordVC animated:YES];
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
