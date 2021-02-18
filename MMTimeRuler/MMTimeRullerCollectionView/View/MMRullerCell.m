//
//  MMRullerCell.m
//  MMTimeRuler
//
//  Created by benjaminlmz@qq.com on 2021/2/14.
//

#import "MMRullerCell.h"
#import "GlobalParams.h"
@interface MMRullerCell() {
    CGContextRef ctx;
    UIColor *fillColor;
    UIColor *lineColor;
    
}

@end
@implementation MMRullerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(MMRullerCellModel *)model {
    _model = model;
    self.itemView.backgroundColor = self.model.color;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    static NSInteger stepNum = 10;
    NSInteger unitLength = rect.size.width/stepNum;
    for (NSInteger i = 0;i <= stepNum; i ++) {
        if (i == 0) {
            NSInteger hour = self.model.index + 1;
            [self drawRetangleViewWithRect:CGRectMake(i * unitLength, self.frame.size.height - 15 - 10, 1.5, 15) tag:[NSString stringWithFormat:@"%02ld:00",(long)hour]];
        }else if(i%10 == 0) {
            NSInteger hour = self.model.index + 1;
            [self drawRetangleViewWithRect:CGRectMake(i * unitLength, self.frame.size.height - 15 - 10, 1.5, 15) tag:[NSString stringWithFormat:@"%02ld:00",(long)hour]];
        }else if(i == 5){
            [self drawRetangleViewWithRect:CGRectMake(i * unitLength, self.frame.size.height - 10 - 10, 1.5, 10) tag:@""];
        }else {
            [self drawRetangleViewWithRect:CGRectMake(i * unitLength, self.frame.size.height - 5 - 10, 1.5, 5) tag:@""];
        }

    }
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
