//
//  NSDate+category.m
//  OrganizationDepartment
//
//  Created by xiaoshunliang on 16/8/13.
//  Copyright © 2016年 bodaokeji. All rights reserved.
//

#import "NSDate+category.h"

@implementation NSDate (category)
+(NSString *)getNowTimeTimestampStr{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970];
    NSString*timeString = [NSString stringWithFormat:@"%0.f", a];//转为字符型
    return timeString;
}
+(NSTimeInterval)getNowTimeTimestampInt{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a =[dat timeIntervalSince1970];
    //    NSString*timeString = [NSString stringWithFormat:@"%0.f", a];//转为字符型
    return a;
}
+ (NSString *)getDetailTimeWithTimestampCopareDate:(NSInteger)nowDate timestamp:(NSInteger)timestamp{


    NSInteger now = nowDate;
    timestamp = timestamp;
    timestamp = timestamp - now;
    if (timestamp<=0) {
        return @"超时未支付";
    }
    NSInteger ms = timestamp;
    NSInteger ss = 1;
    NSInteger mi = ss * 60;
    NSInteger hh = mi * 60;
    NSInteger dd = hh * 24;

    // 剩余的
    NSInteger day = ms / dd;// 天
    NSInteger hour = (ms - day * dd) / hh;// 时
    NSInteger minute = (ms - day * dd - hour * hh) / mi;// 分
    NSInteger second = (ms - day * dd - hour * hh - minute * mi) / ss;// 秒
    NSString *str;
    if (day>0) {
        str = [NSString stringWithFormat:@"剩余时间:%zd日:%zd时:%zd分:%zd秒",day,hour,minute,second];
        return str;
    }else if (hour>0) {
        str = [NSString stringWithFormat:@"剩余时间:%zd时:%zd分:%zd秒",hour,minute,second];
        return str;
    }else{
        str = [NSString stringWithFormat:@"剩余时间:%zd分:%zd秒",minute,second];
    }
    return str;
    //    NSLog(@"%zd日:%zd时:%zd分:%zd秒",day,hour,minute,second);
    //    NSLog(@"=====%@",str);
}
/**
 比较两个时间大小

 @param format 比较的时间格式
 @param firstime 开始时间
 @param secondTime 结束时间
 */
+ (BOOL)compareTwoTimeFormat:(NSString *)format firstTime:(NSString *)firstime secondTime:(NSString *)secondTime{
    NSDateFormatter *dateformater = [[NSDateFormatter alloc] init];
    [dateformater setDateFormat:format];
    NSDate *dta = [dateformater dateFromString:firstime];
    NSDate *dtb = [dateformater dateFromString:secondTime];
    NSComparisonResult result = [dta compare:dtb];
    if (result == NSOrderedAscending || result == NSOrderedSame)
    {
        return YES;
    }else{
        return NO;
    }
}
@end
