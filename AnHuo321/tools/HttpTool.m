//
//  HttpTool.m
//  Currency
//
//  Created by mac on 2018/11/26.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "HttpTool.h"
//#import "LoginViewController.h"
//#import<CommonCrypto/CommonDigest.h>
@implementation HttpTool
+(void)post:(NSString*)url dic:(NSDictionary*)dic success:(SuccessBlockType)success faile:(FailedBloclkType)faile
{
    AFHTTPSessionManager *manager =  [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 25;
    [manager POST:url parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *responDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
//        if ([responDic[@"code"] intValue]==1004) {
//            [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"isLogin"];
//            [[NSUserDefaults standardUserDefaults] synchronize];
//            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"token"];
//            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"uuid"];
//            LoginViewController * loginVC = [[LoginViewController alloc]init];
//            UINavigationController * loginNav = [[UINavigationController alloc]initWithRootViewController:loginVC];
//            UIWindow * window = [UIApplication sharedApplication].delegate.window;
//            window.rootViewController =loginNav;
//            return ;
//        }
        if (success) {
            success(responDic);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (faile) {
            faile(error);
        }
    }];
}
+(NSString*)timestampConversionTime:(NSString*)time timeType:(NSString*)timeStr {
    NSString *timeStampString  = [NSString stringWithFormat:@"%@",time];
    
    // iOS 生成的时间戳是10位
    NSTimeInterval interval    =[timeStampString doubleValue];
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:timeStr];
    NSString *dateString       = [formatter stringFromDate: date];
    return dateString;
}
//获取当前时间戳
+(NSString *)currentTimeStr{
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
    NSTimeInterval time=[date timeIntervalSince1970]*1000;// *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}
+(NSString*)MD5Sigin:(NSDictionary*)dic{
    //    NSMutableDictionary *signParams = [NSMutableDictionary dictionary];
    //    [signParams setObject:@"1" forKey:@"appid"];
    //    [signParams setObject:@"4" forKey:@"noncestr"];
    //    [signParams setObject:@"4" forKey:@"package"];
    //    [signParams setObject:@"6" forKey:@"partnerid"];
    //    [signParams setObject:@"7" forKey:@"prepayid"];
    
    NSMutableString *contentString  =[NSMutableString string];
    NSArray *keys = [dic allKeys];
    //按字母顺序排序
    NSArray *sortedArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    //拼接字符串
    for (NSString *categoryId in sortedArray) {
        if (   ![[dic objectForKey:categoryId] isEqualToString:@""]
            && ![[dic objectForKey:categoryId] isEqualToString:@"sign"]
            && ![[dic objectForKey:categoryId] isEqualToString:@"key"]
            )
        {
            [contentString appendFormat:@"%@=%@&", categoryId, [dic objectForKey:categoryId]];
        }
    }
    //添加商户密钥key字段
    [contentString appendFormat:@"key=%@",@"0f4137ed1502b5045d6083aa258b5c42"];
    
    NSString *result = [self MD5ForLower32Bate:contentString];
    return result;
}
//+(NSString *)MD5ForLower32Bate:(NSString *)str{
//    
//    //要进行UTF8的转码
//    const char* input = [str UTF8String];
//    unsigned char result[CC_MD5_DIGEST_LENGTH];
//    CC_MD5(input, (CC_LONG)strlen(input), result);
//    
//    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
//    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
//        [digest appendFormat:@"%02x", result[i]];
//    }
//    
//    return digest;
//}
//计算宽度
+ (CGFloat)floatWithStr:(NSString*)str and:(NSInteger)font {
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:font]};  //指定字号
    CGRect rect = [str boundingRectWithSize:CGSizeMake(0, 2000) options:NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading attributes:dic context:nil];
    //    CGSize size = [str boundingRectWithSize:constrainedSize options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    return rect.size.width;
}
@end