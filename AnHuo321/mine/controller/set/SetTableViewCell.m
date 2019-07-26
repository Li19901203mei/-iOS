
//
//  SetTableViewCell.m
//  AnHuo321
//
//  Created by mac on 2019/6/18.
//  Copyright © 2019年 macbookpro. All rights reserved.
//

#import "SetTableViewCell.h"

@implementation SetTableViewCell

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
        self.leftLable=[[UILabel alloc]init];
        self.leftLable.textColor =BassColor(51, 51, 51);
        self.leftLable.font = VFont;
        [self addSubview:self.leftLable];
        [self.leftLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).offset(width(15));
            make.centerY.mas_equalTo(self.mas_centerY);
            make.right.mas_equalTo(self.mas_right).offset(-width(60));
            make.height.mas_equalTo(height(20));
        }];
        self.rightImg =[[UIImageView alloc]init];
        self.rightImg.image =[UIImage imageNamed:@"icon-couti"];
        [self addSubview:self.rightImg];
        [self.rightImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.mas_centerY);
            make.right.mas_equalTo(self.mas_right).offset(-width(10));
            make.height.mas_equalTo(height(20));
            make.width.mas_equalTo(width(16));
        }];
    }
    return self;
}
@end
