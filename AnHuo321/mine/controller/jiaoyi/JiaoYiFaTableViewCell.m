
//
//  JiaoYiFaTableViewCell.m
//  AnHuo321
//
//  Created by mac on 2019/5/15.
//  Copyright © 2019年 macbookpro. All rights reserved.
//

#import "JiaoYiFaTableViewCell.h"

@implementation JiaoYiFaTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.leftImg =[[UIImageView alloc]init];
        self.leftImg.backgroundColor =[UIColor whiteColor];
        self.leftImg.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.leftImg];
        [self.leftImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).offset(width(15));
            make.top.mas_equalTo(self).offset(height(10));
            make.height.mas_equalTo(height(70));
            make.width.mas_equalTo(width(114));
        }];
        self.rightImg =[[UIImageView alloc]init];
        self.rightImg.backgroundColor = [UIColor redColor];
        [self addSubview:self.rightImg];
        [self.rightImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.leftImg.mas_centerY);
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
        self.rightLable =[[UILabel alloc]init];
        self.rightLable.textColor = BassColor(51, 51, 51);
        self.rightLable.text = @"紫薯面包";
        self.rightLable.font = VPFont(height(13));
        [self addSubview:self.rightLable];
        [self.rightLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.leftImg.mas_right).offset(width(10));
            make.centerY.mas_equalTo(self.leftImg.mas_centerY).offset(-height(20));
            make.right.mas_equalTo(self.chaLable.mas_left).offset(-width(5));
            make.height.mas_equalTo(height(17));
        }];
        self.timeLable =[[UILabel alloc]init];
        self.timeLable.textColor = BassColor(51, 51, 51);
        self.timeLable.text = @"结束时间:2019-08-06";
        self.timeLable.font = VPFont(height(13));
        [self addSubview:self.timeLable];
        [self.timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.leftImg.mas_right).offset(width(10));
            make.centerY.mas_equalTo(self.leftImg.mas_centerY).offset(height(20));
            make.right.mas_equalTo(self.chaLable.mas_left).offset(-width(5));
            make.height.mas_equalTo(height(17));
        }];
        self.line =[[UIView alloc]init];
        self.line.backgroundColor =BassColor(241, 241, 241);
        [self addSubview:self.line];
        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self);
            make.right.mas_equalTo(self.mas_right);
            make.top.mas_equalTo(self.leftImg.mas_bottom).offset(height(10));
            make.height.mas_equalTo(1);
        }];
        self.deleteBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        self.deleteBtn.titleLabel.font = VPFont(16);
        [self.deleteBtn setTitle:@"删除" forState:0];
        [self.deleteBtn setTitleColor:BassColor(51, 51, 51) forState:0];
        [self addSubview:self.deleteBtn];
        [self.deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self);
            make.top.mas_equalTo(self.line);
            make.bottom.mas_equalTo(self.mas_bottom);
            make.width.mas_equalTo(kScreenWidth/2);
        }];
        self.editBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        self.editBtn.titleLabel.font = VPFont(16);
        [self.editBtn setTitle:@"编辑" forState:0];
        [self.editBtn setTitleColor:BassColor(178,0, 0) forState:0];
        [self addSubview:self.editBtn];
        [self.editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.mas_right);
            make.top.mas_equalTo(self.line);
            make.bottom.mas_equalTo(self.mas_bottom);
            make.width.mas_equalTo(kScreenWidth/2);
        }];
    }
    return self;
}
-(void)chuanZhiGuanModel:(GuanModel*)model{
    self.timeLable.text = [NSString stringWithFormat:@"结束时间:%@",[Manager TimeCuoToTime:model.endtime]];//[NSString stringWithFormat:@"结束时间:%@",model.endtime];;
    self.rightLable.text = [NSString stringWithFormat:@"%@",model.pname];
    [self.leftImg sd_setImageWithURL:[NSURL URLWithString:KURLNSString(model.pictures)] placeholderImage:nil];
}
@end
