//
//  MyJiaoTableViewCell.m
//  AnHuo321
//
//  Created by mac on 2019/5/14.
//  Copyright © 2019年 macbookpro. All rights reserved.
//

#import "MyJiaoTableViewCell.h"

@implementation MyJiaoTableViewCell

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
        self.orderLable =[[UILabel alloc]init];
        self.orderLable.text = @"最新订单";
        self.orderLable.textColor =BassColor(102, 102, 102);
        self.orderLable.font = VPFont(height(13));
        [self addSubview:self.orderLable];
        [self.orderLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).offset(width(10));
            make.height.mas_equalTo(height(13));
            make.width.mas_equalTo(width(80));
            make.top.mas_equalTo(self).offset(height(10));
        }];
        self.img =[[UIImageView alloc]init];
        self.img.backgroundColor =[UIColor redColor];
        self.img.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.img];
        [self.img mas_makeConstraints:^(MASConstraintMaker *make) {
          make.left.mas_equalTo(self).offset(width(10));
            make.top.mas_equalTo(self.orderLable.mas_bottom).offset(height(5));
            make.width.mas_equalTo(width(150));
            make.height.mas_equalTo(height(80));
        }];
        self.nameLable =[[UILabel alloc]init];
        self.nameLable.text =@"面包面膜面包";
        self.nameLable.font = VPFont(height(13));
        self.nameLable.textColor = BassColor(102, 102, 102);
        [self addSubview:self.nameLable];
        [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).offset(width(10));
            make.top.mas_equalTo(self.img.mas_bottom).offset(height(5));
            make.width.mas_equalTo(width(150));
            make.height.mas_equalTo(height(13));
        }];
        self.moneyLable =[[UILabel alloc]init];
        self.moneyLable.text = @"成交价:";
        self.moneyLable.font = VPFont(height(13));
        self.moneyLable.textColor =BassColor(102, 102, 102);
        [self addSubview:self.moneyLable];
        [self.moneyLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.img.mas_right).offset(width(5));
            make.top.mas_equalTo(self).offset(height(10));
            make.right.mas_equalTo(self.mas_right).offset(-width(5));
            make.height.mas_equalTo(height(13));
        }];
        self.startLable =[[UILabel alloc]init];
        self.startLable.text = @"成交时间:";
        self.startLable.textColor =BassColor(102, 102, 102);
        self.startLable.font = VPFont(height(13));
        [self addSubview:self.startLable];
        [self.startLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.img.mas_right).offset(width(5));
            make.top.mas_equalTo(self.moneyLable.mas_bottom).offset(height(10));
            make.right.mas_equalTo(self.mas_right).offset(-width(5));
            make.height.mas_equalTo(height(13));
        }];
        self.endLable =[[UILabel alloc]init];
        self.endLable.text = @"结束时间:";
        self.endLable.font = VPFont(height(13));
        self.endLable.textColor =BassColor(102, 102, 102);
        [self addSubview:self.endLable];
        [self.endLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.img.mas_right).offset(width(5));
            make.top.mas_equalTo(self.startLable.mas_bottom).offset(height(10));
            make.right.mas_equalTo(self.mas_right).offset(-width(5));
            make.height.mas_equalTo(height(13));
        }];
        self.updateLable =[[UILabel alloc]init];
        self.updateLable.text = @"更新时间:";
        self.updateLable.font = VPFont(height(13));
        self.updateLable.textColor =BassColor(102, 102, 102);
        [self addSubview:self.updateLable];
        [self.updateLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.img.mas_right).offset(width(5));
            make.top.mas_equalTo(self.endLable.mas_bottom).offset(height(10));
            make.right.mas_equalTo(self.mas_right).offset(-width(5));
            make.height.mas_equalTo(height(13));
        }];
        self.buyLable =[[UILabel alloc]init];
        self.buyLable.text = @"买家:";
        self.buyLable.font = VPFont(height(13));
        self.buyLable.textColor =BassColor(102, 102, 102);
        [self addSubview:self.buyLable];
        [self.buyLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.img.mas_right).offset(width(5));
            make.top.mas_equalTo(self.updateLable.mas_bottom).offset(height(20));
            make.right.mas_equalTo(self.mas_right).offset(-width(5));
            make.height.mas_equalTo(height(13));
        }];
    }
    return self;
}
-(void)chuanZhiModel:(GuanModel*)model{
    [self.img sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:nil];
    self.nameLable.text = [NSString stringWithFormat:@"%@",model.title];
    self.endLable.text=[NSString stringWithFormat:@"%@",model.endtime];
}
@end
