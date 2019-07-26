//
//  UIButton+category.h
//  scaleBtnScope
//
//  Created by xiaoshunliang on 16/6/5.
//  Copyright © 2016年 bodaokeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (category)
/**
 *  扩大按钮的点击范围（insets必须不被button的superview给挡住）
 *  例如:  UIEdgeInsetsMake(-30, -30, -30, -30)
 */
@property(nonatomic, assign) UIEdgeInsets hitEdgeInsets;
//子视图的坐标转换的父视图上
- (CGRect)changePointToParentView;
@end
