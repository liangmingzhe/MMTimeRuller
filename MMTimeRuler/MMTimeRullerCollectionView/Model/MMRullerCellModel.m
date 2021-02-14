//
//  MMRullerCellModel.m
//  MMTimeRuler
//
//  Created by benjaminlmz@qq.com on 2021/2/14.
//

#import "MMRullerCellModel.h"

@implementation MMRullerCellModel

- (__kindof MMRullerCellModel *)copyWithZone:(NSZone *)zone {
    MMRullerCellModel *m = [[MMRullerCellModel alloc] init];
    m.color = self.color;
    m.width = self.width;
    return m;
}
@end
