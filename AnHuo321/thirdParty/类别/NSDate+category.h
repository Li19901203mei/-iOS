//
//  NSDate+category.h
//  OrganizationDepartment
//
//  Created by xiaoshunliang on 16/8/13.
//  Copyright © 2016年 bodaokeji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (category)
/**
 获取当前时间撮
 */
+(NSString *)getNowTimeTimestampStr;
/**
 获取当前时间撮
 */
+(NSTimeInterval)getNowTimeTimestampInt;
/**
 时间差转换为 xx 日 xx 时 xx 分 xx 秒  nowDate 当前时间撮  timestamp 要比较的时间撮
 */
+ (NSString *)getDetailTimeWithTimestampCopareDate:(NSInteger)nowDate timestamp:(NSInteger)timestamp;

/**
 比较两个时间大小

 @param format 比较的时间格式
 @param firstime 开始时间
 @param secondTime 结束时间
 */
+ (BOOL)compareTwoTimeFormat:(NSString *)format firstTime:(NSString *)firstime secondTime:(NSString *)secondTime;
@end
