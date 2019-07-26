//
//  UIView+Border.h
//  IntelligenceStudents
//
//  Created by xiaoshunliang on 2017/8/25.
//  Copyright © 2017年 GaoJuan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, UIBorderSideType) {
    UIBorderSideTypeAll  = 0,
    UIBorderSideTypeTop = 1 << 0,
    UIBorderSideTypeBottom = 1 << 1,
    UIBorderSideTypeLeft = 1 << 2,
    UIBorderSideTypeRight = 1 << 3,
};

@interface UIView (Border)


/**
 给多个View添加背景颜色

 @param arr 里面是继承UIView的控件
 @param color 设置背景颜色
 */
+ (void)configUIViewBackgroundColorArr:(NSArray *)arr backColor:(UIColor *)color;
/**
 给多个View添加圆角
 
 @param arr 里面是继承UIView的控件
 @param radius 设置角度
 */
+ (void)configUIViewBorderColorArr:(NSArray *)arr borderRadius:(NSInteger)radius;

/**
 批量给Label标题设置字体颜色

 @param arr 里面是继承UIView的控件
 @param color 设置标题颜色
 */
+ (void)configUILabelTitleColorArr:(NSArray *)arr backColor:(UIColor *)color;
/**
 切指定view圆角
 @param borderType 边框圆角
 @param borderRadio 边框圆角
 */
- (UIView *)cutTopLeftAndTopRightBorderType:(UIRectCorner)borderType borderRadio:(CGFloat)borderRadio;
//子视图的坐标转换到window上
- (CGRect)changePointToParentView;

/**
 给View添加指定的边框
 */
- (UIView *)borderForColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderType:(UIBorderSideType)borderType;
/**
 设置view的边框
 
 @param borderWidth 边框宽度 (宽度为0 时表示屋边框)
 @param borderColor 边框颜色
 @param borderRadio 边框圆角
 */
- (void)boredWidth:(CGFloat)borderWidth boredColor:(UIColor *)borderColor borderRadio:(CGFloat)borderRadio;

@end
