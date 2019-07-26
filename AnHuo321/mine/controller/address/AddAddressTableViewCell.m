//
//  AddAddressTableViewCell.m
//  AnHuo321
//
//  Created by mac on 2019/5/16.
//  Copyright © 2019年 macbookpro. All rights reserved.
//

#import "AddAddressTableViewCell.h"

@implementation AddAddressTableViewCell

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
        self.nameBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        self.nameBtn.backgroundColor = BassColor(190, 191, 192);
        
        [self.nameBtn setTitleColor:BassColor(255, 255, 255) forState:0];
        self.nameBtn.titleLabel.font = VPFont(height(30));
        [self addSubview:self.nameBtn];
        [self.nameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).offset(width(15));
            make.centerY.mas_equalTo(self.mas_centerY);
            make.width.height.mas_equalTo(height(60));
        }];
        self.nameBtn.layer.cornerRadius = height(30);
        self.nameBtn.layer.masksToBounds = YES;
        self.nameLable =[[UILabel alloc]init];
        self.nameLable.textColor = BassColor(51, 51, 51);
        self.nameLable.font =VPFont(height(13));
        
        [self addSubview:self.nameLable];
        [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.nameBtn.mas_right).offset(width(5));
            make.right.mas_equalTo(self.mas_right).offset(-width(90));
            make.height.mas_equalTo(height(15));
            make.top.mas_equalTo(self.nameBtn).offset(height(10));
        }];
        self.addressLable =[[UILabel alloc]init];
        self.addressLable.textColor = BassColor(51, 51, 51);
        self.addressLable.font =VPFont(height(13));
        
        [self addSubview:self.addressLable];
        [self.addressLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.nameBtn.mas_right).offset(width(5));
            make.right.mas_equalTo(self.mas_right).offset(-width(90));
            make.height.mas_equalTo(height(15));
            make.bottom.mas_equalTo(self.nameBtn.mas_bottom).offset(-height(10));
        }];
        self.line =[[UIView alloc]init];
        self.line.backgroundColor =BassColor(190, 191, 192);
        [self addSubview:self.line];
        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.mas_centerY);
            make.height.mas_equalTo(height(70));
            make.width.mas_equalTo(1);
            make.left.mas_equalTo(self.addressLable.mas_right).offset(width(10));
        }];
        self.emitBtn =[UIButton buttonWithType:UIButtonTypeCustom];
//        self.emitBtn.backgroundColor = BassColor(190, 191, 192);
        [self.emitBtn setTitle:@"编辑" forState:0 ];
        [self.emitBtn setTitleColor:BassColor(110, 110, 110) forState:0];
        self.emitBtn.titleLabel.font = VPFont(height(16));
        [self addSubview:self.emitBtn];
        [self.emitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.line.mas_right).offset(width(0));
            make.centerY.mas_equalTo(self.mas_centerY);
            make.right.mas_equalTo(self.mas_right);
            make.height.mas_equalTo(height(18));
        }];
    }
    return self;
}-(void)chuanZhiAddress:(AddModel*)model{
   [self.nameBtn setTitle:[model.truename substringToIndex:1] forState:0 ];
    self.nameLable.text = [NSString stringWithFormat:@"收件人:%@       %@",model.truename,model.mobile];
    self.addressLable.text = [NSString stringWithFormat:@"地址:%@%@%@%@",model.province_name,model.city_name,model.area_name,model.address];
}
@end
