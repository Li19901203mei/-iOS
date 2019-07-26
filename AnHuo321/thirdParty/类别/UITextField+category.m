//
//  UITextField+category.m
//  OrganizationDepartment
//
//  Created by xiaoshunliang on 16/10/12.
//  Copyright © 2016年 bodaokeji. All rights reserved.
//

#import "UITextField+category.h"
#import <objc/runtime.h>
@implementation UITextField (category)
static NSString *kLimitTextLengthKey = @"kLimitTextLengthKey";

- (void)limitTextLength:(NSInteger)length {
    objc_setAssociatedObject(self, (__bridge const void *)(kLimitTextLengthKey), [NSNumber numberWithInteger:length], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addTarget:self action:@selector(textFieldTextLengthLimit:) forControlEvents:UIControlEventEditingChanged];
}

- (void)textFieldTextLengthLimit:(id)sender {
    NSNumber *lengthNumber = objc_getAssociatedObject(self, (__bridge const void *)(kLimitTextLengthKey));
    NSUInteger length = [lengthNumber intValue];
    
    if (self.text.length > length) {
        self.text = [self.text substringToIndex:length];
    }
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    if ([self respondsToSelector:@selector(setAttributedPlaceholder:)]) {
        UIColor *color = placeholderColor;
        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName: color}];
        //        self.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.75];
    } else {
        // earlier than iOS 6.0
    }
    
}

@end
