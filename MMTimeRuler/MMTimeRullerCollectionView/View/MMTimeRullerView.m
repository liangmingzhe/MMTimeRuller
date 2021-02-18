//
//  MMTimeRullerView.m
//  MMTimeRuler
//
//  Created by benjaminlmz@qq.com on 2021/2/14.
//

#import "MMTimeRullerView.h"
#import "MMRullerHeadView.h"
#import "MMRullerFooterView.h"
#import "MMTimeRullerCollectionView.h"
#import "GlobalParams.h"
#define kMMRullerCellID @"MMRullerCell"
#define kMMRullerHeadViewID @"MMRullerHeadView"
#define kMMRullerFooterViewID @"MMRullerFooterView"
#define WIDTH  [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface MMTimeRullerView ()<UICollectionViewDelegate,UICollectionViewDataSource> {
    CGContextRef ctx;
    UIColor *fillColor;
    UIColor *lineColor;
    
}

//类别添加属性
@property (nonatomic ,strong) UICollectionViewFlowLayout *layout;
@property (nonatomic ,strong) MMTimeRullerCollectionView *rullerCollectionView;
@property (nonatomic ,strong) MMRullerHeadView           *rullerHeaderView;

@property (nonatomic ,strong) UIPinchGestureRecognizer *pinchGestureRecognizer;
@property (nonatomic ,assign) float precent;

@end

@implementation MMTimeRullerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupRullerCollectionView];
        self.pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchHandle:)];
        [self.rullerCollectionView addGestureRecognizer:self.pinchGestureRecognizer];
        self.backgroundColor = [UIColor whiteColor];
        _unitLength = 100;                      //每一大格是100
        _zoomSize = 1;
        self.stepNum = 10;
        self.stepValue = 6;
        _rullerCollectionView.stepNum = 10;     //每大格分10小格
        _rullerCollectionView.stepValue = 6;    //每小格6分钟
        _rullerCollectionView.unitLength = _unitLength;
    }
    return self;
}

- (void)setupRullerCollectionView {
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.layout.minimumLineSpacing = 0; // 行间距(最小值)
    self.layout.minimumInteritemSpacing = 0; // item间距(最小值)
    self.rullerCollectionView = [[MMTimeRullerCollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.layout];
    [self.rullerCollectionView registerNib:[UINib nibWithNibName:@"MMRullerCell" bundle:nil] forCellWithReuseIdentifier:kMMRullerCellID];
    
    [self.rullerCollectionView registerClass:[MMRullerHeadView class]
                  forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                         withReuseIdentifier:kMMRullerHeadViewID];
    [self.rullerCollectionView registerClass:[MMRullerFooterView class]
                  forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                         withReuseIdentifier:kMMRullerFooterViewID];
    
    self.rullerCollectionView.showsHorizontalScrollIndicator = NO;
    self.rullerCollectionView.delegate = self;
    self.rullerCollectionView.dataSource = self;
    [self addSubview:self.rullerCollectionView];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    // 输出点击的view的类名
    NSLog(@"%@", NSStringFromClass([touch.view class]));
    // 若为UITableViewCellContentView（即点击了tableViewCell），则不截获Touch事件
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    return  YES;

}

- (void)pinchHandle:(UIPinchGestureRecognizer *)sender {
    static float originDistance = 0;
    int touchCount = (int)sender.numberOfTouches;
    if (touchCount == 2) {
        if (sender.state == UIGestureRecognizerStateBegan) {
            CGPoint p1 = [sender locationOfTouch:0 inView:self];
            CGPoint p2 = [sender locationOfTouch:1 inView:self];
            originDistance = sqrt((p1.x - p2.x)* (p1.x - p2.x) + (p1.y - p2.y)* (p1.y - p2.y));
        }
        else if (sender.state == UIGestureRecognizerStateChanged) {
            CGPoint p1 = [sender locationOfTouch:0 inView:self];
            CGPoint p2 = [sender locationOfTouch:1 inView:self];
            float movedDistance = sqrt((p1.x - p2.x)* (p1.x - p2.x) + (p1.y - p2.y)* (p1.y - p2.y));

            if (movedDistance > originDistance) {
                if (self.zoomSize >= 2.0) {
                    return;
                }
                self.zoomSize = self.zoomSize + 0.1;
            }
            else {
                if (self.zoomSize <= 0.5) {
                    return;
                }
                self.zoomSize = self.zoomSize - 0.1;
            }

        }
    }
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
    MMRullerCellModel *model = [self.dataArray[indexPath.row] copy];
    model.index = indexPath.row;
    cell.model = model;
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake([UIScreen mainScreen].bounds.size.width * 0.5, self.rullerHeaderView.frame.size.height);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake([UIScreen mainScreen].bounds.size.width * 0.5, self.rullerHeaderView.frame.size.height);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    UICollectionReusableView *reusableView =nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        
        MMRullerHeadView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kMMRullerHeadViewID forIndexPath:indexPath];
        
        return headView;
    }else  if (kind == UICollectionElementKindSectionFooter) {
        
        MMRullerFooterView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:kMMRullerFooterViewID forIndexPath:indexPath];
        return footerView;
    }

    return reusableView;
    
}

- ( CGSize )collectionView:( UICollectionView *)collectionView layout:( UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:( NSIndexPath *)indexPath{
    CGFloat w = self.unitLength;
    return CGSizeMake(w, collectionView.frame.size.height);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0.f;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0.f;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    _timeStamp = 60 * 60 * 24 * self.rullerCollectionView.contentOffset.x/(self.rullerCollectionView.contentSize.width - WIDTH);
}

- (void)moveToTime:(NSInteger)timeStamp {
//    60 * 60 * 24 = 86400
//    timeStamp/(60 * 60 * 24);
    CGFloat contentSize = _rullerCollectionView.contentSize.width - WIDTH;
    
    CGFloat x = (contentSize) * (double)timeStamp/(60 * 60 * 24);
    _rullerCollectionView.contentOffset = CGPointMake(x, 0);
    NSInteger hour = self.timeStamp/3600;
    NSInteger min = (self.timeStamp%3600)/60;
    NSLog(@"offset_x = %f ,contentSize = %f, time_stamp = %ld, \ntime = %02ld:%02ld",x,contentSize,(long)self.timeStamp,(long)hour,(long)min);
    NSLog(@"----");
}


/*
             50   -  100  -  200
    zoomSize 0.5  -   1   -  2

 */

- (void)setZoomSize:(CGFloat)zoomSize {
    if (zoomSize >= 2.0 || zoomSize <= 0.5) {
        return;
    }
    _zoomSize = zoomSize;
    _unitLength = 100 * zoomSize;
    [self.rullerCollectionView reloadData];
    [self moveToTime:self.timeStamp];
}
@end
