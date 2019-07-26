//
//  OrderCell.h
//  AnHuo321
//
//  Created by 123 on 2019/5/22.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface OrderCell : UITableViewCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *BtnHeight;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *bargainTime;
@property (weak, nonatomic) IBOutlet UILabel *endTime;
@property (weak, nonatomic) IBOutlet UILabel *updateTime;
@property (weak, nonatomic) IBOutlet UILabel *salePeople;
@property (weak, nonatomic) IBOutlet UILabel *orderNumber;
@property (weak, nonatomic) IBOutlet UILabel *totalPrice;
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet UILabel *note;
@property (weak, nonatomic) IBOutlet UIButton *oneBtn;
@property (weak, nonatomic) IBOutlet UIButton *twoBtn;
@property (weak, nonatomic) IBOutlet UIButton *threeBtn;




@property (nonatomic,strong) OrderModel *model;
@end

NS_ASSUME_NONNULL_END
