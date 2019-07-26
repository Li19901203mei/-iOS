
//
//  CommonWebVC.m
//  EcologicalMiYun
//
//  Created by 123 on 2019/6/22.
//  Copyright © 2019 123. All rights reserved.
//

#import "CommonWebVC.h"
#import <WebKit/WebKit.h>
@interface CommonWebVC ()<WKUIDelegate,WKNavigationDelegate>
@property (nonatomic,strong) UIButton *closeBtn;
@property (nonatomic,strong) WKWebView *web;
@property (nonatomic, strong) UIProgressView * loadingProgressView;
@end

@implementation CommonWebVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"快递查询";
   
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    // 创建设置对象
    WKPreferences *preference = [[WKPreferences alloc]init];
    // 在iOS上默认为NO，表示是否允许不经过用户交互由javaScript自动打开窗口
    preference.javaScriptCanOpenWindowsAutomatically = YES;
    config.preferences = preference;
    
    // 是使用h5的视频播放器在线播放, 还是使用原生播放器全屏播放
    config.allowsInlineMediaPlayback = YES;
    //设置视频是否需要用户手动播放  设置为NO则会允许自动播放
    config.requiresUserActionForMediaPlayback = YES;
    //设置是否允许画中画技术 在特定设备上有效
    config.allowsPictureInPictureMediaPlayback = YES;
    //设置请求的User-Agent信息中应用程序名称 iOS9后可用
    config.applicationNameForUserAgent = @"ChinaDailyForiPad";

        self.web = [[WKWebView alloc] initWithFrame:CGRectMake(0, NavHeight, SCREEN_WIDTH, SCREEN_HEIGHT- NavHeight) configuration:config];
        self.web.UIDelegate = self;
        self.web.navigationDelegate = self;
        [self.view addSubview:self.web];
    
    [self obtainDetail];
    
    
}
- (void)obtainDetail{
    NSMutableDictionary *dicM = [NSMutableDictionary dictionary];
    [dicM setObject:self.order_no forKey:@"order_no"];
    [dicM setObject:@"deliver" forKey:@"type"];
    [Manager requestGETWithURLStr:KURLNSString(@"index.php?s=/Memberapi/showExpress") paramDic:dicM finish:^(id  _Nonnull dict) {
        NSLog(@"---------%@",dict);
        [self.web loadHTMLString:dict[@"info"][@"html"] baseURL:nil];
    } enError:^(NSError * _Nonnull error) {
        
    }];
}

@end
