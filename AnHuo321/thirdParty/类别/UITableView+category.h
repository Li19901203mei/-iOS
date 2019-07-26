//
//  UITableView+category.h
//  IntelligenceStudents
//
//  Created by xiaoshunliang on 2016/12/16.
//  Copyright © 2016年 GaoJuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (category)
/**
 *  hide bottom separators
 */
- (void)hideEmptySeparators;

/**
 设置cell的分割线距离左边的距离

 @param leftInset 边距
 */
+ (void)setTableViewLeftSeparatorInset:(CGFloat)leftInset;
@end
