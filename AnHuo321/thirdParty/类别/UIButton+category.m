//
//  UIButton+category.m
//  scaleBtnScope
//
//  Created by xiaoshunliang on 16/6/5.
//  Copyright © 2016年 bodaokeji. All rights reserved.
//

#import "UIButton+category.h"
#import <objc/runtime.h>

static void * kHitEdgeInsetsKey = &kHitEdgeInsetsKey;

@implementation UIButton (category)

- (void)setHitEdgeInsets:(UIEdgeInsets)hitEdgeInsets
{
    NSValue *value = [NSValue valueWithUIEdgeInsets:hitEdgeInsets];
    objc_setAssociatedObject(self, kHitEdgeInsetsKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)hitEdgeInsets
{
    NSValue * value = objc_getAssociatedObject(self, kHitEdgeInsetsKey);
    if(value) {
        return [value UIEdgeInsetsValue];
    }
    
    return UIEdgeInsetsZero;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    if (UIEdgeInsetsEqualToEdgeInsets(self.hitEdgeInsets, UIEdgeInsetsZero) || !self.enabled || self.hidden) {
        return [super pointInside:point withEvent:event];
    }
    
    CGRect hitFrame = UIEdgeInsetsInsetRect(self.bounds, self.hitEdgeInsets);
    
    return CGRectContainsPoint(hitFrame, point);
}
- (CGRect)changePointToParentView{
    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
    CGRect rect=[self convertRect: self.bounds toView:window];
    return rect;
}

@end
