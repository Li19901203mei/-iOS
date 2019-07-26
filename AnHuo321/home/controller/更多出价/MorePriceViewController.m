//
//  MorePriceViewController.m
//  AnHuo321
//
//  Created by 吕书涛 on 2019/3/30.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import "MorePriceViewController.h"
#import "MorePriceListViewController.h"

@interface MorePriceViewController ()<UITextFieldDelegate>
{
    UITextField *text1;
    UITextField *text2;
}
@end

@implementation MorePriceViewController



- (void)clickchujia{
    if (text1.text.length<=0) {
        [SVProgressHUD showErrorWithStatus:@"请输入单价"];
        [SVProgressHUD dismissWithDelay:1];
        return;
    }
    if (text2.text.length<=0) {
        [SVProgressHUD showErrorWithStatus:@"请输入数量"];
        [SVProgressHUD dismissWithDelay:1];
        return;
    }
    
    LRWeakSelf(self);
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:[NSString stringWithFormat:@"您确认出价单价为%@，数量为%@的交易吗?",text1.text,text2.text] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *centain = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf baojia];
    }];
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alert addAction:centain];
    [alert addAction:cancle];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)baojia{
    
    
    
    
    
//    MorePriceListViewController *vc = [[MorePriceListViewController alloc]init];
//    vc.title = @"更多出价";
//    [self.navigationController pushViewController:vc animated:YES];
}

//










- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupview];
    // Do any additional setup after loading the view.
}
- (void)setupview{
    UILabel *lab1 = [AHControll createLabelWithFrame:CGRectMake(10, kNavBarHAbove7+20, SCREEN_WIDTH-20, 40) Font:17 Text:@"单价:" textColor:UIColor.blackColor NSTextAlignment:NSTextAlignmentLeft];
    [self.view addSubview:lab1];
    text1 = [AHControll createTextFieldWithFrame:CGRectMake(10, kNavBarHAbove7+60, SCREEN_WIDTH-20, 50) placeholder:@"请输入单价" textColor:UIColor.redColor Font:17 Alignment:NSTextAlignmentLeft];
    [self.view addSubview:text1];
    UIView *line = [AHControll viewWithFrame:CGRectMake(10, kNavBarHAbove7+110, SCREEN_WIDTH-20, 1) viewColor:COLOR];
    [self.view addSubview:line];
    
    [self setview1];
    
    UIButton *btn = [AHControll createButtonNormalFrame:CGRectMake(10, kNavBarHAbove7+240, SCREEN_WIDTH-20, 50) Target:self Action:@selector(clickchujia) Title:@"确认出价" TitleColor:UIColor.whiteColor Font:16 BackGColor:baseColor];
    [self.view addSubview:btn];
}
- (void)setview1{
    UILabel *lab1 = [AHControll createLabelWithFrame:CGRectMake(10, kNavBarHAbove7+120, SCREEN_WIDTH-20, 40) Font:17 Text:@"数量:" textColor:UIColor.blackColor NSTextAlignment:NSTextAlignmentLeft];
    [self.view addSubview:lab1];
    text2 = [AHControll createTextFieldWithFrame:CGRectMake(10, kNavBarHAbove7+160, SCREEN_WIDTH-20, 50) placeholder:@"请输入数量" textColor:UIColor.redColor Font:17 Alignment:NSTextAlignmentLeft];
    text1.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    text2.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    [self.view addSubview:text2];
    UIView *line = [AHControll viewWithFrame:CGRectMake(10, kNavBarHAbove7+210, SCREEN_WIDTH-20, 1) viewColor:COLOR];
    [self.view addSubview:line];
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
