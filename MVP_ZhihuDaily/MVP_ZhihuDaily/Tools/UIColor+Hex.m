//
//  UIColor+Hex.m
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/9.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor *)colorWithHexString:(NSString *)hexString {
    unsigned int hexValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:2]; // 跳过 "0x" 前缀
    [scanner scanHexInt:&hexValue];
    return [UIColor colorWithRed:((CGFloat)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((CGFloat)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((CGFloat)(hexValue & 0xFF))/255.0
                           alpha:1.0];
}
@end
