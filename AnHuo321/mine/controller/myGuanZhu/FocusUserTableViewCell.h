//
//  FocusUserTableViewCell.h
//  AnHuo321
//
//  Created by mac on 2019/5/14.
//  Copyright © 2019年 macbookpro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuanModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface FocusUserTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView * touImg;
@property(nonatomic,strong)UIView * line;
@property(nonatomic,strong)UILabel * nameLable;
@property(nonatomic,strong)UILabel * timeLable;
@property(nonatomic,strong)UIImageView * rightImg;
@property(nonatomic,strong)UILabel * chaLable;
-(void)chuanZhiFocusUser:(GuanModel*)model;
@end

NS_ASSUME_NONNULL_END
