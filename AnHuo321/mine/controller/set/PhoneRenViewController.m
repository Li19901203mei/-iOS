//
//  PhoneRenViewController.m
//  AnHuo321
//
//  Created by mac on 2019/6/19.
//  Copyright © 2019年 macbookpro. All rights reserved.
//

#import "PhoneRenViewController.h"

@interface PhoneRenViewController ()
@property(nonatomic,strong)UITextField * nameField;
@property(nonatomic,strong)UITextField * yanField;
@property(nonatomic,assign)int waitTime;
@property (nonatomic ,strong)dispatch_source_t timer;//  注意:此处应该使用强引用 strong
@end

@implementation PhoneRenViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = BassColor(241, 241, 241);
    self.nameField =[[UITextField alloc]init];
    self.nameField.backgroundColor =[UIColor whiteColor];
    self.nameField.font =VFont;
    self.nameField.placeholder = @"输入你的手机号";
    self.nameField.textColor = BassColor(51, 51, 51);
    [self.view addSubview:self.nameField];
    [self.nameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(self.view).offset(height(20));
    }];
    UIView * nameView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, width(70), height(45))];
    UILabel * nameLable =[[UILabel alloc]initWithFrame:CGRectMake(0, 0,width(60) , height(45))];
    nameLable.text = @"手机号:";
    nameLable.textAlignment = NSTextAlignmentRight;
    nameLable.font= VFont;
    nameLable.textColor = BassColor(51, 51, 51);
    [nameView addSubview:nameLable];
    self.nameField.leftView = nameView;
    self.nameField.leftViewMode = UITextFieldViewModeAlways;
    self.yanField =[[UITextField alloc]init];
    self.yanField.backgroundColor =[UIColor whiteColor];
    self.yanField.font =VFont;
    self.yanField.placeholder = @"请输入邮箱收到的验证码";
    self.yanField.textColor = BassColor(51, 51, 51);
    [self.view addSubview:self.yanField];
    [self.yanField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(self.nameField.mas_bottom).offset(height(20));
    }];
    
    UIView * yanView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, width(80), height(45))];
    UILabel * yanLable =[[UILabel alloc]initWithFrame:CGRectMake(0, 0,width(70) , height(45))];
    yanLable.text = @"验证码:";
    yanLable.textAlignment = NSTextAlignmentRight;
    yanLable.font= VFont;
    yanLable.textColor = BassColor(51, 51, 51);
    [yanView addSubview:yanLable];
    self.yanField.leftView = yanView;
    self.yanField.leftViewMode = UITextFieldViewModeAlways;
    UIButton * maBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    maBtn.backgroundColor = [UIColor whiteColor];
    [maBtn setTitleColor:BassColor(201, 18, 18) forState:0];
    [maBtn setTitle:@"获取验证码" forState:0];
    maBtn.titleLabel.font= VFont;
    maBtn.frame = CGRectMake(self.yanField.frame.size.width-width(85), 0,width(85), 50);
    self.yanField.rightView = maBtn;
    [[maBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [HttpTool post:KURLNSString(sendCode) dic:@{@"checktp":@"mobile",@"how":@"verify",@"checkadr":self.nameField.text} success:^(id  _Nonnull responce) {
            if ([responce[@"result"] intValue]==1) {
                dispatch_queue_t queue = dispatch_get_main_queue();
                dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
                dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
                dispatch_source_set_event_handler(timer, ^{
                    self.waitTime --;
                    [maBtn setTitle:[NSString stringWithFormat:@"剩余%lds",(long)self.waitTime] forState:0];
                    if (self.waitTime<0){
                        [maBtn setTitle:[NSString stringWithFormat:@"重新发送"] forState:0];
                        self.waitTime=60;
                        dispatch_cancel(self.timer);
                    }
                });
                dispatch_resume(timer);
                self.timer = timer;
            }else{
                [SVProgressHUD showWithStatus:[NSString stringWithFormat:@"%@",responce[@"data"]]];
                [SVProgressHUD dismissWithDelay:1];
            }
        } faile:^(NSError * _Nonnull erroe) {
            
        }];
    }];
    self.yanField.rightViewMode =UITextFieldViewModeAlways;
    
    
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
        make.top.mas_equalTo(self.yanField.mas_bottom).offset(height(50));
    }];
    [[sureBtn rac_signalForControlEvents:UIControlEventTouchUpInside]  subscribeNext:^(__kindof UIControl * _Nullable x) {
        if (self.typeIndex==1) {
            
        }else{
            [HttpTool post:KURLNSString(checkCode) dic:@{@"checkType":@"codeMobile",@"mobile_verify":self.yanField.text,@"mobile":self.nameField.text} success:^(id  _Nonnull responce) {
                if ([responce[@"result"] intValue]==1) {
                    [SVProgressHUD showWithStatus:[NSString stringWithFormat:@"%@",responce[@"data"]]];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [self.navigationController popViewControllerAnimated:YES];
                    });
                }else{
                    [SVProgressHUD showWithStatus:[NSString stringWithFormat:@"%@",responce[@"data"]]];
                    
                }
                [SVProgressHUD dismissWithDelay:1];
            } faile:^(NSError * _Nonnull erroe) {
                
            }];
        }
    }];
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
