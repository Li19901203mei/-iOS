//
//  UITableViewController+category.m
//  IntelligenceStudents
//
//  Created by xiaoshunliang on 2016/12/16.
//  Copyright © 2016年 GaoJuan. All rights reserved.
//

#import "UITableViewController+category.h"

@implementation UITableViewController (category)
- (void)hideEmptySeparators {
    UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
    
    v.backgroundColor = [UIColor clearColor];
    [self.tableView setTableFooterView:v];
}

@end
