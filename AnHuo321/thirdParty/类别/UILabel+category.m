//
//  UILabel+category.m
//  BeautyMall
//
//  Created by 房房信 on 2018/7/17.
//  Copyright © 2018年 房房信. All rights reserved.
//

#import "UILabel+category.h"
#import <objc/runtime.h>
#import <CoreText/CoreText.h>

@implementation UILabel (category)
-(CGFloat)characterSpace{
    return [objc_getAssociatedObject(self,_cmd) floatValue];
}

-(void)setCharacterSpace:(CGFloat)characterSpace{
    objc_setAssociatedObject(self, @selector(characterSpace), @(characterSpace), OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

-(CGFloat)lineSpace{
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

-(void)setLineSpace:(CGFloat)lineSpace{
    objc_setAssociatedObject(self, @selector(lineSpace), @(lineSpace), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


-(NSString *)keywords{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setKeywords:(NSString *)keywords{
    objc_setAssociatedObject(self, @selector(keywords), keywords, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIFont *)keywordsFont{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setKeywordsFont:(UIFont *)keywordsFont{
    objc_setAssociatedObject(self, @selector(keywordsFont), keywordsFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIColor *)keywordsColor{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setKeywordsColor:(UIColor *)keywordsColor{
    objc_setAssociatedObject(self, @selector(keywordsColor), keywordsColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSString *)underlineStr{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setUnderlineStr:(NSString *)underlineStr{
    objc_setAssociatedObject(self, @selector(underlineStr), underlineStr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

-(UIColor *)underlineColor{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setUnderlineColor:(UIColor *)underlineColor{
    objc_setAssociatedObject(self, @selector(underlineColor), underlineColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

/**
 *  根据最大宽度计算label宽，高
 *
 *  @param maxWidth 最大宽度
 *
 *  @return size
 */
- (CGSize)getLableSizeWithMaxWidth:(CGFloat)maxWidth{

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:self.text];
    [attributedString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0,self.text.length)];

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.alignment=self.textAlignment;
    paragraphStyle.lineBreakMode=self.lineBreakMode;
    // 行间距
    if(self.lineSpace > 0){
        [paragraphStyle setLineSpacing:self.lineSpace];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0,self.text.length)];
    }

    // 字间距
    if(self.characterSpace > 0){
        long number = self.characterSpace;
        CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
        [attributedString addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(0,[attributedString length])];

        CFRelease(num);
    }

    //关键字
    if (self.keywords) {
        NSRange itemRange = [self.text rangeOfString:self.keywords];
        if (self.keywordsFont) {
            [attributedString addAttribute:NSFontAttributeName value:self.keywordsFont range:itemRange];

        }

        if (self.keywordsColor) {
            [attributedString addAttribute:NSForegroundColorAttributeName value:self.keywordsColor range:itemRange];

        }
    }

    //下划线
    if (self.underlineStr) {
        NSRange itemRange = [self.text rangeOfString:self.underlineStr];
        [attributedString addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:itemRange];
        if (self.underlineColor) {
            [attributedString addAttribute:NSUnderlineColorAttributeName value:self.underlineColor range:itemRange];
        }
    }



    self.attributedText = attributedString;

    //计算方法一
    //计算文本rect，但是发现设置paragraphStyle.lineBreakMode=NSLineBreakByTruncatingTail;后高度计算不准确
    //CGRect rect = [attributedString boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];

    //计算方法二
    CGSize maximumLabelSize = CGSizeMake(maxWidth, MAXFLOAT);//labelsize的最大值
    CGSize expectSize = [self sizeThatFits:maximumLabelSize];

    return expectSize;
}
- (void)setColorTextWithFistText:(NSInteger)firstLoc andLastText:(NSInteger)secondLoc andChangeColor:(UIColor *)changeColor andTextFontsize:(CGFloat )fontsize {
    // 创建Attributed
    NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:self.text];
    // 需要改变的区间
    NSRange range = NSMakeRange(firstLoc, secondLoc - firstLoc);
    // 改变颜色
    [noteStr addAttribute:NSForegroundColorAttributeName value:changeColor range:range];
    // 改变字体大小及类型
    //    [noteStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Helvetica-BoldOblique" size:27] range:range];
    //文字大小
    [noteStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontsize] range:range];

    // 为label添加Attributed
    [self setAttributedText:noteStr];
}
- (void)setLineTextWithFistText:(NSInteger)firstLoc andLastText:(NSInteger)secondLoc andChangeColor:(UIColor *)changeColor andTextFontsize:(CGFloat )fontsize{
     NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:self.text];
     NSRange range = NSMakeRange(firstLoc, secondLoc - firstLoc);
    //添加中划线
     [noteStr addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:range];
    //设置字体颜色
    [noteStr addAttribute:NSForegroundColorAttributeName value:changeColor range:range];
    //文字大小
    [noteStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontsize] range:range];
    [self setAttributedText:noteStr];
}
@end
