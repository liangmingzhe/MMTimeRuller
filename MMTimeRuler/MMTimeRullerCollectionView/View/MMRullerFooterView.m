//
//  MMRullerFooterView.m
//  MMTimeRuler
//
//  Created by 梁明哲 on 2021/2/17.
//

#import "MMRullerFooterView.h"
#import "GlobalParams.h"
extern void CGContextAddRoundRect(CGContextRef _Nullable context,CGRect rect,CGPathDrawingMode mode,CGFloat radius);
@interface MMRullerFooterView() {
    CGContextRef ctx;
    UIColor *fillColor;
    UIColor *lineColor;
}
@end
@implementation MMRullerFooterView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [self drawRetangleViewWithRect:CGRectMake(0, self.frame.size.height - 15 - 10, 1.5, 15) tag:[NSString stringWithFormat:@"00:00"]];
}

- (void)drawRetangleViewWithRect:(CGRect)rect tag:(NSString *)tag{
    ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, rect.size.width);//线的宽度
    CGContextSetLineJoin(ctx, kCGLineJoinRound);

    lineColor = [GlobalParams colorFromRGB:0x666666 alpha:1];
    fillColor = [GlobalParams colorFromRGB:0x666666 alpha:1];

    CGContextSetStrokeColorWithColor(ctx, lineColor.CGColor);//线框颜色
    CGContextSetFillColorWithColor(ctx, fillColor.CGColor);//填充颜色
    CGContextAddRoundRect(ctx,rect,kCGPathFill,rect.size.width/2);
    
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:10],
                                NSForegroundColorAttributeName:[UIColor colorWithWhite:0.0 alpha:1]};
    CGFloat width = [tag boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:0 attributes:attribute context:nil].size.width;
    [tag drawInRect:CGRectMake(rect.origin.x - width/2, self.frame.size.height - 10, width, 10) withAttributes:attribute];
}
@end
