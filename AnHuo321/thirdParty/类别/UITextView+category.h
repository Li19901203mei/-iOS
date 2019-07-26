//
//  UITextView+category.h
//  OrganizationDepartment
//
//  Created by xiaoshunliang on 16/8/13.
//  Copyright © 2016年 bodaokeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (category)
@property (nonatomic, readonly) UILabel *placeholderLabel;

@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) UIColor *placeholderColor;

+ (UIColor *)defaultPlaceholderColor;

@end
