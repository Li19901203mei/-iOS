//
//  NotiMessageCell.m
//  AnHuo321
//
//  Created by 123 on 2019/7/23.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import "NotiMessageCell.h"

@implementation NotiMessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setModel:(MessageModel *)model{
    [self.headerImg sd_setImageWithURL:UrlWithStr(model.pick) placeholderImage:nil];
    self.account.text = [NSString stringWithFormat:@"账户:%@",model.user[@"account"]];
    self.nickName.text = [NSString stringWithFormat:@"昵称:%@",model.user[@"nickname"]];
    self.content.text = model.content;
    self.time.text = [NSString fromTimeStringToTimeFormat:@"yyyy-MM-dd HH:mm:ss" timeString:model.time];
    if ([model.status isEqualToString:@"0"]) {
        self.readStatus.hidden = NO;
    }else{
        self.readStatus.hidden = YES;
    }
    if (model.isSelected) {
        [self.btn setImage:ImgWithName(@"yigouxuan") forState:UIControlStateNormal];
    }else{
        [self.btn setImage:ImgWithName(@"weigouxuanv") forState:UIControlStateNormal];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
