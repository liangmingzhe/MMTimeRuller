//
//  GlobalParams.m
//  MMTimeRuler
//
//  Created by 梁明哲 on 2021/2/15.
//

#import "GlobalParams.h"

@implementation GlobalParams

+ (UIColor *)colorFromRGB:(long)hexValue alpha:(float)alpha {
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0
                           alpha:(alpha)];
}
@end
