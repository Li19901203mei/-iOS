//
//  UILabel+category.h
//  BeautyMall
//
//  Created by 房房信 on 2018/7/17.
//  Copyright © 2018年 房房信. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (category)

/**
 *  字间距
 */
@property (nonatomic,assign)CGFloat characterSpace;

/**
 *  行间距
 */
@property (nonatomic,assign)CGFloat lineSpace;

/**
 *  关键字
 */
@property (nonatomic,copy)NSString *keywords;
@property (nonatomic,strong)UIFont *keywordsFont;
@property (nonatomic,strong)UIColor *keywordsColor;

/**
 *  下划线
 */
@property (nonatomic,copy)NSString *underlineStr;
@property (nonatomic,strong)UIColor *underlineColor;

/**
 *  计算label宽高，必须调用
 *
 *  @param maxWidth 最大宽度
 *
 *  @return label的size
 */
- (CGSize)getLableSizeWithMaxWidth:(CGFloat)maxWidth;
/**
 一段文字中有不同的颜色大小的字体

 @param firstLoc 从哪一个字体开始
 @param secondLoc 到哪一个字体结算
 @param changeColor 什么颜色
 @param fontsize 大小
 */
- (void)setColorTextWithFistText:(NSInteger)firstLoc andLastText:(NSInteger)secondLoc andChangeColor:(UIColor *)changeColor andTextFontsize:(CGFloat )fontsize;

/**
 一段文字设置中划线

 @param firstLoc 开始位置
 @param secondLoc 结束位置
 @param changeColor 字体颜色
 @param fontsize 字体大小
 */
- (void)setLineTextWithFistText:(NSInteger)firstLoc andLastText:(NSInteger)secondLoc andChangeColor:(UIColor *)changeColor andTextFontsize:(CGFloat )fontsize;
@end
