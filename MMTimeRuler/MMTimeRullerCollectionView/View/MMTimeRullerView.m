//
//  MMTimeRullerView.m
//  MMTimeRuler
//
//  Created by benjaminlmz@qq.com on 2021/2/14.
//

#import "MMTimeRullerView.h"
#import "MMTimeRullerCollectionView.h"

#define kMMRullerCellID @"MMRullerCell"

@interface MMTimeRullerView ()<UICollectionViewDelegate,UICollectionViewDataSource>
//类别添加属性
@property (nonatomic ,strong) UICollectionViewFlowLayout *layout;
@property (nonatomic ,strong) MMTimeRullerCollectionView *rullerCollectionView;


@end

@implementation MMTimeRullerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    
    }
    return self;
}

- (void)layoutSubviews {
    [self setupRullerCollectionView];
}

- (void)setupRullerCollectionView {
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.layout.minimumLineSpacing = 0; // 行间距(最小值)
    self.layout.minimumInteritemSpacing = 0; // item间距(最小值)
    self.rullerCollectionView = [[MMTimeRullerCollectionView alloc] initWithFrame:self.bounds
                                                                                    collectionViewLayout:self.layout];
    [self.rullerCollectionView registerNib:[UINib nibWithNibName:@"MMRullerCell" bundle:nil] forCellWithReuseIdentifier:kMMRullerCellID];
    self.rullerCollectionView.showsHorizontalScrollIndicator = NO;
    self.rullerCollectionView.delegate = self;
    self.rullerCollectionView.dataSource = self;
    [self addSubview:self.rullerCollectionView];
}


- (void)setDataArray:(NSArray<MMRullerCellModel *> *)dataArray {
    _dataArray = dataArray;
    [self.rullerCollectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (NSInteger)numberOfSections {
    return 1;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MMRullerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kMMRullerCellID forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

- ( CGSize )collectionView:( UICollectionView *)collectionView layout:( UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:( NSIndexPath *)indexPath{
    CGFloat w = self.dataArray[indexPath.row].width;
    return CGSizeMake(w, collectionView.frame.size.height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

@end
