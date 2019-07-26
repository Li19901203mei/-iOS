//
//  HttpTool.h
//  Currency
//
//  Created by mac on 2018/11/26.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^SuccessBlockType)(id responce);
typedef void (^FailedBloclkType)(NSError *erroe);
@interface HttpTool : NSObject
+(void)post:(NSString*)url dic:(NSDictionary*)dic success:(SuccessBlockType)success faile:(FailedBloclkType)faile;
+(NSString*)timestampConversionTime:(NSString*)time timeType:(NSString*)timeStr;
+(NSString *)currentTimeStr;
+(NSString*)MD5Sigin:(NSDictionary*)dic;
+(NSString *)MD5ForLower32Bate:(NSString *)str;
//+(CGFloat)floatWithStr:(NSString*)str and:(NSInteger)font;
@end

NS_ASSUME_NONNULL_END
