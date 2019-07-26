//
//  NSString+category.m
//  MiYun360
//
//  Created by xiaoshunliang on 16/5/12.
//  Copyright © 2016年 AUNotBad. All rights reserved.
//

#import "NSString+category.h"
#import <CommonCrypto/CommonDigest.h>
@implementation NSString (category)
+ (NSString *)showTip:(NSArray *)messageArr{
    for (NSInteger i=0; i<messageArr.count; i++) {
        NSDictionary *dic = [messageArr safeObjectAtIndex:i];
        if ([NSString isBlankString:[dic objectForKey:dic.allKeys[0]]]) {
            return dic.allKeys[0];
        }
    }
    return @"ok";
}
+ (BOOL)isBlankString:(NSString *)string{
    
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    }
    return NO;
    
}
+ (NSString *)fromTimeStringToTimeFormat:(NSString *)format timeString:(NSString *)timeString{
    if (timeString.length <= 0) {
        return @"";
    }
    NSString *str=[timeString substringToIndex:timeString.length];
    NSString*time = str;
    NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format];
    NSDate*confromTimesp = [NSDate dateWithTimeIntervalSince1970:(NSTimeInterval)[time intValue]];
    NSString*confromTimespStr = [formatter stringFromDate:confromTimesp];
    return  confromTimespStr;
}
+ (NSString *)fromTimeStringToDayAndMonth:(NSString *)timeString{
    if (timeString.length <= 0) {
        return @"";
    }
    NSString *str=[timeString substringToIndex:timeString.length-3];
    NSString*time = str;
    NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"dd日-M月"];
    NSDate*confromTimesp = [NSDate dateWithTimeIntervalSince1970:(NSTimeInterval)[time intValue]];
    NSString*confromTimespStr = [formatter stringFromDate:confromTimesp];
    return  confromTimespStr;
}
#pragma mark- 返回一字符串是多久之前：刚刚，5秒前，1分钟前，1小时前等等
+ (NSString*)timeAgoWithDate:(NSString*)date
{
    date=[NSString stringWithFormat:@"%@",date];
    if (date.length<=0) {
        return @"";
    }
    NSString *datrStr = [NSString stringWithFormat:@"%@",date];
    NSString*time =[datrStr substringToIndex:datrStr.length-3];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyy-MM-dd HH:mm:ss"];
    NSDate*confromTimesp = [NSDate dateWithTimeIntervalSince1970:(NSTimeInterval)[time intValue]];
    
    double deltaSeconds = fabs([confromTimesp timeIntervalSinceDate:[NSDate date]]);
    double deltaMinutes = deltaSeconds / 60.0f;
    
    if (deltaSeconds < 5) {
        
        return @"刚刚";
        
    }else if (deltaSeconds < 60){
        
        return [NSString stringWithFormat:@"%d秒前",(int)ceil(deltaSeconds)];
        
    }else if (deltaMinutes < 60){
        
        return [NSString stringWithFormat:@"%d分钟前",(int)ceil(deltaMinutes)];
        
    }else if (deltaMinutes < (24 * 60)){
        
        int hour = floor(deltaMinutes/60);
        return [NSString stringWithFormat:@"%d小时前",hour];
        
    }else if (deltaMinutes < (24 * 60 * 7)){
        
        int day = (int)floor(deltaMinutes/(60 * 24));
        return [NSString stringWithFormat:@"%d天前",day];
        
    }else if (deltaMinutes < (24 * 60 * 31)){
        
        int week = (int)floor(deltaMinutes/(60 * 24 * 7));
        return [NSString stringWithFormat:@"%d周前",week];
        
    }else if (deltaMinutes < (24 * 60 * 365.25)){
        
        int month = (int)floor(deltaMinutes/(60 * 24 * 30));
        return [NSString stringWithFormat:@"%d个月前",month];
        
    }else{
        
        int year = (int)floor(deltaMinutes/(60 * 24 * 365));
        return [NSString stringWithFormat:@"%d年前",year];
    }
}
/**
 *  指定行数的大小返回frame
 */
