//
//  CountyModel.h
//  Vpay
//
//  Created by mac on 2018/10/16.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CountyModel : NSObject
@property(nonatomic,copy)NSString * province_id;
@property(nonatomic,copy)NSString * province_name;
@property(nonatomic,copy)NSString * city_id;
@property(nonatomic,copy)NSString * city_name;
@property(nonatomic,copy)NSString * area_id;
@property(nonatomic,copy)NSString * area_name;
@end

NS_ASSUME_NONNULL_END
