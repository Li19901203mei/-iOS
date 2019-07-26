//
//  CountyModel.m
//  Vpay
//
//  Created by mac on 2018/10/16.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "CountyModel.h"

@implementation CountyModel
+(NSDictionary*)mj_replacedKeyFromPropertyName{
    return @{@"parentid":@"id"};
}
@end
