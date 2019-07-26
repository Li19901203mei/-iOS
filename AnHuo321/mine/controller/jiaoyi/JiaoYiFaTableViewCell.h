//
//  JiaoYiFaTableViewCell.h
//  AnHuo321
//
//  Created by mac on 2019/5/15.
//  Copyright © 2019年 macbookpro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuanModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JiaoYiFaTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView * leftImg;
@property(nonatomic,strong)UILabel * rightLable;
@property(nonatomic,strong)UILabel * timeLable;
@property(nonatomic,strong)UIImageView * rightImg;
@property(nonatomic,strong)UILabel * chaLable;
@property(nonatomic,strong)UIView* line;
@property(nonatomic,strong)UIButton* deleteBtn;
@property(nonatomic,strong)UIButton* editBtn;
-(void)chuanZhiGuanModel:(GuanModel*)model;
@end

NS_ASSUME_NONNULL_END
