
//
//  UIWebView+category.m
//  IntelligenceStudents
//
//  Created by xiaoshunliang on 2016/12/16.
//  Copyright © 2016年 GaoJuan. All rights reserved.
//

#import "UIWebView+category.h"

@implementation UIWebView (category)

- (void)removeBackgroundShadow
{
    for(UIView *eachSubview in [self.scrollView subviews])
    {
        if([eachSubview isKindOfClass:[UIImageView class]] && eachSubview.frame.origin.x <= 500)
        {
            eachSubview.hidden = YES;
            [eachSubview removeFromSuperview];
        }
    }
}

- (void)loadWebsite:(NSString *)website
{
    [self loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:website]]];
}

@end
