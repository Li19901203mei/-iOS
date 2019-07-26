//
//  ButtonChangeView.m
//  MiYun360
//
//  Created by xiaoshunliang on 16/6/15.
//  Copyright © 2016年 AUNotBad. All rights reserved.
//

#import "ButtonChangeView.h"
@interface ButtonChangeView ()
@property (nonatomic, strong) UIButton *lastSelect;//上次选中的 button
@property (nonatomic, strong) UIView *bottomLine;//底部线view
@end
@implementation ButtonChangeView
- (instancetype)initWithFrame:(CGRect)frame buttonArray:(NSArray *)buttonArray{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        [self configureButton:buttonArray];
    }
    return  self;
}
- (void)configureButton:(NSArray *)buttonArray{
    NSInteger count= buttonArray.count;
    CGFloat width = SCREEN_WIDTH/count;
    for ( int i=0; i<count; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = ccr(width * i, 0, width, 43);
        btn.tag=i;
        btn.titleLabel.font = [UIFont systemFontOfSize:17];
        [btn setTitle:[buttonArray safeObjectAtIndex:i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        if (i==0) {
            [btn setTitleColor:BaseTheme_Colore forState:UIControlStateNormal];
            self.lastSelect=btn;
            self.bottomLine=[[UIView alloc]init];
            self.bottomLine.bounds=ccr(0, 0, width, 2);
            self.bottomLine.center=ccp(btn.center.x, self.frame.size.height-2);
            self.bottomLine.backgroundColor=BaseTheme_Colore;
            [self addSubview: self.bottomLine];
        }else{
            [btn setTitleColor: [UIColor blueColor] forState:UIControlStateSelected];
        }
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    UIView *bottomView=[[UIView alloc]initWithFrame:ccr(0, self.frame.size.height-1, SCREEN_WIDTH, 1)];
    bottomView.backgroundColor=backGroundCorlor;
    [self addSubview:bottomView];
}
- (void)btnClicked:(UIButton *)sender{
    if (sender.tag==self.lastSelect.tag) {
        return;
    }
    self.bottomLine.center=ccp(sender.center.x, self.frame.size.height-2);
    [sender setTitleColor:BaseTheme_Colore forState:UIControlStateNormal];
    [self.lastSelect setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    self.lastSelect=sender;
    if ([self.delegate respondsToSelector:@selector(buttonChangeViewDidSelectIdex:)]) {
        [self.delegate buttonChangeViewDidSelectIdex:sender.tag];
    }
}
@end
