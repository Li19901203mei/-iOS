//
//  EditDataViewController.m
//  AnHuo321
//
//  Created by mac on 2019/7/3.
//  Copyright © 2019年 macbookpro. All rights reserved.
//

#import "EditDataViewController.h"

@interface EditDataViewController ()
@property(nonatomic,strong)UITextField * accoutField;
@end

@implementation EditDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =BassColor(241, 241, 241);
    UIView * backView =[[UIView alloc]init];
    backView.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view.mas_right);
        make.height.mas_equalTo(height(260));
        make.top.mas_equalTo(self.view).offset(NavHeight);
    }];
    UIButton * imgBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [imgBtn setBackgroundImage:[UIImage imageNamed:@"tx"] forState:0];
    [backView addSubview:imgBtn];
    [imgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(backView.mas_top).offset(height(10));
        make.centerX.mas_equalTo(backView.mas_centerX);
        make.width.mas_equalTo(width(80));
        make.height.mas_equalTo(imgBtn.mas_width);
    }];
    UILabel * imgLable =[[UILabel alloc]init];
    imgLable.text = @"更换图像";
    imgLable.font =VFont;
    imgLable.textColor = [UIColor redColor];
    imgLable.textAlignment = NSTextAlignmentCenter;
    [backView addSubview:imgLable];
    [imgLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(width(180));
        make.top.mas_equalTo(imgBtn.mas_bottom).offset(height(10));
        make.height.mas_equalTo(height(20));
        make.centerX.mas_equalTo(backView.mas_centerX);
    }];
    UILabel * nameLable =[[UILabel alloc]init];
    nameLable.textColor = BassColor(51, 51, 51);
    nameLable.text = @"会员名:";
    nameLable.font = VFont;
    [backView addSubview:nameLable];
    [nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backView.mas_left).offset(width(15));
        make.top.mas_equalTo(imgLable.mas_bottom).offset(height(20));
        make.width.mas_equalTo(width(50));
        make.height.mas_equalTo(height(18));
    }];
    self.accoutField =[[UITextField alloc]init];
    self.accoutField.backgroundColor =[UIColor whiteColor];
    self.accoutField.font =VFont;
    self.accoutField.placeholder = @"输入你的昵称";
    self.accoutField.textColor = BassColor(51, 51, 51);
    [backView addSubview:self.accoutField];
    [self.accoutField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(nameLable.mas_right);
        make.height.mas_equalTo(45);
        make.centerY.mas_equalTo(nameLable.mas_centerY);
        make.right.mas_equalTo(backView.mas_right).offset(-width(10));
    }];
    
    UILabel * sexLable =[[UILabel alloc]init];
    sexLable.textColor = BassColor(51, 51, 51);
    sexLable.text = @"性别          男";
    sexLable.font = VFont;
    [backView addSubview:sexLable];
    [sexLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backView.mas_left).offset(width(15));
        make.top.mas_equalTo(nameLable.mas_bottom).offset(height(30));
        make.width.mas_equalTo(width(150));
        make.height.mas_equalTo(height(18));
    }];
    
    UIImageView*rightImg =[[UIImageView alloc]init];
    rightImg.image =[UIImage imageNamed:@"icon-couti"];
    [backView addSubview:rightImg];
    [rightImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(sexLable.mas_centerY);
        make.right.mas_equalTo(backView.mas_right).offset(-width(10));
        make.height.mas_equalTo(height(20));
        make.width.mas_equalTo(width(16));
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
