//
//  UIView+Border.m
//  IntelligenceStudents
//
//  Created by xiaoshunliang on 2017/8/25.
//  Copyright © 2017年 GaoJuan. All rights reserved.
//

#import "UIView+Border.h"

@implementation UIView (Border)

+ (void)configUIViewBackgroundColorArr:(NSArray *)arr backColor:(UIColor *)color{
    for (NSInteger i=0; i<arr.count; i++) {
        UIView *view = [arr safeObjectAtIndex:i];
        view.backgroundColor = color;
    }
}
+ (void)configUIViewBorderColorArr:(NSArray *)arr borderRadius:(NSInteger)radius{
    for (NSInteger i=0; i<arr.count; i++) {
        UIView *view = [arr safeObjectAtIndex:i];
        view.layer.cornerRadius = radius;
        view.layer.masksToBounds = YES;
        view.layer.borderColor = BaseTheme_Colore.CGColor;
        view.layer.borderWidth = 1;
    }
}
+ (void)configUILabelTitleColorArr:(NSArray *)arr backColor:(UIColor *)color{
    for (NSInteger i=0; i<arr.count; i++) {
        UILabel *view = (UILabel *)[arr safeObjectAtIndex:i];
        view.textColor = color;
    }
}
/**
 切指定view圆角
 @param borderType 边框圆角
 @param borderRadio 边框圆角
 */
- (UIView *)cutTopLeftAndTopRightBorderType:(UIRectCorner)borderType borderRadio:(CGFloat)borderRadio{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:borderType cornerRadii:CGSizeMake(borderRadio, borderRadio)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    return self;
}
- (CGRect)changePointToParentView{
    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
    CGRect rect=[self convertRect: self.bounds toView:window];
    return rect;
}
- (UIView *)borderForColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderType:(UIBorderSideType)borderType {
    
    if (borderType == UIBorderSideTypeAll) {
        self.layer.borderWidth = borderWidth;
        self.layer.borderColor = color.CGColor;
        return self;
    }
    
    
    /// 左侧
    if (borderType & UIBorderSideTypeLeft) {
        /// 左侧线路径
        [self.layer addSublayer:[self addLineOriginPoint:CGPointMake(0.f, 0.f) toPoint:CGPointMake(0.0f, self.frame.size.height) color:color borderWidth:borderWidth]];
    }
    
    /// 右侧
    if (borderType & UIBorderSideTypeRight) {
        /// 右侧线路径
        [self.layer addSublayer:[self addLineOriginPoint:CGPointMake(self.frame.size.width - 1, 0.0f) toPoint:CGPointMake( self.frame.size.width - 1, self.frame.size.height) color:color borderWidth:borderWidth]];
    }
    
    /// top
    if (borderType & UIBorderSideTypeTop) {
        /// top线路径
        [self.layer addSublayer:[self addLineOriginPoint:CGPointMake(0.0f, 0.0f) toPoint:CGPointMake(self.frame.size.width, 0.0f) color:color borderWidth:borderWidth]];
    }
    
    /// bottom
    if (borderType & UIBorderSideTypeBottom) {
        /// bottom线路径
        [self.layer addSublayer:[self addLineOriginPoint:CGPointMake(0.0f, self.frame.size.height) toPoint:CGPointMake( self.frame.size.width, self.frame.size.height) color:color borderWidth:borderWidth]];
    }
    
    return self;
}
- (CAShapeLayer *)addLineOriginPoint:(CGPoint)p0 toPoint:(CGPoint)p1 color:(UIColor *)color borderWidth:(CGFloat)borderWidth {
    
    /// 线的路径
    UIBezierPath * bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:p0];
    [bezierPath addLineToPoint:p1];
    
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = color.CGColor;
    shapeLayer.fillColor  = [UIColor clearColor].CGColor;
    /// 添加路径
    shapeLayer.path = bezierPath.CGPath;
    /// 线宽度
    shapeLayer.lineWidth = borderWidth;
    return shapeLayer;
}
/**
 设置view的边框
 
 @param borderWidth 边框宽度
 @param borderColor 边框颜色
 @param borderRadio 边框圆角
 */
- (void)boredWidth:(CGFloat)borderWidth boredColor:(UIColor *)borderColor borderRadio:(CGFloat)borderRadio{
    if (borderWidth>0) {
        self.layer.borderWidth = borderWidth;
        self.layer.borderColor = borderColor.CGColor;
    }
    self.layer.cornerRadius = borderRadio;
    self.layer.masksToBounds = YES;
}
@end
