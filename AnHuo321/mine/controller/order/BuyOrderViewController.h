//
//  BuyOrderViewController.h
//  AnHuo321
//
//  Created by 吕书涛 on 2019/4/7.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import "MainBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BuyOrderViewController : MainBaseViewController
@property (nonatomic,copy) NSString *status;//订单状态
@property (nonatomic,assign) BOOL type;// yes 卖家 no 买家
@end

NS_ASSUME_NONNULL_END