+ (CGFloat)boundsWithFontSize:(CGFloat)fontSize text:(NSString *)text needWidth:(CGFloat)needWidth lineNumber:(NSInteger)lineNumber{
    lineNumber =lineNumber+1;
    NSString *str = text;
    if (str.length<=0) {
        str= @"";
    }
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:str];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 3;
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    [attributeString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, str.length)];
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, str.length)];
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    
    CGRect rect = [attributeString boundingRectWithSize:CGSizeMake(needWidth,CGFLOAT_MAX ) options:options context:nil];
    
    if ((rect.size.height - font.lineHeight) <= style.lineSpacing) {
        if ([[self class] containChinese:str]) {  //如果包含中文
            rect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height-style.lineSpacing);
        }
    }
    CGFloat textHeight;
    if (lineNumber>1) {
        if (rect.size.height>lineNumber*font.lineHeight) {
            textHeight = lineNumber*font.lineHeight;
        }else{
            textHeight = rect.size.height;
        }
    }else{
        textHeight = rect.size.height;
    }
    //     NSLog(@"font.lineHeight------%f",font.lineHeight);
    NSLog(@"textHeight------%f",textHeight);
    NSLog(@"lineNumber------%ld",(long)lineNumber);
    return textHeight;
    
}
/**
 *  指定字体的大小返回frame
 */
