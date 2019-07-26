//
//  UIColor+category.m
//  IntelligenceStudents
//
//  Created by xiaoshunliang on 2016/12/16.
//  Copyright © 2016年 GaoJuan. All rights reserved.
//

#import "UIColor+category.h"

@implementation UIColor (category)
+ (UIColor *)colorWithHexString:(NSString *)hexString {
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red = [self colorComponentFrom:colorString start:0 length:1];
            green = [self colorComponentFrom:colorString start:1 length:1];
            blue = [self colorComponentFrom:colorString start:2 length:1];
            break;
            
        case 4: // #ARGB
            alpha = [self colorComponentFrom:colorString start:0 length:1];
            red = [self colorComponentFrom:colorString start:1 length:1];
            green = [self colorComponentFrom:colorString start:2 length:1];
            blue = [self colorComponentFrom:colorString start:3 length:1];
            break;
            
        case 6: // #RRGGBB
            alpha = 1.0f;
            red = [self colorComponentFrom:colorString start:0 length:2];
            green = [self colorComponentFrom:colorString start:2 length:2];
            blue = [self colorComponentFrom:colorString start:4 length:2];
            break;
            
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom:colorString start:0 length:2];
            red = [self colorComponentFrom:colorString start:2 length:2];
            green = [self colorComponentFrom:colorString start:4 length:2];
            blue = [self colorComponentFrom:colorString start:6 length:2];
            break;
            
        default:
            [NSException raise:@"Invalid color value" format:@"Color value %@ is invalid.  It should be a hex value of the form #RBG, #ARGB, #RRGGBB, or #AARRGGBB", hexString];
            break;
    }
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}
+ (CGFloat)colorComponentFrom:(NSString *)string start:(NSUInteger)start length:(NSUInteger)length {
    NSString *substring = [string substringWithRange:NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat:@"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString:fullHex] scanHexInt:&hexComponent];
    
    return hexComponent / 255.0;
}

+ (id)colorWithHex:(unsigned int)hex {
    return [UIColor colorWithHex:hex alpha:1.0];
}
+ (id)colorWithHex:(unsigned int)hex alpha:(float)alpha {
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:alpha];
}
+ (UIColor *)colorWithRGB:(NSString *)rgbString {
    NSArray *rgb = [rgbString componentsSeparatedByString:@","];
    return [UIColor colorWithRed:[[rgb objectAtIndex:0] floatValue] / 255 green:[[rgb objectAtIndex:1] floatValue] / 255 blue:[[rgb objectAtIndex:2] floatValue] / 255 alpha:1];
}

+ (UIColor *)colorWithRGB:(NSString *)rgbString alpha:(NSString *)alpha{
    NSArray *rgb = [rgbString componentsSeparatedByString:@","];
    return [UIColor colorWithRed:[[rgb objectAtIndex:0] floatValue] / 255 green:[[rgb objectAtIndex:1] floatValue] / 255 blue:[[rgb objectAtIndex:2] floatValue] / 255 alpha:[alpha floatValue]];
}
@end
