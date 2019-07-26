//
//  NotiMessageCell.h
//  AnHuo321
//
//  Created by 123 on 2019/7/23.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface NotiMessageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *replyBtn;
@property (weak, nonatomic) IBOutlet UIButton *contactBtn;
@property (weak, nonatomic) IBOutlet UIImageView *headerImg;
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UILabel *account;
@property (weak, nonatomic) IBOutlet UILabel *nickName;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *readStatus;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (nonatomic,strong) MessageModel *model;
@end

NS_ASSUME_NONNULL_END
