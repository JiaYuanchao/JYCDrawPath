//
//  JYCViewController.m
//  JYCDrawPath
//
//  Created by yuanchao__2106@163.com on 09/18/2017.
//  Copyright (c) 2017 yuanchao__2106@163.com. All rights reserved.
//

#import "JYCViewController.h"
#import "JYCDrawPathView.h"

@interface JYCViewController ()

@property (nonatomic, strong) JYCDrawPathView *pathView;

@property (nonatomic, strong) UIButton *repealButton;

@end

@implementation JYCViewController

- (void)loadView
{
    self.pathView = [[JYCDrawPathView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _pathView.pathColor = [UIColor redColor];
    _pathView.pathWidth = 3;
    _pathView.backgroundColor = [UIColor whiteColor];
    self.view = _pathView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.repealButton];
}


- (UIButton *)repealButton
{
    if (!_repealButton) {
        _repealButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _repealButton.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - 100) / 2.0, [UIScreen mainScreen].bounds.size.height - 50, 100, 35);
        [_repealButton setTitle:@"撤销" forState:UIControlStateNormal];
        [_repealButton addTarget:self action:@selector(repealButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _repealButton;
}

- (void)repealButtonAction:(UIButton *)sender
{
    [self.pathView repealComplete:^(BOOL canContinueRepeal) {
        if (canContinueRepeal) {
            NSLog(@"还可以继续撤销");
        } else {
            NSLog(@"不能再撤销了");
        }
    }];
}

@end
