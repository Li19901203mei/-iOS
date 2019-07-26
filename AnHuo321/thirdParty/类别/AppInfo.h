//
//  AppInfo.h
//  OrganizationDepartment
//
//  Created by xiaoshunliang on 16/9/16.
//  Copyright © 2016年 bodaokeji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppInfo : NSObject
/**
 *  Shorthand    CGRectGetWidth
 */
#define ccp(x, y)              CGPointMake(x, y)
#define ccs(w, h)              CGSizeMake(w, h)
#define ccei(x, y, b, r)       UIEdgeInsetsMake(x, y, b, r)
#define ccr(t, l, w, h)        CGRectMake(t, l, w, h)
#define cch(h)                 CGRectGetHeight(h.frame)
#define ccw(w)                 CGRectGetWidth(w.frame)
#define ccx(x)                 CGRectGetMaxX(x.frame)
#define ccy(y)                 CGRectGetMaxY(y.frame)

#define SCRREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCRREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SCALE (SCREEN_HEIGHT/568<=1? 1: SCREEN_HEIGHT/568)
#define Weak_Self(weakSelf) __weak typeof(self) weakSelf = self


#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr, "[%s:%d行] %s\n", [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#define JiGuangIsProduction  YES
#else
#define NSLog(FORMAT, ...) nil
#define JiGuangIsProduction  false
#endif
//颜色
#define backGroundCorlor    [UIColor colorWithRGB:@"242,242,250"]
#define SELECTED_BACKGROUND_COLOR  [UIColor colorWithHexString:@"f5f5f5"]
//#define BaseTheme_Colore [UIColor colorWithRed:189/255.0 green:32/255.0 blue:12/255.0 alpha:1]
#define BaseTheme_Colore   [UIColor colorWithHexString:@"#d02422"]
#define Color333           [UIColor colorWithHexString:@"#333333"]
#define Color666           [UIColor colorWithHexString:@"#666666"]
#define Color999           [UIColor colorWithHexString:@"#999999"]

//默认图片
#define DEFAULT_IMG [UIImage imageNamed:@"cellDefault"]
#define DEFAULT_IMG_BANNER [UIImage imageNamed:@"bannerDefault"]
#define DEFAULT_HEADERIMG [UIImage imageNamed:@"ic-head.png"]
#define ImgWithName(a)   [UIImage imageNamed:a]
#define UrlWithStr(a)    [NSURL URLWithString:a]
//后台返回数据
#define IsRequestSuccess   [[result objectForKey:@"status"] integerValue] == 1
#define RequestMessage     [result objectForKey:@"message"]

//项目中简写
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]
#define Center [NSNotificationCenter defaultCenter]

#define     IS_IPHONE_X  ((SCRREEN_HEIGHT == 812.f || SCRREEN_HEIGHT == 896.f) ? YES : NO)

#define NavHeight (IS_IPHONE_X?88:64)
#define StatusBarHeight (IS_IPHONE_X?44:20)

#define  TableRegisterNib(table,cell) [table registerNib:[UINib nibWithNibName:cell bundle:nil] forCellReuseIdentifier:cell]
#define  StrEqualTo(str1,str2)  [str1 isEqualToString:str2]
#define  CollectionRegisterNib(collection,cell) [collection registerNib:[UINib nibWithNibName:cell bundle:nil] forCellWithReuseIdentifier:cell]

#define  Is_Not_Login [NSString isBlankString:[UserModel shareUser].user_id]

//用户数据模型存的目录
#define _userModelFile  [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex: 0]  stringByAppendingPathComponent:@"userDataModel.data"]
//友盟分享的数据 appKey appSecret
#define UmSocialAppkey @"587438b1734be47ba90026e5"
#define WX_Appkey @"wx20ff2fa0e350e816"
#define WX_AppSecret @"5d957913aebf2bf1af998adeeb67ca76"
#define QQ_Appkey @"1105939682"
#define Sina_Appkey @"2209155275"
#define Sina_AppSecret @"e11aa0390b8ea73de46b14de87761805"
#define Sina_RedirectURL @"http://bodaokeji.com"

//环信的加密方式  学生(stu) 老师(tea)的账号密码
#define ease_STU @"zhihuiyanxue"
#define ease_TEA @"zhihuiyanxue1"







@end
