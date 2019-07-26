//
//  ProductInfoView.h
//  AnHuo321
//
//  Created by 朱健 on 2019/4/1.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductInfoView : UIView
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *sellViewHeight;
@property (weak, nonatomic) IBOutlet UIView *sellView;
@property (weak, nonatomic) IBOutlet UIView *sellBottomView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *sellBottomHeight;
@property (weak, nonatomic) IBOutlet UIView *buyView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buyViewHeight;
@property (weak, nonatomic) IBOutlet UIView *buyBottomVIew;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buyBottomHeight;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *sellerLabel;
@property (weak, nonatomic) IBOutlet UILabel *sellerDetailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *sellerRightImage;
@property (weak, nonatomic) IBOutlet UILabel *buyNickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyPrice;
@property (weak, nonatomic) IBOutlet UILabel *buyNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *sellerNickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sellerPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *sellerCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *moreSellerLabel;
@property (weak, nonatomic) IBOutlet UIImageView *moreSellerRightImage;
@property (weak, nonatomic) IBOutlet UILabel *moreBuyLabel;
@property (weak, nonatomic) IBOutlet UIImageView *moreBuyRightImage;
@property (weak, nonatomic) IBOutlet UIButton *attentionButton;


@end

NS_ASSUME_NONNULL_END
