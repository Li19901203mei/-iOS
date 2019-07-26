//
//  AboutXiangViewController.m
//  AnHuo321
//
//  Created by 二恒 on 2019/7/25.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import "AboutXiangViewController.h"

@interface AboutXiangViewController ()

@end

@implementation AboutXiangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =BassColor(241, 241, 241);
    UITextView * textView =[[UITextView alloc]init];
    textView.font =(isIPhoneX ? isFont(20) : isFont(18));
    textView.text = self.xiangStr;
    textView.editable = NO;
    textView.userInteractionEnabled =YES;
    textView.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-kSafeAreaBottomHeight);
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
