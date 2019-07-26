//
//  NSUserDefaults+category.m
//  OrganizationDepartment
//
//  Created by xiaoshunliang on 16/10/12.
//  Copyright © 2016年 bodaokeji. All rights reserved.
//

#import "NSUserDefaults+category.h"

@implementation NSUserDefaults (category)
+ (void)reset {
    [[self standardUserDefaults] removePersistentDomainForName:[[NSBundle mainBundle] bundleIdentifier]];
    [[self standardUserDefaults] synchronize];
}

@end
