//
//  MyAttentionViewController.m
//  AnHuo321
//
//  Created by 吕书涛 on 2019/4/7.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import "MyAttentionViewController.h"
#import "MyAttention_One_ViewController.h"
#import "MyAttention_Two_ViewController.h"

@interface MyAttentionViewController ()

@end

@implementation MyAttentionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title =@"关注的交易";
    MyAttention_One_ViewController *vc2 = [[MyAttention_One_ViewController alloc] init];
    vc2.title = @"交易";
    
    MyAttention_Two_ViewController *vc3 = [[MyAttention_Two_ViewController alloc] init];
    vc3.title = @"用户";
    
    self.viewControllers = @[vc2, vc3];
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
