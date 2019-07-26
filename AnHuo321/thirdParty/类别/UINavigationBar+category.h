//
//  UINavigationBar+category.h
//  TianYuanShiJi
//
//  Created by a451282 on 2017/12/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (category)

/**
 处理导航栏上BarButtonItem的触发面积过大
  */
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event ;
@end
