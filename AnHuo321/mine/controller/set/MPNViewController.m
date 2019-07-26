//
//  MPNViewController.m
//  AnHuo321
//
//  Created by mac on 2019/6/19.
//  Copyright © 2019年 macbookpro. All rights reserved.
//

#import "MPNViewController.h"

@interface MPNViewController ()
@property(nonatomic,strong)UIImageView * rightImg;
@property(nonatomic,strong)UITextField * phoneField;
@end

@implementation MPNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =BassColor(241, 241, 241);
    UIView * firstView =[[UIView alloc]initWithFrame:CGRectMake(0,NavHeight, kScreenWidth, 50)];
    firstView.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:firstView];
    UILabel * leftLable =[[UILabel alloc]init];
    leftLable.textColor = BassColor(51, 51, 51);
    leftLable.text = @"国家和地区";
    leftLable.font =VFont;
    [firstView addSubview:leftLable];
    [leftLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(firstView.mas_left).offset(width(15));
        make.centerY.mas_equalTo(firstView.mas_centerY);
        make.width.mas_equalTo(kScreenWidth/2);
        make.height.mas_equalTo(height(20));
    }];
    UILabel * rightLable =[[UILabel alloc]init];
    rightLable.textColor = BassColor(51, 51, 51);
    rightLable.text = @"中国大陆+86";
    rightLable.font =VFont;
    rightLable.textAlignment =NSTextAlignmentRight;
    [firstView addSubview:rightLable];
    [rightLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(firstView.mas_right).offset(-width(45));
        make.centerY.mas_equalTo(firstView.mas_centerY);
        make.width.mas_equalTo(kScreenWidth/2);
        make.height.mas_equalTo(height(20));
    }];
    self.rightImg =[[UIImageView alloc]init];
    self.rightImg.backgroundColor = [UIColor redColor];
    [firstView addSubview:self.rightImg];
    [self.rightImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(firstView.mas_centerY);
        make.right.mas_equalTo(firstView.mas_right).offset(-width(10));
        make.height.mas_equalTo(height(20));
        make.width.mas_equalTo(width(16));
    }];
    
    self.phoneField =[[UITextField alloc]init];
    self.phoneField.backgroundColor =[UIColor whiteColor];
    self.phoneField.font =VFont;
    self.phoneField.placeholder = @"输入你的手机号";
    self.phoneField.textColor = BassColor(51, 51, 51);
    [self.view addSubview:self.phoneField];
    [self.phoneField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(firstView.mas_bottom).offset(1);
    }];
    UIView * phoneView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, width(70), height(45))];
    UILabel * phoneLable =[[UILabel alloc]initWithFrame:CGRectMake(0, 0,width(60) , height(45))];
    phoneLable.text = @"手机号:";
    phoneLable.textAlignment = NSTextAlignmentRight;
    phoneLable.font= VFont;
    phoneLable.textColor = BassColor(51, 51, 51);
    [phoneView addSubview:phoneLable];
    self.phoneField.leftView = phoneView;
    self.phoneField.leftViewMode = UITextFieldViewModeAlways;
    UIButton * sureBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [sureBtn setTitle:@"确认修改" forState:0];
    [sureBtn setTitleColor:[UIColor whiteColor] forState:0];
    sureBtn.backgroundColor =[UIColor redColor];
    sureBtn.titleLabel.font = VFont;
    [self.view addSubview:sureBtn];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(width(15));
        make.right.mas_equalTo(self.view.mas_right).offset(-width(15));
        make.height.mas_equalTo(45);
        make.top.mas_equalTo(self.phoneField.mas_bottom).offset(height(50));
    }];
    // Do any additional setup after loading the view.
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
