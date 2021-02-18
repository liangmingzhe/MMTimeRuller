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
    self.timerRullerView = [[MMTimeRullerView alloc] initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 80)];
    [self.view addSubview:self.timerRullerView];
    [self requestData];
}


- (void)requestData {
    static BOOL s = NO;
    NSMutableArray <MMRullerCellModel*> * modelArr = [[NSMutableArray alloc] initWithCapacity:0];
    for (NSInteger i = 0; i < 24; i++) {
        s = !s;
        
        MMRullerCellModel *model = [[MMRullerCellModel alloc] init];
        
        model.color = s == YES?[UIColor colorWithRed:0.1 green:0.4 blue:0.8 alpha:0.5]:[UIColor colorWithRed:1 green:0.2 blue:0.1 alpha:0.8];
        [modelArr addObject:[model copy]];
    }
    self.timerRullerView.dataArray = [modelArr copy];
}

- (IBAction)plus:(id)sender {
    self.timerRullerView.zoomSize = self.timerRullerView.zoomSize + 0.1;
    
    
}
- (IBAction)minus:(id)sender {
    self.timerRullerView.zoomSize = self.timerRullerView.zoomSize - 0.1;
    [self.timerRullerView setNeedsDisplay];
}

@end
