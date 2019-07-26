//
//  UITextField+category.h
//  OrganizationDepartment
//
//  Created by xiaoshunliang on 16/10/12.
//  Copyright © 2016年 bodaokeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (category)
/**
 *  Set limit length
 *
 *  @param length max length
 */
- (void)limitTextLength:(NSInteger)length;


/**
 *  Set limit length
 *
 *  设置placerHolder的颜色
 */
- (void)setPlaceholderColor:(UIColor *)placeholderColor;

@end
