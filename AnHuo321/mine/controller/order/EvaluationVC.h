//
//  EvaluationVC.h
//  AnHuo321
//
//  Created by 123 on 2019/5/29.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface EvaluationVC : UIViewController
@property (nonatomic,strong) OrderModel *model;
@property (nonatomic,assign) BOOL isSeeEvalution;// yes 代表查看评价  no 代表发表评价
@end

NS_ASSUME_NONNULL_END
