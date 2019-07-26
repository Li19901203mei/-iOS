//
//  BaseModel.h
//  AnHuo321
//
//  Created by 123 on 2019/7/8.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseModel : NSObject
@property(nonatomic,copy)NSString * sex;
@property(nonatomic,copy)NSString * truename;
@property (nonatomic,copy) NSString *nickname;//昵称
@property (nonatomic,copy) NSString *email;//邮箱
@property (nonatomic,copy) NSString *mobile;//手机
@property (nonatomic,copy) NSString *wallet_pledge;//余额
@property (nonatomic,copy) NSString *wallet_limsum;//信用金
@property (nonatomic,copy) NSString *smsc;//消息提醒
@property (nonatomic,copy) NSString *wsmsc;//未读
@property (nonatomic,copy) NSString *waitpay;//待付款
@property (nonatomic,copy) NSString *waitgain;//待收货
@property (nonatomic,assign) BOOL verify_email;//邮箱是否认证
@property (nonatomic,assign) BOOL verify_mobile;//手机是否认证
@property (nonatomic,copy) NSString *conform_evaluate;
@property (nonatomic,copy) NSString *service_evaluate;
@property (nonatomic,assign) NSInteger conform;
@property (nonatomic,assign) NSInteger service;
@property (nonatomic,assign) NSInteger express;
@end

NS_ASSUME_NONNULL_END
