//
//  NSString+category.h
//  MiYun360
//
//  Created by xiaoshunliang on 16/5/12.
//  Copyright © 2016年 AUNotBad. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ExamDataAnswerModel;
@class ChallengeExamDataModel;

@interface NSString (category)
//提交数据是空数据用户提示 结构形式  @[@{@"提示语":要不断对象}]
+ (NSString *)showTip:(NSArray *)messageArr;
//判读是不是空字符串
+ (BOOL)isBlankString:(NSString *)string;

//时间转化为年月日
+ (NSString *)fromTimeStringToTimeFormat:(NSString *)format timeString:(NSString *)timeString;
//月日
+ (NSString *)fromTimeStringToDayAndMonth:(NSString *)timeString;
/**
 *  指定字体的大小返回frame
 */
+ (CGRect)boundsWithFontSize:(CGFloat)fontSize text:(NSString *)text needWidth:(CGFloat)needWidth;
/**
 *  指定行数的大小返回frame
 */
+ (CGFloat)boundsWithFontSize:(CGFloat)fontSize text:(NSString *)text needWidth:(CGFloat)needWidth lineNumber:(NSInteger)lineNumber;
/**
 *  将字符串转化为json
 */
+ (NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString;
/**
 *  替换掉null的字符串
 */

+ (NSString *)nullString:(NSString *)nullStr;


/**
 *  当前时间
 */

+ (NSString *)timeIsConvertedIntoDigital:(NSDate *)date;
/**
 *  用特定的格式显示当前时间
 */
+ (NSString *)setTheCurrentTimeWithFormat:(NSDate *)date;
/**
 *  刚刚，5秒前，1分钟前，1小时前等等
 *
 */
+ (NSString*)timeAgoWithDate:(NSString*)date;

/**
 *  用当前时间 - 结束时间 来比较看是否答题已经结束
 */
+ (BOOL)isCurrentTimeCutEndTimeWithDate:(NSDate *)date endTime:(NSString*)endTimeStr;


// 判断是不是包涵http 没有的话添家 HOST_URL

+(NSString *)backUrlAddHttp:(NSString *)Url;

/**
 *  是不是中文
 */
- (BOOL)isChinese;
/**
 *  判断是不是手机号
 */
- (BOOL)isValidMobileNumber;
/**
 *  Create a MD5 string from self
 *
 *  @return Return the MD5 NSString from self
 */
- (NSString *)MD5;
+ (NSString *)MD5;
+ (NSString *)encodeUrlStr:(NSString *)urlStr;
/**
 *  获取接下来的几天
 *
 *  @param aDate     当前日期 [NSDate date]
 *  @param dayCount  接下来的天数
 *  @param dayFormat 得到日期的格式
 */
+ (NSMutableArray *)TomorrowDay:(NSDate *)aDate dayCount:(NSInteger)dayCount dayFormat:(NSString *)dayFormat;


+ (NSString *)replaceTime:(NSString *)text;
//正则去除HTML标签
+(NSString *)removeHTM:(NSString *)str;
@end
