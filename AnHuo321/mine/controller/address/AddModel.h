//
//  AddModel.h
//  AnHuo321
//
//  Created by mac on 2019/5/27.
//  Copyright © 2019年 macbookpro. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddModel : NSObject
@property(nonatomic,copy)NSString * addID;
@property(nonatomic,copy)NSString * province_id;
@property(nonatomic,copy)NSString * province_name;
@property(nonatomic,copy)NSString * city_name;
@property(nonatomic,copy)NSString * area_name;
@property(nonatomic,copy)NSString *address;
@property(nonatomic,copy)NSString * end_time;
@property(nonatomic,copy)NSString * truename;
@property(nonatomic,copy)NSString * mobile;
@end

NS_ASSUME_NONNULL_END