+ (CGRect)boundsWithFontSize:(CGFloat)fontSize text:(NSString *)text needWidth:(CGFloat)needWidth{
    NSString *str = text;
    if (str.length<=0) {
        str= @"";
    }
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:str];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 3;
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    [attributeString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, str.length)];
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, str.length)];
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [attributeString boundingRectWithSize:CGSizeMake(needWidth, CGFLOAT_MAX) options:options context:nil];
    if ((rect.size.height - font.lineHeight) <= style.lineSpacing) {
        if ([[self class] containChinese:str]) {  //如果包含中文
            rect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height-style.lineSpacing);
        }
    }
    return rect;
}
//判断如果包含中文
+ (BOOL)containChinese:(NSString *)str {
    for(int i=0; i< [str length];i++){
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff){
            return YES;
        }
    }
    return NO;
}
+ (NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString {
    NSData *JSONData = [JSONString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *responseJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
    return responseJSON;
}
/**
 *  替换掉null的字符串
 *
 */
+ (NSString *)nullString:(NSString *)nullStr {
    
    if (nullStr == nil || nullStr == NULL) {
        return @"";
    }
    if ([nullStr isKindOfClass:[NSNull class]]) {
        return @"";
    }
    if (![nullStr isKindOfClass:[NSString class]]) {
        return @"";
    }
    if ([[nullStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return @"";
    }
    return nullStr;
}
/**
 *  判断是不是手机号
 */
- (BOOL)isValidMobileNumber
{
    static NSString *const regex = @"^(1)\\d{10}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:self];
}

/**
 *  当前时间
 */
+ (NSString *)timeIsConvertedIntoDigital:(NSDate *)date{
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc]init];
    [formatter1 setDateStyle:NSDateFormatterMediumStyle];
    [formatter1 setTimeStyle:NSDateFormatterShortStyle];
    [formatter1 setDateFormat:@"YYYY-MM-dd HH:mm"];
    NSString* timesp = [NSString stringWithFormat:@"%f",[date timeIntervalSince1970]];
    return timesp;
}
/**
 *  用特定的格式显示当前时间
 */
+ (NSString *)setTheCurrentTimeWithFormat:(NSDate *)date{

    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString* timeStr = [formatter stringFromDate:date];
    return timeStr;
}
/**
 *  用当前时间 - 结束时间 来比较看是否答题已经结束 yes:结束 no:未结束
 */
+ (BOOL)isCurrentTimeCutEndTimeWithDate:(NSDate *)date endTime:(NSString*)endTimeStr{
    double timeInterval = [[NSDate date] timeIntervalSince1970];
    NSString *endTimeComplate = [NSString stringWithFormat:@"%.0f",[endTimeStr floatValue]/1000];
    int surplus = (timeInterval - [endTimeComplate integerValue]);
    NSLog(@"时间间隔问题====%f====%ld----字符串%@",timeInterval,(long)[endTimeStr integerValue],endTimeComplate);
    if (surplus < 0) {  //没有结束
        return NO;
    }
    return YES;
}

// 判断是不是包涵http 没有的话添家 HOST_URL
+(NSString *)backUrlAddHttp:(NSString *)Url{
    NSString * emptUrl  ;
    if ([Url hasPrefix:@"http"]) {
        emptUrl = Url ;
    }else{
        emptUrl =[NSString stringWithFormat:@"%@%@",Base_img_url,Url];
    }
    
    return emptUrl ;
}
/**
 *  是不是中文
 */
- (BOOL)isChinese{
    NSString *match = @"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}
//判断一个字符串是否全部包含另一个字符串
//return [NSString stringWithFormat:@"%ld",[socre integerValue]/2];
+ (NSDictionary *)isRightAnswer:(NSString *)standeAnswer chooseAnswer:(NSString *)chooseAnswer socre:(NSString *)socre{
    if (chooseAnswer.length>standeAnswer.length) {
        return @{@"0":@"0"};
    }else if(chooseAnswer.length==standeAnswer.length){
        for (int i=0; i<chooseAnswer.length; i++) {  //ab  ab
            BOOL isContains = [standeAnswer containsString:[chooseAnswer substringWithRange:NSMakeRange(i, 1)]];
            if (!isContains) {
                return @{@"0":@"0"};
            }
        }
        return @{@"2":socre};
    }else{ // ab abd
        for (int i=0; i<chooseAnswer.length; i++) {
            BOOL isContains = [standeAnswer containsString:[chooseAnswer substringWithRange:NSMakeRange(i, 1)]];
            if (!isContains) {
                return @{@"0":@"0"};
            }
        }
        return @{@"1":[NSString stringWithFormat:@"%ld",[socre integerValue]/2]};
    }
}
- (NSString *)MD5 {
    if (self == nil || [self length] == 0)
        return nil;
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH], i;
    CC_MD5([self UTF8String], (int)[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    NSMutableString *ms = [NSMutableString string];
    for (i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [ms appendFormat:@"%02x", (int)(digest[i])];
    }
    return [ms copy];
}
+ (NSString *)MD5 {
    if (self == nil || [[self class] length] == 0)
        return nil;
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH], i;
    CC_MD5([[self class] UTF8String], (int)[[self class] lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    NSMutableString *ms = [NSMutableString string];
    for (i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [ms appendFormat:@"%02x", (int)(digest[i])];
    }
    return [ms copy];
}
+ (NSString *)encodeUrlStr:(NSString *)urlStr{
    NSString *encodedString = (NSString *)
    
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              
                                                              (CFStringRef)urlStr,
                                                              
                                                              (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                                              
                                                              NULL,
                                                              
                                                              kCFStringEncodingUTF8));

    return encodedString;
}
/**
 答题的字符串的拼接以及拼接字符串的颜色
 @param commentStr 正常的str
 @param attStr 加了属性的str
 @return NSMutableAttributedString 一个加了属性的str
 */
+ (NSMutableAttributedString *)attCommentStr:(NSString *)commentStr  attributeWithStr:(NSMutableAttributedString *)attStr attColor:(UIColor *)attColor answerType:(NSString *)type{

    NSMutableAttributedString *attM = [[NSMutableAttributedString alloc] initWithString:commentStr];
    NSInteger strLength = attM.length;
    if (attStr.length>0) {
         [attM appendAttributedString:attStr];
    }
    [attM addAttributes:@{NSForegroundColorAttributeName:attColor} range:NSMakeRange(strLength, attStr.length)];
    NSString *str;
    if ([type isEqualToString:@"2"]) { //正确
       str = @",作答正确";
    }else if ([type isEqualToString:@"0"]){ //错误
        str = @",作答错误";
    }else if ([type isEqualToString:@"4"]){ //图片作答的题目
        str= @"";
    }else{ //未做答
        str= @",你未作答";
    }
     [attM appendAttributedString:[[NSAttributedString alloc] initWithString:str]];
    return attM;
}
//可以获得接下来的几天
+ (NSMutableArray *)TomorrowDay:(NSDate *)aDate dayCount:(NSInteger)dayCount dayFormat:(NSString *)dayFormat{
    NSMutableArray *arr=[NSMutableArray array];
    for (int i=0; i<dayCount; i++) {
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *components = [gregorian components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:aDate];
        [components setDay:([components day]+i)];
        
        NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
        NSDateFormatter *dateday = [[NSDateFormatter alloc] init];
        [dateday setDateFormat:dayFormat];
        //排除当天
//        if(i != 0){
//            [arr addObject:[dateday stringFromDate:beginningOfWeek]];
//        }
        
         [arr addObject:[dateday stringFromDate:beginningOfWeek]];
    }
    return arr;
}
//+ (NSMutableAttributedString *)tt:(NSString *)str startLocation:(NSInteger)location{
//    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc]initWithString:str];
//    [attStr addAttribute:NSBackgroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(location, str.length - location)];
//    return attStr;
//}
//正则去除HTML标签
+(NSString *)removeHTM:(NSString *)str{
    if ([str isKindOfClass:[NSNull class]]) {
        return @"";
    }
    if (str == nil || [str isEqualToString:@"null"] || [str isEqualToString:@"<null>"]) {
        return @"";
    }
    NSRegularExpression *regularExpretion=[NSRegularExpression regularExpressionWithPattern:@"<[^>]*>|\n"
                                                                                    options:0
                                           
                                                                                      error:nil];
    NSString *string =[regularExpretion stringByReplacingMatchesInString:str options:NSMatchingReportProgress range:NSMakeRange(0, str.length) withTemplate:@""];
    string = [string stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@""];
    return string;
}

@end
