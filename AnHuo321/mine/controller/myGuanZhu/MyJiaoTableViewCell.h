//
//  MyJiaoTableViewCell.h
//  AnHuo321
//
//  Created by mac on 2019/5/14.
//  Copyright © 2019年 macbookpro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuanModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MyJiaoTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel * orderLable;
@property(nonatomic,strong)UIImageView * img;
@property(nonatomic,strong)UILabel * nameLable;
@property(nonatomic,strong)UILabel * moneyLable;
@property(nonatomic,strong)UILabel * startLable;
@property(nonatomic,strong)UILabel * endLable;
@property(nonatomic,strong)UILabel * updateLable;
@property(nonatomic,strong)UILabel * buyLable;
-(void)chuanZhiModel:(GuanModel*)model;
@end

NS_ASSUME_NONNULL_END
