//
//  MMTimeRuller.m
//  MMTimeRuler
//
//  Created by benjaminlmz@qq.com on 2021/2/14.
//

#import "MMTimeRuller.h"
#import "GlobalParams.h"
@interface MMTimeRuller() {
    CGContextRef ctx;
    UIColor *fillColor;
    UIColor *lineColor;
}
@property (nonatomic,strong)UIPinchGestureRecognizer *pinGesture;
@end
@implementation MMTimeRuller


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentSize = CGSizeMake(frame.size.width * 2, frame.size.height);
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    [self drawRetangleViewWithRect:CGRectMake(50, 0, 30, rect.size.height)];
}

- (void)drawRetangleViewWithRect:(CGRect)rect {
    ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 1);//线的宽度
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
   
    lineColor = [GlobalParams colorFromRGB:0x666666 alpha:1];;
    fillColor = [GlobalParams colorFromRGB:0x666666 alpha:1];;
    CGContextSetStrokeColorWithColor(ctx, lineColor.CGColor);//线框颜色
    CGContextSetFillColorWithColor(ctx, fillColor.CGColor);//填充颜色
    CGContextAddRoundRect(ctx,rect,kCGPathFill,0);
}
void CGContextAddRoundRect(CGContextRef context,CGRect rect,CGPathDrawingMode mode,CGFloat radius){
    float x1=rect.origin.x;
    float y1=rect.origin.y;
    float x2=x1+rect.size.width;
    float y2=y1;
    float x3=x2;
    float y3=y1+rect.size.height;
    float x4=x1;
    float y4=y3;
    CGContextMoveToPoint(context, x1, y1+radius);
    CGContextAddArcToPoint(context, x1, y1, x1+radius, y1, radius);
    
    CGContextAddArcToPoint(context, x2, y2, x2, y2+radius, radius);
    CGContextAddArcToPoint(context, x3, y3, x3-radius, y3, radius);
    CGContextAddArcToPoint(context, x4, y4, x4, y4-radius, radius);
    
    CGContextClosePath(context);
    CGContextDrawPath(context, mode); //根据坐标绘制路径
}
@end
