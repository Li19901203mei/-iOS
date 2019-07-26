//
//  UITableView+category.m
//  IntelligenceStudents
//
//  Created by xiaoshunliang on 2016/12/16.
//  Copyright © 2016年 GaoJuan. All rights reserved.
//

#import "UITableView+category.h"

@implementation UITableView (category)
- (void)hideEmptySeparators {
    UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
    
    v.backgroundColor = [UIColor clearColor];
    [self setTableFooterView:v];
}
//这段代码临时写在这里
+ (void)setTableViewLeftSeparatorInset:(CGFloat)leftInset{
    [[UITableView appearance] setSeparatorInset:UIEdgeInsetsMake(0, leftInset, 0, 0)];
    [[UITableViewCell appearance] setSeparatorInset:UIEdgeInsetsMake(0, leftInset, 0, 0)];
    if ([UITableView instancesRespondToSelector:@selector(setLayoutMargins:)]) {

        [[UITableView appearance] setLayoutMargins:UIEdgeInsetsMake(0, leftInset, 0, 0)];
        [[UITableViewCell appearance] setLayoutMargins:UIEdgeInsetsMake(0, leftInset, 0, 0)];
        [[UITableViewCell appearance] setPreservesSuperviewLayoutMargins:NO];
    }
}
@end
