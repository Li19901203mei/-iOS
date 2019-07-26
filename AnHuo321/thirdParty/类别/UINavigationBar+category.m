//
//  UINavigationBar+category.m
//  TianYuanShiJi
//
//  Created by a451282 on 2017/12/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "UINavigationBar+category.h"
#import <objc/runtime.h>
#define kSpacerWidth kAppAdaptWidth(15)
#define kSpacerWidth 5
@implementation UINavigationBar (category)
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    if ([self pointInside:point withEvent:event]) {
        self.userInteractionEnabled = YES;
    } else {
        self.userInteractionEnabled = NO;
    }
    
    return [super hitTest:point withEvent:event];
}

@end
