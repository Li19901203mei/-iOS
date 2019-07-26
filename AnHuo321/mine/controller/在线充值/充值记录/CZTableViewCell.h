//
//  CZTableViewCell.h
//  AnHuo321
//
//  Created by mac on 2019/6/25.
//  Copyright © 2019年 macbookpro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TiRecordModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CZTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel * nameLable;
@property(nonatomic,strong)UILabel * numLable;
@property(nonatomic,strong)UILabel * timeLable;
@property(nonatomic,strong)UILabel * yuLable;
-(void)chuanZhiTiRecordModel:(TiRecordModel*)model;
@end

NS_ASSUME_NONNULL_END
