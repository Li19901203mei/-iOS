//
//  CZTableViewCell.m
//  AnHuo321
//
//  Created by mac on 2019/6/25.
//  Copyright © 2019年 macbookpro. All rights reserved.
//

#import "CZTableViewCell.h"

@implementation CZTableViewCell

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
        self.numLable =[[UILabel alloc]init];
        
        self.numLable.font = VFont;
        self.numLable.textColor = BassColor(51, 51, 51);
        [self addSubview:self.numLable];
        [self.numLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).offset(width(15));
            make.centerY.mas_equalTo(self.mas_centerY).offset(-height(20));
            make.right.mas_equalTo(self.mas_right).offset(-width(150));
        }];
        self.nameLable =[[UILabel alloc]init];
        
        self.nameLable.font = VFont;
        self.nameLable.textColor = [UIColor redColor];
        self.nameLable.textAlignment = NSTextAlignmentRight;
        [self addSubview:self.nameLable];
        [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.numLable.mas_right).offset(width(15));
            make.centerY.mas_equalTo(self.mas_centerY).offset(-height(20));
            make.right.mas_equalTo(self.mas_right).offset(-width(10));
        }];
        self.timeLable =[[UILabel alloc]init];
        
        self.timeLable.font = VFont;
        self.timeLable.textColor = BassColor(51, 51, 51);
        [self addSubview:self.timeLable];
        [self.timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).offset(width(15));
            make.centerY.mas_equalTo(self.mas_centerY).offset(height(20));
            make.right.mas_equalTo(self.mas_right).offset(-kScreenWidth/2);
        }];
        self.yuLable =[[UILabel alloc]init];
        
        self.yuLable.font = VFont;
        self.yuLable.textColor = BassColor(51, 51, 51);
        self.yuLable.textAlignment = NSTextAlignmentRight;
        [self addSubview:self.yuLable];
        [self.yuLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.timeLable.mas_right).offset(width(15));
            make.centerY.mas_equalTo(self.mas_centerY).offset(height(20));
            make.right.mas_equalTo(self.mas_right).offset(-width(10));
        }];
    }
    return self;
}
-(void)chuanZhiTiRecordModel:(TiRecordModel*)model{
    self.numLable.text =[NSString stringWithFormat:@"充值金额:%@元",model.money];
    self.nameLable.text =[NSString stringWithFormat:@"%@",model.status];
    self.timeLable.text =[NSString stringWithFormat:@"时间:%@",model.create_time];
    
}
@end
