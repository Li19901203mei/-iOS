//
//  ChangePSWViewController.m
//  AnHuo321
//
//  Created by mac on 2019/6/19.
//  Copyright © 2019年 macbookpro. All rights reserved.
//

#import "ChangePSWViewController.h"

@interface ChangePSWViewController ()
@property(nonatomic,strong)UITextField * oldField;
@property(nonatomic,strong)UITextField * xinField;
@property(nonatomic,strong)UITextField * sureField;
@end

@implementation ChangePSWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BassColor(241, 241, 241);
    self.oldField =[[UITextField alloc]init];
    self.oldField.backgroundColor =[UIColor whiteColor];
    self.oldField.font =VFont;
    self.oldField.placeholder = @"输入旧的密码";
    self.oldField.textColor = BassColor(51, 51, 51);
    [self.view addSubview:self.oldField];
    [self.oldField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(self.view).offset(height(20));
    }];
    UIView * oldView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, width(70), height(45))];
    UILabel * oldLable =[[UILabel alloc]initWithFrame:CGRectMake(0, 0,width(60) , height(45))];
    oldLable.text = @"旧密码:";
    oldLable.textAlignment = NSTextAlignmentRight;
    oldLable.font= VFont;
    oldLable.textColor = BassColor(51, 51, 51);
    [oldView addSubview:oldLable];
    self.oldField.leftView = oldView;
    self.oldField.leftViewMode = UITextFieldViewModeAlways;
    
    self.xinField =[[UITextField alloc]init];
    self.xinField.backgroundColor =[UIColor whiteColor];
    self.xinField.font =VFont;
    self.xinField.placeholder = @"输入新的密码";
    self.xinField.textColor = BassColor(51, 51, 51);
    [self.view addSubview:self.xinField];
    [self.xinField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(self.oldField.mas_bottom).offset(height(20));
    }];
    UIView * xinView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, width(70), height(45))];
    UILabel * pswLable =[[UILabel alloc]initWithFrame:CGRectMake(0, 0,width(60) , height(45))];
    pswLable.text = @"新密码:";
    pswLable.textAlignment = NSTextAlignmentRight;
    pswLable.font= VFont;
    pswLable.textColor = BassColor(51, 51, 51);
    [xinView addSubview:pswLable];
    self.xinField.leftView = xinView;
    self.xinField.leftViewMode = UITextFieldViewModeAlways;
    self.sureField =[[UITextField alloc]init];
    self.sureField.backgroundColor =[UIColor whiteColor];
    self.sureField.font =VFont;
    self.sureField.placeholder = @"请再次输入新的密码";
    self.sureField.textColor = BassColor(51, 51, 51);
    [self.view addSubview:self.sureField];
    [self.sureField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(self.xinField.mas_bottom).offset(height(20));
    }];
    UIView * sureView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, width(80), height(45))];
    UILabel * sureLable =[[UILabel alloc]initWithFrame:CGRectMake(0, 0,width(70) , height(45))];
    sureLable.text = @"确认密码:";
    sureLable.textAlignment = NSTextAlignmentRight;
    sureLable.font= VFont;
    sureLable.textColor = BassColor(51, 51, 51);
    [sureView addSubview:sureLable];
    self.sureField.leftView = sureView;
    self.sureField.leftViewMode = UITextFieldViewModeAlways;
    UIButton * sureBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [sureBtn setTitle:@"确认" forState:0];
    [sureBtn setTitleColor:[UIColor whiteColor] forState:0];
    sureBtn.backgroundColor =[UIColor redColor];
    sureBtn.titleLabel.font = VFont;
    [self.view addSubview:sureBtn];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(width(15));
        make.right.mas_equalTo(self.view.mas_right).offset(-width(15));
        make.height.mas_equalTo(45);
        make.top.mas_equalTo(self.sureField.mas_bottom).offset(height(50));
    }];
    [[sureBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSDictionary * jiaDic= @{@"pwd":[NSString stringWithFormat:@"%@",self.oldField.text],@"newPwd":[NSString stringWithFormat:@"%@",self.xinField.text],@"confirmPwd":[NSString stringWithFormat:@"%@",self.sureField.text]};
        [HttpTool post:KURLNSString(changePwd) dic:jiaDic success:^(id  _Nonnull responce) {
              if ([responce[@"result"] integerValue]==1) {
            
                    }else{
                        [SVProgressHUD showWithStatus:[NSString stringWithFormat:@"%@",responce[@"data"]]];
                    }
            [SVProgressHUD dismissWithDelay:1];
        } faile:^(NSError * _Nonnull erroe) {
            
        }];
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
