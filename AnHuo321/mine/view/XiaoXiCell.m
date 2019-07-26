//
//  XiaoXiCell.m
//  英德格斯
//
//  Created by ilovedxracer on 2018/12/25.
//  Copyright © 2018 吕书涛. All rights reserved.
//

#import "XiaoXiCell.h"

@implementation XiaoXiCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setModel:(MessageModel *)model{
    self.title.text = model.content;
    self.type.text = model.type;
    self.time.text = [NSString fromTimeStringToTimeFormat:@"yyyy-MM-dd HH:mm:ss" timeString:model.time];
    if ([model.status isEqualToString:@"0"]) {
        self.readStatus.hidden = NO;
    }else{
        self.readStatus.hidden = YES;
    }
    if (model.isSelected) {
        [self.chooseBtn setImage:ImgWithName(@"yigouxuan") forState:UIControlStateNormal];
    }else{
        [self.chooseBtn setImage:ImgWithName(@"weigouxuanv") forState:UIControlStateNormal];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
