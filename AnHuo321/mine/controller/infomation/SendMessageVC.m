//
//  SendMessageVC.m
//  AnHuo321
//
//  Created by 123 on 2019/7/24.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import "SendMessageVC.h"

@interface SendMessageVC ()
@property (weak, nonatomic) IBOutlet UITextView *contentTV;
@property (weak, nonatomic) IBOutlet UIButton *sendBtn;

@end

@implementation SendMessageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"发送站内信";
    self.contentTV.placeholder = @"填写你要发送的内容,小于120个字符";
    [self.contentTV createBordersWithColor:backGroundCorlor withCornerRadius:3 andWidth:1];
    [self.sendBtn createBordersWithColor:backGroundCorlor withCornerRadius:3 andWidth:0];
    Weak_Self(weakSelf);
    [[self.sendBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        if ([NSString isBlankString:weakSelf.contentTV.text]) {
            ShowToastWithText(@"请填写你要发送的内容");
            return ;
        }
        NSMutableDictionary *dicM = [NSMutableDictionary dictionary];
       
        
        [Manager post:KURLNSString(@"Memberapi/mysms") RequestParams:dicM FinishBlock:^(NSURLResponse * _Nonnull response, NSData * _Nonnull data, NSError * _Nonnull connectionError) {
            NSDictionary *dict = [Manager returndictiondata:data];
            if ([dict[@"status"] integerValue] == 1) {
                ShowToastWithText(@"发送成功");
            }
        }];
    }];
}



@end
