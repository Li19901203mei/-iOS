//
//  XiaoXiCell.h
//  英德格斯
//
//  Created by ilovedxracer on 2018/12/25.
//  Copyright © 2018 吕书涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface XiaoXiCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *chooseBtn;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *readStatus;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (nonatomic,strong) MessageModel *model;
@end

NS_ASSUME_NONNULL_END
