//
//  CountyTableViewCell.m
//  Vpay
//
//  Created by mac on 2018/10/16.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "CountyTableViewCell.h"

@implementation CountyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=  [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.leftLable = [[UILabel alloc]init];
        self.leftLable.textColor = BassColor(51, 51, 51);
        self.leftLable.font = [UIFont systemFontOfSize:15];
        [self addSubview:self.leftLable];
        [self.leftLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).offset(width(15));
            make.centerY.mas_equalTo(self.mas_centerY);
            make.height.mas_equalTo(height(20));
            make.right.mas_equalTo(self.mas_right).offset(-width(40));
        }];
        self.rightImg = [[UIImageView alloc]init];
        self.rightImg.image = [UIImage imageNamed:@"my_icon_gright"];
        [self addSubview:self.rightImg];
        [self.rightImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.mas_right).offset(-width(15));
            make.centerY.mas_equalTo(self.mas_centerY);
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(10);
        }];
   
    }
    return self;
}

@end
