//
//  TopUpViewController.m
//  AnHuo321
//
//  Created by mac on 2019/6/20.
//  Copyright © 2019年 macbookpro. All rights reserved.
//

#import "TopUpViewController.h"
#import "MoneyCell.h"
#import "ChongZhiViewController.h"
@interface TopUpViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UILabel * nameLable ;
}
@property(nonatomic,strong)UITextField * moneyField;
@property(nonatomic,strong)UITableView * topTableView;
@property(nonatomic,assign)NSInteger isSelete;
@property(nonatomic,strong)UIImageView * img1;
@property(nonatomic,strong)UIImageView * img2;
@property(nonatomic,assign)NSInteger isXuan;
@end

@implementation TopUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isSelete =-1;
    self.view.backgroundColor =[UIColor whiteColor];
    nameLable =[[UILabel alloc]init];
    nameLable.textColor =[UIColor redColor];
    nameLable.font =VFont;
    nameLable.text =@"账户余额: 0.00元  冻结: 0.00 信用金: 0.00";
    [self.view addSubview:nameLable];
    [nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(width(15));
        make.right.mas_equalTo(self.view.mas_right).offset(-width(15));
        make.top.mas_equalTo(self.view).offset(height(10));
        make.height.mas_equalTo(height(30));
    }];
    UIView * line =[[UIView alloc]init];
    line.backgroundColor =BassColor(241, 241, 241);
    [self.view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(width(15));
        make.right.mas_equalTo(self.view.mas_right).offset(-width(15));
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(self->nameLable.mas_bottom).offset(height(10));
    }];
    self.moneyField =[[UITextField alloc]init];
    self.moneyField.backgroundColor =[UIColor whiteColor];
    self.moneyField.font =VFont;
    self.moneyField.placeholder = @"请输入你要充值的金额";
    self.moneyField.textColor = BassColor(51, 51, 51);
    [self.view addSubview:self.moneyField];
    [self.moneyField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(self->nameLable.mas_bottom).offset(height(20));
    }];
    UIView * moneyView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, width(95), height(45))];
    UILabel * moneyLable =[[UILabel alloc]initWithFrame:CGRectMake(0, 0,width(80) , height(45))];
    moneyLable.text = @"充值金额:";
    moneyLable.textAlignment = NSTextAlignmentRight;
    moneyLable.font= VFont;
    moneyLable.textColor = BassColor(51, 51, 51);
    [moneyView addSubview:moneyLable];
    self.moneyField.leftView = moneyView;
    self.moneyField.leftViewMode = UITextFieldViewModeAlways;
    UIView * line1 =[[UIView alloc]init];
    line1.backgroundColor =BassColor(241, 241, 241);
    [self.view addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(width(15));
        make.right.mas_equalTo(self.view.mas_right).offset(-width(15));
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(self.moneyField.mas_bottom).offset(0);
    }];
    
    UILabel * typeLable =[[UILabel alloc]init];
    typeLable.textColor =[UIColor redColor];
    typeLable.font =VFont;
    typeLable.text =@"充值类型:";
    [self.view addSubview:typeLable];
    [typeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(width(15));
        make.right.mas_equalTo(self.view.mas_right).offset(-width(15));
        make.top.mas_equalTo(line1).offset(height(20));
        make.height.mas_equalTo(height(30));
    }];
    self.img1 = [[UIImageView alloc]init];
    self.img1.image = [UIImage imageNamed:@"weixuan"];
    [self.view addSubview:self.img1];
    [self.img1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(width(15));
        make.top.mas_equalTo(typeLable.mas_bottom).offset(height(10));
        make.height.mas_equalTo(height(20));
        make.width.mas_equalTo(width(20));
    }];
    UILabel * yuLable=[[UILabel alloc]init];
    yuLable.textColor = BassColor(51, 51, 51);
    yuLable.text = @"余额";
    yuLable.font = VFont;
    [self.view addSubview:yuLable];
    [yuLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.img1.mas_right).offset(width(10));
        make.centerY.mas_equalTo(self.img1.mas_centerY);
        make.height.mas_equalTo(height(20));
        make.width.mas_equalTo(width(65));
    }];
    UIButton * yuBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    yuBtn.backgroundColor =[UIColor clearColor];
    [self.view addSubview:yuBtn];
    [yuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view);
        make.centerY.mas_equalTo(self.img1.mas_centerY);
        make.right.mas_equalTo(yuLable.mas_right);
        make.height.mas_equalTo(height(25));
    }];
    
    self.img2 = [[UIImageView alloc]init];
    self.img2.image = [UIImage imageNamed:@"weixuan"];
    [self.view addSubview:self.img2];
    [self.img2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(yuLable.mas_right).offset(width(35));
        make.top.mas_equalTo(typeLable.mas_bottom).offset(height(10));
        make.height.mas_equalTo(height(20));
        make.width.mas_equalTo(width(20));
    }];
    UILabel * xinLable=[[UILabel alloc]init];
    xinLable.textColor = BassColor(51, 51, 51);
    xinLable.text = @"信用金";
    xinLable.font = VFont;
    [self.view addSubview:xinLable];
    [xinLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.img2.mas_right).offset(width(10));
        make.centerY.mas_equalTo(self.img1.mas_centerY);
        make.height.mas_equalTo(height(20));
        make.width.mas_equalTo(width(65));
    }];
    UIButton * xinBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    xinBtn.backgroundColor =[UIColor clearColor];
    [self.view addSubview:xinBtn];
    [xinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(yuLable.mas_right).offset(width(35));
        make.centerY.mas_equalTo(self.img2.mas_centerY);
        make.right.mas_equalTo(xinLable.mas_right);
        make.height.mas_equalTo(height(25));
    }];
    [[yuBtn rac_signalForControlEvents:UIControlEventTouchUpInside]  subscribeNext:^(__kindof UIControl * _Nullable x) {
        self.img1.image =[UIImage imageNamed:@"xuanzhong"];
        self.img2.image = [UIImage imageNamed:@"weixuan"];
    }];
    [[xinBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        self.img1.image =[UIImage imageNamed:@"weixuan"];
        self.img2.image = [UIImage imageNamed:@"xuanzhong"];
    }];
    UILabel * titleLable =[[UILabel alloc]init];
    titleLable.textColor =[UIColor redColor];
    titleLable.font =VFont;
    titleLable.text =@"选择支付方式:";
    [self.view addSubview:titleLable];
    [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(width(15));
        make.right.mas_equalTo(self.view.mas_right).offset(-width(15));
        make.top.mas_equalTo(line1).offset(height(20)+NavHeight);
        make.height.mas_equalTo(height(30));
    }];
    
    self.topTableView =[[UITableView alloc]initWithFrame:CGRectMake(0,NavHeight + height(155), kScreenWidth, height(105)) style:UITableViewStyleGrouped];
    self.topTableView.backgroundColor = BassColor(241, 241, 241);
    self.topTableView.dataSource =self;
    self.topTableView.delegate =self;
    self.topTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.topTableView registerClass:[MoneyCell class] forCellReuseIdentifier:@"MoneyCell"];
    [self.view addSubview:self.self.topTableView];
    UIButton * sureBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [sureBtn setTitleColor:[UIColor whiteColor] forState:0];
    sureBtn.titleLabel.font = VFont;
    [sureBtn setTitle:@"确定" forState:0];
    sureBtn.backgroundColor =[UIColor redColor];
    [self.view addSubview:sureBtn];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(width(15));
        make.height.mas_equalTo(45);
        make.top.mas_equalTo(self.topTableView.mas_bottom).offset(height(60));
        make.right.mas_equalTo(self.view.mas_right).offset(-width(15));
    }];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 60, 50);
    btn.backgroundColor = [UIColor clearColor];
    [btn setTitle:@"充值记录" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickRecord) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem =rightItem;
    [self load_getUserBalance];
    // Do any additional setup after loading the view.
}
-(void)load_getUserBalance{
    [HttpTool post:KURLNSString(GetUserBalance) dic:@{} success:^(id  _Nonnull responce) {
                if ([responce[@"result"] integerValue]==1) {
                    self->nameLable.text =[NSString stringWithFormat:@"账户余额: %@元  冻结: %@元 信用金: %@元",responce[@"data"][@"wallet_pledge"],responce[@"data"][@"wallet_pledge_freeze"],responce[@"data"][@"wallet_pledge"]];
                }else{
                    [SVProgressHUD showWithStatus:[NSString stringWithFormat:@"%@",responce[@"data"]]];
                }
        [SVProgressHUD dismissWithDelay:1];
    } faile:^(NSError * _Nonnull erroe) {
        
    }];
}
-(void)clickRecord{
    ChongZhiViewController * chongVC =[[ChongZhiViewController alloc]init];
    chongVC.title = @"充值记录";
    [self.navigationController pushViewController:chongVC animated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MoneyCell * cell =[tableView dequeueReusableCellWithIdentifier:@"MoneyCell"];
    cell.backgroundColor =[UIColor whiteColor];
    if (indexPath.section==0) {
        cell.leftLable.text = @"支付宝";
        cell.leftImg.image =[UIImage imageNamed:@"zhifubao"];
    }else{
        cell.leftLable.text = @"微信";
        cell.leftImg.image =[UIImage imageNamed:@"ic-wechat"];
    }
    if (self.isSelete==indexPath.section) {
        cell.rightImg1.image =[UIImage imageNamed:@"xuanzhong"];
    }else{
       cell.rightImg1.image =[UIImage imageNamed:@"weixuan"];
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
    return 2;
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
    UIView * footerView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 2)];
    return footerView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.isSelete =indexPath.section;
    [self.topTableView reloadData];
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
