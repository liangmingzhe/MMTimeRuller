//
//  MMRullerCellModel.h
//  MMTimeRuler
//
//  Created by benjaminlmz@qq.com on 2021/2/14.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface MMRullerCellModel : NSObject <NSCopying>
@property (nonatomic, assign) NSInteger width;
@property (nonatomic, strong) UIColor   *color;

@property (nonatomic ,assign) NSInteger     stepValue;    //  步长     Default 6分钟
@property (nonatomic ,assign) NSInteger     stepNum;      //  间隔     Default 10
@property (nonatomic ,assign) NSInteger     unitLength;   //  大步间隔  Default 100
@property (nonatomic ,assign) NSInteger     index;        //  当前
/*
    
 */

@end

NS_ASSUME_NONNULL_END
