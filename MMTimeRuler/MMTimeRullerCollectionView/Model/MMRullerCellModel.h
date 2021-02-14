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
@end

NS_ASSUME_NONNULL_END
