//
//  MMRullerCell.h
//  MMTimeRuler
//
//  Created by benjaminlmz@qq.com on 2021/2/14.
//

#import <UIKit/UIKit.h>
#import "MMRullerCellModel.h"
extern void CGContextAddRoundRect(CGContextRef _Nullable context,CGRect rect,CGPathDrawingMode mode,CGFloat radius);

NS_ASSUME_NONNULL_BEGIN


@interface MMRullerCell : UICollectionViewCell
@property (nonatomic,strong)MMRullerCellModel   *model;
@property (weak, nonatomic) IBOutlet UIView     *itemView;
@end

NS_ASSUME_NONNULL_END
