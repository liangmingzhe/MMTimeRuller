//
//  ViewController.m
//  MMTimeRuler
//
//  Created by benjaminlmz@qq.com on 2021/2/14.
//

#import "ViewController.h"
#import "MMTimeRuller.h"
@interface ViewController ()
@property (nonatomic, strong) MMTimeRuller *timerRuller;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.timerRuller = [[MMTimeRuller alloc] initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 100)];
    self.timerRuller.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.timerRuller];
}


@end
