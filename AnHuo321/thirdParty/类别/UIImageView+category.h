//
//  UIImageView+category.h
//  MiYun360
//
//  Created by xiaoshunliang on 16/5/19.
//  Copyright © 2016年 AUNotBad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (category)
/**
 * 指定宽度 高度按比例缩放
 */
+(UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;
/**
 *  点击浏览大图
 *
 *  @param myImageView 原始img
 */
+ (void)showImage:(UIImageView *)myImageView;
@end
