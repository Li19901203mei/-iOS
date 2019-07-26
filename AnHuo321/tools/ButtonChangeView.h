//
//  ButtonChangeView.h
//  MiYun360
//
//  Created by xiaoshunliang on 16/6/15.
//  Copyright © 2016年 AUNotBad. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ButtonChangeViewDelegate <NSObject>

@optional
- (void)buttonChangeViewDidSelectIdex:(NSInteger)buttonIndex;
@end
@interface ButtonChangeView : UIView
@property (nonatomic, assign) id<ButtonChangeViewDelegate> delegate;
- (instancetype)initWithFrame:(CGRect)frame buttonArray:(NSArray *)buttonArray;

@end
