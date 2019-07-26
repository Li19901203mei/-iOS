//
//  UIImage+category.h
//  MiYun360
//
//  Created by xiaoshunliang on 16/5/20.
//  Copyright © 2016年 AUNotBad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accelerate/Accelerate.h>
@interface UIImage (category)
/**
 *  根据颜色,返回这个颜色的iamge
 *
 *  @param color 你想要的颜色
 *
 *  @return 带颜色的image
 */
+ (UIImage *)imageWithBgColor:(UIColor *)color;
/**
 *  加载本地图片
 */
+ (UIImage *)locatilyImage:(NSString *)ImgName;
/**
 *  CoreImage图片高斯模糊 这样模糊化的图片周边有10px的间距
 *
 *  @param image 图片
 *  @param blur  模糊数值(默认是10)
 *
 *  @return 重新绘制的新图片
 */

+(UIImage *)coreBlurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;
/**
 *  vImage模糊图片
 *
 *  @param image 原始图片
 *  @param blur  模糊数值(0-1)
 *
 *  @return 重新绘制的新图片
 */
+(UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;
/**
 *  多张image合成一张image
 *
 *  @param imageArray  存放图片的数组
 *  @param offsetArray 存放图片所处位置的frame(转成nsvalue存到数组中)
 *  @param size        背景imageView的size
 *
 *  @return 返回size大小的合成image
 */
+ (UIImage *)mixImageWithImageArray:(NSArray *)imageArray andImageOffsetArray:(NSArray *)offsetArray andBackImageViewSize:(CGSize)size;
/**
 *  image的拉伸
 *
 *  @param capInsets 你想要的拉伸的范围
 *  @param image     想要被拉伸的image
 *
 *  @return 拉伸后的image
 */
+ (UIImage *)resizableImageWithCapInsets:(UIEdgeInsets)capInsets image:(UIImage *)image;
/**
 *  生成带边框的image
 *
 *  @param borderW 边框的宽度
 *  @param color   边框的颜色
 *
 *  @return 带边框的image
 */
- (UIImage *)imageWithBorderW:(CGFloat)borderW borderColor:(UIColor *)color;
/**
 *  给图片加水印
 *
 *  @param image     背景image(想要加水印的image)
 *  @param logoImage 水印image
 *
 *  @return 加了水印logoimage的image
 */
+ (UIImage *)waterImageWith:(UIImage *)image logo:(UIImage *)logoImage;
/**
 *  修改图片size
 *
 *  @param image      原图片
 *  @param targetSize 要修改的size
 *
 *  @return 修改后的图片
 */
+ (UIImage *)image:(UIImage*)image byScalingToSize:(CGSize)targetSize;
@end
