//
//  RecordTableViewCell.m
//  AnHuo321
//
//  Created by mac on 2019/6/20.
//  Copyright © 2019年 macbookpro. All rights reserved.
//

#import "RecordTableViewCell.h"

@implementation RecordTableViewCell

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
        self.nameLable =[[UILabel alloc]init];
        
        self.nameLable.font = VFont;
        self.nameLable.textColor = BassColor(51, 51, 51);
        [self addSubview:self.nameLable];
        [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).offset(width(15));
            make.top.mas_equalTo(self.mas_top).offset(height(10));
            make.right.mas_equalTo(self.mas_right).offset(-width(150));
        }];
        self.numLable =[[UILabel alloc]init];
        
        self.numLable.font = VFont;
        self.numLable.textColor = [UIColor redColor];
        self.numLable.textAlignment = NSTextAlignmentRight;
        [self addSubview:self.numLable];
        [self.numLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.nameLable.mas_right).offset(width(15));
            make.top.mas_equalTo(self.mas_top).offset(height(10));
            make.right.mas_equalTo(self.mas_right).offset(-width(10));
        }];
        self.timeLable =[[UILabel alloc]init];
        
        self.timeLable.font = VFont;
        self.timeLable.textColor = BassColor(51, 51, 51);
        [self addSubview:self.timeLable];
        [self.timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).offset(width(15));
            make.centerY.mas_equalTo(self.numLable.mas_bottom).offset(height(15));
            make.right.mas_equalTo(self.mas_right).offset(-kScreenWidth/2);
        }];
        self.yuLable =[[UILabel alloc]init];
        
        self.yuLable.font = VFont;
        self.yuLable.textColor = BassColor(51, 51, 51);
        self.yuLable.textAlignment = NSTextAlignmentRight;
        [self addSubview:self.yuLable];
        [self.yuLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.timeLable.mas_right).offset(width(15));
            make.centerY.mas_equalTo(self.numLable.mas_bottom).offset(height(15));
            make.right.mas_equalTo(self.mas_right).offset(-width(10));
        }];
        self.beiLable =[[UILabel alloc]init];
        
        self.beiLable.font = VFont;
        self.beiLable.textColor = BassColor(51, 51, 51);
        self.beiLable.numberOfLines=0;
        self.beiLable.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.beiLable];
        [self.beiLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).offset(width(15));
            make.top.mas_equalTo(self.yuLable.mas_bottom).offset(height(15));
            make.right.mas_equalTo(self.mas_right).offset(-width(10));
            make.bottom.mas_equalTo(self.mas_bottom).offset(-height(5));
        }];
    }
    return self;
}
-(void)chuanZhiYuModel:(YuModel*)model{
    self.beiLable.text =[NSString stringWithFormat:@"备注:%@",model.desc];
    self.yuLable.text =[NSString stringWithFormat:@"%@",model.pay_type];
    self.timeLable.text =[NSString stringWithFormat:@"时间:%@",model.time];
    self.numLable.text =[NSString stringWithFormat:@"%@",model.money];
    self.nameLable.text =[NSString stringWithFormat:@"订单号:%@",model.pro];
}
@end
