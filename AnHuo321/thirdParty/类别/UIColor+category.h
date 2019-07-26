//
//  UIColor+category.h
//  IntelligenceStudents
//
//  Created by xiaoshunliang on 2016/12/16.
//  Copyright © 2016年 GaoJuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (category)
/**
 *  Create a color from a HEX string
 *
 *  @param hexString HEX string
 *
 *  @return Return the UIColor instance
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;

/**
 *  Create a color from HEX
 *
 *  @param hex HEX value
 *
 *  @return Return the UIColor instance
 */
+ (UIColor *)colorWithHex:(unsigned int)hex;
/**
 *  Create a color from HEX with alpha
 *
 *  @param hex   HEX value
 *  @param alpha Alpha value
 *
 *  @return Return the UIColor instance
 */
+ (UIColor *)colorWithHex:(unsigned int)hex
                    alpha:(float)alpha;
/**
 *  Create a color form a RGB string
 *
 *  @param rgbString RGB string
 *
 *  @return Return the UIColor instance
 */
+ (UIColor *)colorWithRGB:(NSString *)rgbString;
+ (UIColor *)colorWithRGB:(NSString *)rgbString alpha:(NSString *)alpha;
@end
