//
//  OrderModel.h
//  AnHuo321
//
//  Created by 123 on 2019/5/21.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OrderModel : NSObject
@property (nonatomic,copy)NSString *pname;//标题
@property (nonatomic,copy)NSString *remark;//备注
@property (nonatomic,copy)NSString *danjia;//单价
@property (nonatomic,copy)NSString *order_no;//订单号
@property (nonatomic,copy)NSString *status;//订单状态
@property (nonatomic,copy)NSString *pictures;//商品图片
@property (nonatomic,copy)NSString *organization;//卖家
@property (nonatomic,copy)NSString *bidnb;//订单编号
@property (nonatomic,copy)NSString *updata_time;
@property (nonatomic,copy)NSString *losetime;
@property (nonatomic,copy) NSString *gid;
@property (nonatomic,strong) NSDictionary *bidinfo;
/*status: 0  待付款
1  待发货
2  待收货
3  交易成功
5  买家已评价
6  申请退货
8  卖家拒绝退货
7  卖家同意退货，待发货
9  已发货等待卖家收货
10 已完成退货
11 已互评
 */
@end

NS_ASSUME_NONNULL_END
