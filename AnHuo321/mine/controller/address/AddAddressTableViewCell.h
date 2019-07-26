//
//  AddAddressTableViewCell.h
//  AnHuo321
//
//  Created by mac on 2019/5/16.
//  Copyright © 2019年 macbookpro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface AddAddressTableViewCell : UITableViewCell
@property(nonatomic,strong)UIButton * nameBtn;
@property(nonatomic,strong)UIButton * emitBtn;
@property(nonatomic,strong)UILabel * nameLable;
@property(nonatomic,strong)UILabel * addressLable;
@property(nonatomic,strong)UIView * line;
-(void)chuanZhiAddress:(AddModel*)model;
@end

NS_ASSUME_NONNULL_END
