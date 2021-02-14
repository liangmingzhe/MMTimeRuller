//
//  ViewController.m
//  MMTimeRuler
//
//  Created by benjaminlmz@qq.com on 2021/2/14.
//

#import "ViewController.h"
//#import "MMTimeRuller.h"
#import "MMTimeRullerView.h"

@interface ViewController ()
//@property (nonatomic, strong) MMTimeRuller *timerRuller;
@property (nonatomic, strong) MMTimeRullerView *timerRullerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor grayColor];
    self.timerRullerView = [[MMTimeRullerView alloc] initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 100)];
    [self.view addSubview:self.timerRullerView];
    [self requestData];
}


- (void)requestData {
    static BOOL s = NO;
    NSMutableArray <MMRullerCellModel*> * modelArr = [[NSMutableArray alloc] initWithCapacity:0];
    for (NSInteger i = 0; i < 10; i++) {
        s = !s;
        MMRullerCellModel *model = [[MMRullerCellModel alloc] init];
        model.width = arc4random_uniform(150);
        model.color = s == YES?[UIColor blueColor]:[UIColor redColor];
        [modelArr addObject:[model copy]];
    }
    self.timerRullerView.dataArray = [modelArr copy];
}


@end
