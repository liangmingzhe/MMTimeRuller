//
//  MMRullerCell.m
//  MMTimeRuler
//
//  Created by benjaminlmz@qq.com on 2021/2/14.
//

#import "MMRullerCell.h"

@implementation MMRullerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(MMRullerCellModel *)model {
    _model = model;
    self.backgroundColor = self.model.color;
}

@end
