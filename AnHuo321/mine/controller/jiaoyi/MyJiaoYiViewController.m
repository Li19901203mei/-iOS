//
//  MyJiaoYiViewController.m
//  AnHuo321
//
//  Created by 吕书涛 on 2019/4/7.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import "MyJiaoYiViewController.h"
#import "MyJiaoYi_One_ViewController.h"
#import "MyJiaoYi_Two_ViewController.h"

@interface MyJiaoYiViewController ()

@end

@implementation MyJiaoYiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    MyJiaoYi_One_ViewController *vc1 = [[MyJiaoYi_One_ViewController alloc] init];
    vc1.title = @"已报价";
    
    MyJiaoYi_Two_ViewController *vc2 = [[MyJiaoYi_Two_ViewController alloc] init];
    vc2.title = @"我的发布";
   
    self.viewControllers = @[vc1,vc2];
    
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
