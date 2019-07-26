//
//  WithdrawalViewController.m
//  AnHuo321
//
//  Created by mac on 2019/6/20.
//  Copyright © 2019年 macbookpro. All rights reserved.
//

#import "WithdrawalViewController.h"
#import "FeedBackTextView.h"
#import "TiRecordViewController.h"
@interface WithdrawalViewController (){
    UILabel * moneyLable;
}
@property(nonatomic,strong)UITextField * numField;
@property(nonatomic,strong)UITextField * nameField;
@property(nonatomic,strong)UITextField * zhiField;
@property(nonatomic,strong)UITextField * cardField;
@property(nonatomic,strong)UITextField * bankField;
@property(nonatomic,strong)UITextField * addressField;
@property(nonatomic,strong)FeedBackTextView * beiTextView;
@end

@implementation WithdrawalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = BassColor(241, 241, 241);
    moneyLable =[[UILabel alloc]init];
    moneyLable.textColor =[UIColor redColor];
    moneyLable.font =VFont;
    moneyLable.text =@"账户金额: 0.00元  冻结: 0.00 可用: 0.00";
    [self.view addSubview:moneyLable];
    [moneyLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(width(15));
        make.right.mas_equalTo(self.view.mas_right).offset(-width(15));
        make.top.mas_equalTo(self.view).offset(NavHeight+height(10));
        make.height.mas_equalTo(height(30));
    }];
    
    self.numField =[[UITextField alloc]init];
    self.numField.backgroundColor =[UIColor whiteColor];
    self.numField.font =VFont;
    self.numField.placeholder = @"请输入提现的金额";
    self.numField.textColor = BassColor(51, 51, 51);
    [self.view addSubview:self.numField];
    [self.numField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(self->moneyLable.mas_bottom).offset(5);
    }];
    UIView * numView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, width(90), height(45))];
    UILabel * numLable =[[UILabel alloc]initWithFrame:CGRectMake(0, 0,width(80) , height(45))];
    numLable.text = @"提现数量:";
    numLable.textAlignment = NSTextAlignmentRight;
    numLable.font= VFont;
    numLable.textColor = BassColor(51, 51, 51);
    [numView addSubview:numLable];
    self.numField.leftView = numView;
    self.numField.leftViewMode = UITextFieldViewModeAlways;
    
    self.nameField =[[UITextField alloc]init];
    self.nameField.backgroundColor =[UIColor whiteColor];
    self.nameField.font =VFont;
    self.nameField.placeholder = @"请输入的姓名";
    self.nameField.textColor = BassColor(51, 51, 51);
    [self.view addSubview:self.nameField];
    [self.nameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(self.numField.mas_bottom).offset(5);
    }];
    UIView * nameView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, width(90), height(45))];
    UILabel * nameLable =[[UILabel alloc]initWithFrame:CGRectMake(0, 0,width(80) , height(45))];
    nameLable.text = @"姓       名:";
    nameLable.textAlignment = NSTextAlignmentRight;
    nameLable.font= VFont;
    nameLable.textColor = BassColor(51, 51, 51);
    [nameView addSubview:nameLable];
    self.nameField.leftView = nameView;
    self.nameField.leftViewMode = UITextFieldViewModeAlways;
    
    self.zhiField =[[UITextField alloc]init];
    self.zhiField.backgroundColor =[UIColor whiteColor];
    self.zhiField.font =VFont;
    self.zhiField.placeholder = @"请输入支付宝号";
    self.zhiField.textColor = BassColor(51, 51, 51);
    [self.view addSubview:self.zhiField];
    [self.zhiField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(self.nameField.mas_bottom).offset(5);
    }];
    UIView * zhiView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, width(90), height(45))];
    UILabel * zhiLable =[[UILabel alloc]initWithFrame:CGRectMake(0, 0,width(80) , height(45))];
    zhiLable.text = @"支付宝号:";
    zhiLable.textAlignment = NSTextAlignmentRight;
    zhiLable.font= VFont;
    zhiLable.textColor = BassColor(51, 51, 51);
    [zhiView addSubview:zhiLable];
    self.zhiField.leftView = zhiView;
    self.zhiField.leftViewMode = UITextFieldViewModeAlways;
    
    self.cardField =[[UITextField alloc]init];
    self.cardField.backgroundColor =[UIColor whiteColor];
    self.cardField.font =VFont;
    self.cardField.placeholder = @"请输入银行卡号如不填请填写0";
    self.cardField.textColor = BassColor(51, 51, 51);
    [self.view addSubview:self.cardField];
    [self.cardField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(self.zhiField.mas_bottom).offset(5);
    }];
    UIView * cardView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, width(90), height(45))];
    UILabel * cardLable =[[UILabel alloc]initWithFrame:CGRectMake(0, 0,width(80) , height(45))];
    cardLable.text = @"银行卡号:";
    cardLable.textAlignment = NSTextAlignmentRight;
    cardLable.font= VFont;
    cardLable.textColor = BassColor(51, 51, 51);
    [cardView addSubview:cardLable];
    self.cardField.leftView = cardView;
    self.cardField.leftViewMode = UITextFieldViewModeAlways;
    
    self.bankField =[[UITextField alloc]init];
    self.bankField.backgroundColor =[UIColor whiteColor];
    self.bankField.font =VFont;
    self.bankField.placeholder = @"请输入银行卡名字";
    self.bankField.textColor = BassColor(51, 51, 51);
    [self.view addSubview:self.bankField];
    [self.bankField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(self.cardField.mas_bottom).offset(5);
    }];
    UIView * bankView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, width(90), height(45))];
    UILabel * bankLable =[[UILabel alloc]initWithFrame:CGRectMake(0, 0,width(80) , height(45))];
    bankLable.text = @"银行名字:";
    bankLable.textAlignment = NSTextAlignmentRight;
    bankLable.font= VFont;
    bankLable.textColor = BassColor(51, 51, 51);
    [bankView addSubview:bankLable];
    self.bankField.leftView = bankView;
    self.bankField.leftViewMode = UITextFieldViewModeAlways;
    
    self.addressField =[[UITextField alloc]init];
    self.addressField.backgroundColor =[UIColor whiteColor];
    self.addressField.font =VFont;
    self.addressField.placeholder = @"请输入银行卡归属地";
    self.addressField.textColor = BassColor(51, 51, 51);
    [self.view addSubview:self.addressField];
    [self.addressField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(self.bankField.mas_bottom).offset(5);
    }];
    UIView * addressView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, width(90), height(45))];
    UILabel * addressLable =[[UILabel alloc]initWithFrame:CGRectMake(0, 0,width(80) , height(45))];
    addressLable.text = @"银行地址:";
    addressLable.textAlignment = NSTextAlignmentRight;
    addressLable.font= VFont;
    addressLable.textColor = BassColor(51, 51, 51);
    [addressView addSubview:addressLable];
    self.addressField.leftView = addressView;
    self.addressField.leftViewMode = UITextFieldViewModeAlways;

    self.beiTextView = [[FeedBackTextView alloc]init];
    self.beiTextView.backgroundColor = BassColor(255, 255, 255);
    [self.view addSubview:self.beiTextView];
    self.beiTextView.font = VPFont(height(14));
    self.beiTextView.placeholder = @"请输入备注";//，可为空
    self.beiTextView.placeholderFont = VPFont(height(14));
    self.beiTextView.placeholderColor = [UIColor lightGrayColor];
    [self.beiTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(2);
        make.top.mas_equalTo(self.addressField.mas_bottom).offset(5);
        make.right.mas_equalTo(self.view.mas_right).offset(-2);
        make.height.mas_equalTo(height(80));
    }];
    self.beiTextView.layer.borderColor =BassColor(210, 211, 212).CGColor;
    self.beiTextView.layer.borderWidth =1;
    
    UIButton * sureBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [sureBtn setTitleColor:[UIColor whiteColor] forState:0];
    sureBtn.titleLabel.font = VFont;
    [sureBtn setTitle:@"确定" forState:0];
    sureBtn.backgroundColor =[UIColor redColor];
    [self.view addSubview:sureBtn];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(width(15));
        make.height.mas_equalTo(45);
        make.top.mas_equalTo(self.beiTextView.mas_bottom).offset(height(60));
        make.right.mas_equalTo(self.view.mas_right).offset(-width(15));
    }];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 60, 50);
    btn.backgroundColor = [UIColor clearColor];
    [btn setTitle:@"提现记录" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickRecord) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem =rightItem;
    [self load_getUserBalance];
}
-(void)load_getUserBalance{
    [HttpTool post:KURLNSString(GetUserBalance) dic:@{} success:^(id  _Nonnull responce) {
        if ([responce[@"result"] integerValue]==1) {
            self->moneyLable.text =[NSString stringWithFormat:@"账户金额: %@元  冻结: %@元 可用: %@元",responce[@"data"][@"wallet_pledge"],responce[@"data"][@"wallet_pledge_freeze"],responce[@"data"][@"wallet_pledge"]];
        }else{
            [SVProgressHUD showWithStatus:[NSString stringWithFormat:@"%@",responce[@"data"]]];
        }
        [SVProgressHUD dismissWithDelay:1];
    } faile:^(NSError * _Nonnull erroe) {
        
    }];
}
-(void)clickRecord{
    TiRecordViewController * tiVC =[[TiRecordViewController alloc]init];
    tiVC.title = @"提现记录";
    [self.navigationController pushViewController:tiVC animated:YES];
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
