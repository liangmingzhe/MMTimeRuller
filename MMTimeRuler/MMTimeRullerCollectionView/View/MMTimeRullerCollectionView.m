//
//  MMTimeRullerCollectionView.m
//  MMTimeRuler
//
//  Created by benjaminlmz@qq.com on 2021/2/14.
//

#import "MMTimeRullerCollectionView.h"
#import "GlobalParams.h"

extern void CGContextAddRoundRect(CGContextRef _Nullable context,CGRect rect,CGPathDrawingMode mode,CGFloat radius);
@interface MMTimeRullerCollectionView()<UIScrollViewDelegate> {
    CGContextRef ctx;
    UIColor *fillColor;
    UIColor *lineColor;
}
@end

@implementation MMTimeRullerCollectionView

- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}


- (void)drawRect:(CGRect)rect {
    //中新红线
    [self drawRetangleViewWithRect:CGRectMake(rect.size.width * 0.5, 0, 1.5, rect.size.height)];
}


- (void)drawRetangleViewWithRect:(CGRect)rect{
    ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, rect.size.width);//线的宽度
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    lineColor = [GlobalParams colorFromRGB:0xff6666 alpha:1];
    fillColor = [GlobalParams colorFromRGB:0xff6666 alpha:1];
    CGContextSetStrokeColorWithColor(ctx, lineColor.CGColor);//线框颜色
    CGContextSetFillColorWithColor(ctx, fillColor.CGColor);//填充颜色
    CGContextAddRoundRect(ctx,rect,kCGPathFill,rect.size.width/2);
}

@end
