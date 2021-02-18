//
//  MMTimeRullerCollectionView.h
//  MMTimeRuler
//
//  Created by benjaminlmz@qq.com on 2021/2/14.
//

#import <UIKit/UIKit.h>




NS_ASSUME_NONNULL_BEGIN

@interface MMTimeRullerCollectionView : UICollectionView
@property (nonatomic ,assign) CGFloat       zoomSize;        //  缩放  0.5 ~ 1.0     Default 1
@property (nonatomic ,assign) NSInteger     stepValue;    //  步长                Default 6分钟
@property (nonatomic ,assign) NSInteger     stepNum;      //  间隔                Default 10
@property (nonatomic ,assign) NSInteger     unitLength;   //  大步间隔             Default 100


@end

NS_ASSUME_NONNULL_END
