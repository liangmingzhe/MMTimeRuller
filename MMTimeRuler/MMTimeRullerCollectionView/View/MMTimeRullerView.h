//
//  MMTimeRullerView.h
//  MMTimeRuler
//
//  Created by benjaminlmz@qq.com on 2021/2/14.
//

#import <UIKit/UIKit.h>
#import "MMRullerCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface MMTimeRullerView : UIView
@property (nonatomic,strong) NSArray<MMRullerCellModel *>* dataArray;

@end

NS_ASSUME_NONNULL_END
