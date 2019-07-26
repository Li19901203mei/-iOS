//
//  ChooseDeliverVC.h
//  AnHuo321
//
//  Created by 123 on 2019/5/29.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChooseDeliverVC : UIViewController
@property (nonatomic,strong) NSDictionary *deliverDic;
@property (nonatomic,copy) void (^chooseDeliver)(NSString *name,NSString *id);
@end

NS_ASSUME_NONNULL_END
