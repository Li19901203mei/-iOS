//
//  UIImage+category.m
//  MiYun360
//
//  Created by xiaoshunliang on 16/5/20.
//  Copyright © 2016年 AUNotBad. All rights reserved.
//

#import "UIImage+category.h"

@implementation UIImage (category)
+ (UIImage *)imageWithBgColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}
+ (UIImage *)locatilyImage:(NSString *)ImgName{
    
//    NSString *path = [[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"%@",ImgName] ofType:@"png"];
//    NSLog(@"path-------%@",path);
//    UIImage *image = [UIImage imageWithContentsOfFile:path];
//    return image;
//
    
    if ( SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")) {
        NSString *bundlePath = [NSBundle mainBundle].resourcePath;
        UIImage *image = [UIImage imageWithContentsOfFile:[bundlePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",ImgName]]];
        return image;
  
    }else{
        UIImage  *image = [UIImage imageNamed:ImgName];
        return image;
    }
}

+(UIImage *)coreBlurImage:(UIImage *)image
           withBlurNumber:(CGFloat)blur {
    //博客园-FlyElephant
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage  *inputImage=[CIImage imageWithCGImage:image.CGImage];
    //设置filter
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:@(blur) forKey: @"inputRadius"];
    //模糊图片
    CIImage *result=[filter valueForKey:kCIOutputImageKey];
    CGImageRef outImage=[context createCGImage:result fromRect:[result extent]];
    UIImage *blurImage=[UIImage imageWithCGImage:outImage];
    CGImageRelease(outImage);
    return blurImage;
}

+(UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur {
    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    /**
     *  这地方也可以修改透明度
     */
    int boxSize = (int)(blur * 100);
    boxSize = boxSize - (boxSize % 2) + 1;
    
    CGImageRef img = image.CGImage;
    
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    
    void *pixelBuffer;
    //从CGImage中获取数据
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    //设置从CGImage获取对象的属性
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) *
                         CGImageGetHeight(img));
    
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(
                                             outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    CFRelease(inBitmapData);
    
    CGImageRelease(imageRef);
    
    return returnImage;
}
+ (UIImage *)mixImageWithImageArray:(NSArray *)imageArray andImageOffsetArray:(NSArray *)offsetArray andBackImageViewSize:(CGSize)size
{
    if (imageArray.count == 0) {
        return nil;
    }
    if (imageArray.count == 1) {
        return imageArray[0];
    }
    if (!imageArray.count == offsetArray.count) {
        return nil;
    }
    
    UIGraphicsBeginImageContext(size);
    for (int i =  0; i < imageArray.count; i++) {
        UIImage *image = imageArray[i];
        NSValue *value = offsetArray[i];
        CGRect rect = [value CGRectValue];
        [image drawInRect:rect];
    }
    
    UIImage *resultingImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}
+ (UIImage *)resizableImageWithCapInsets:(UIEdgeInsets)capInsets image:(UIImage *)image
{
    UIImage *newImage = [image resizableImageWithCapInsets:capInsets resizingMode:UIImageResizingModeStretch];
    return newImage;
}
- (UIImage *)imageWithBorderW:(CGFloat)borderW borderColor:(UIColor *)color
{
    //开启图片大小一样的上下文
    CGSize size = CGSizeMake(self.size.width + 2 *borderW, self.size.height + 2 * borderW);
    UIGraphicsBeginImageContextWithOptions(size,NO,0);
    //添加一个填充区域
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [color set];
    [path fill];
    //添加一个裁剪区域
    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, self.size.width, self.size.height)];
    [path addClip];
    //添加图片到裁剪区域
    [self drawAtPoint:CGPointMake(borderW, borderW)];
    //得到新图片
    UIImage *clipImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文.
    UIGraphicsEndImageContext();
    return clipImage;
}
+ (UIImage *)waterImageWith:(UIImage *)image logo:(UIImage *)logoImage
{
    // 上下文 : 基于位图(bitmap) ,  所有的东西需要绘制到一张新的图片上去
    // 1.创建一个基于位图的上下文(开启一个基于位图的上下文)
    // size : 新图片的尺寸
    // opaque : YES : 不透明,  NO : 透明
    // 这行代码过后.就相当于创建一张新的bitmap,也就是新的UIImage对象
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    
    // 画背景
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    // 画右下角的水印
    CGFloat scale = 0.2;
    CGFloat logoW = logoImage.size.width * scale;
    CGFloat logoH = logoImage.size.height * scale;
    CGFloat margin = 5;
    CGFloat logoX = image.size.width - logoW - margin;
    CGFloat logoY = image.size.height - logoH - margin;
    CGRect rect = CGRectMake(logoX, logoY, logoW, logoH);
    [logoImage drawInRect:rect];
    // 从上下文中取得制作完毕的UIImage对象
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}
/**
 *  修改图片size
 *
 *  @param image      原图片
 *  @param targetSize 要修改的size
 *
 *  @return 修改后的图片
 */
+ (UIImage *)image:(UIImage*)image byScalingToSize:(CGSize)targetSize {
    UIImage *sourceImage = image;
    UIImage *newImage = nil;
    
    UIGraphicsBeginImageContext(targetSize);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = CGPointZero;
    thumbnailRect.size.width  = targetSize.width;
    thumbnailRect.size.height = targetSize.height;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage ;
}
@end
