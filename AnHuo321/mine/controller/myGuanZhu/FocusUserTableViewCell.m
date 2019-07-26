//
//  FocusUserTableViewCell.m
//  AnHuo321
//
//  Created by mac on 2019/5/14.
//  Copyright © 2019年 macbookpro. All rights reserved.
//

#import "FocusUserTableViewCell.h"

@implementation FocusUserTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.touImg =[[UIImageView alloc]init];
        self.touImg.backgroundColor = [UIColor redColor];
        [self addSubview:self.touImg];
        [self.touImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).offset(width(10));
            make.centerY.mas_equalTo(self.mas_centerY);
            make.height.mas_equalTo(height(70));
            make.width.mas_equalTo(width(55));
        }];
        self.line = [[UIView alloc]init];
        self.line.backgroundColor = BassColor(102, 102, 102);
        [self addSubview:self.line];
        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(1);
            make.centerY.mas_equalTo(self.mas_centerY);
            make.height.mas_equalTo(height(70));
            make.left.mas_equalTo(self.touImg.mas_right).offset(width(10));
        }];
        self.nameLable =[[UILabel alloc]init];
        self.nameLable.textColor = BassColor(109, 110, 110);
        self.nameLable.font = VPFont(height(15));
        self.nameLable.text = @"用户";
        [self addSubview:self.nameLable];
        [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.line.mas_right).offset(width(15));
            make.top.mas_equalTo(self.touImg.mas_top);
            make.height.mas_equalTo(height(16));
            make.right.mas_equalTo(self.mas_right).offset(width(70));
        }];
        self.timeLable =[[UILabel alloc]init];
        self.timeLable.textColor = BassColor(109, 110, 110);
        self.timeLable.font = VPFont(height(15));
        self.timeLable.text = @"关注时间:";
        [self addSubview:self.timeLable];
        [self.timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.line.mas_right).offset(width(15));
            make.bottom.mas_equalTo(self.touImg.mas_bottom);
            make.height.mas_equalTo(height(16));
            make.right.mas_equalTo(self.mas_right).offset(width(70));
        }];
        self.rightImg =[[UIImageView alloc]init];
        self.rightImg.backgroundColor = [UIColor redColor];
        [self addSubview:self.rightImg];
        [self.rightImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.mas_centerY);
            make.right.mas_equalTo(self.mas_right).offset(-width(10));
            make.height.mas_equalTo(height(20));
            make.width.mas_equalTo(width(16));
        }];
        self.chaLable =[[UILabel alloc]init];
        self.chaLable.textColor = BassColor(109, 110, 110);
        self.chaLable.font = VPFont(height(13));
        self.chaLable.textAlignment = NSTextAlignmentRight;
        self.chaLable.text = @"查看";
        [self addSubview:self.chaLable];
        [self.chaLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.rightImg.mas_left).offset(-width(5));
            make.centerY.mas_equalTo(self.rightImg.mas_centerY);
            make.height.mas_equalTo(height(13));
            make.width.mas_equalTo(width(35));
        }];
    }
    return self;
}
-(void)chuanZhiFocusUser:(GuanModel *)model{
    [self.touImg sd_setImageWithURL:[NSURL URLWithString:model.href] placeholderImage:nil];
    self.nameLable.text =[NSString stringWithFormat:@"用户:%@",model.nickname];
    self.timeLable.text =[NSString stringWithFormat:@"关注时间:%@",model.reg_time];
}
@end
