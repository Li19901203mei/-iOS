//
//  RecordTableViewCell.h
//  AnHuo321
//
//  Created by mac on 2019/6/20.
//  Copyright © 2019年 macbookpro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YuModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface RecordTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel * nameLable;
@property(nonatomic,strong)UILabel * numLable;
@property(nonatomic,strong)UILabel * timeLable;
@property(nonatomic,strong)UILabel * yuLable;
@property(nonatomic,strong)UILabel * beiLable;
-(void)chuanZhiYuModel:(YuModel*)model;
@end

NS_ASSUME_NONNULL_END
