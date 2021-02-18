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

@property (nonatomic,assign) NSInteger      unitLength;     //  每一大格之间的长度 Default 100 代表100的长度均分1个小时

@property (nonatomic ,assign) NSInteger     stepValue;      //  步长                Default 6分钟
@property (nonatomic ,assign) NSInteger     stepNum;        //  间隔                Default 10
@property (nonatomic ,assign) NSInteger     timeStamp;      //
@property (nonatomic ,assign) CGFloat       zoomSize;       //  缩放比: 0.5 ~ 2.0

- (void)moveToTime:(NSInteger)timeStamp;
@end

NS_ASSUME_NONNULL_END
