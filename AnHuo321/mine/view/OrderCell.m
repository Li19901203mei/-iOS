//
//  OrderCell.m
//  AnHuo321
//
//  Created by 123 on 2019/5/22.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import "OrderCell.h"

@implementation OrderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self.oneBtn setTitleColor:RGBACOLOR(188, 46, 52, 1) forState:UIControlStateNormal];
    [self.twoBtn setTitleColor:RGBACOLOR(188, 46, 52, 1) forState:UIControlStateNormal];
    [self.threeBtn setTitleColor:RGBACOLOR(188, 46, 52, 1) forState:UIControlStateNormal];
}
- (void)setModel:(OrderModel *)model{
    self.title.text = model.pname;
    self.number.text = [NSString stringWithFormat:@"[物品编号: %@]",model.bidinfo[@"bidnb"]];
    NSString *url = [NSString stringWithFormat:@"%@%@",Base_img_url,model.bidinfo[@"pictures"]];
    [self.img sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil];
    self.price.text = model.danjia;
    self.totalPrice.text = model.danjia;
    self.salePeople.text = model.organization;
    self.orderNumber.text = [NSString stringWithFormat:@"订单编号:%@",model.order_no];
    self.note.text = model.remark;
    self.bargainTime.text = [Manager TimeCuoToTime:model.losetime];
    self.endTime.text =[Manager TimeCuoToTime:model.losetime];
    self.updateTime.text = model.updata_time;
}


@end
