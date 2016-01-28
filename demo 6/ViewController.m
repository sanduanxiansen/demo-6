//
//  ViewController.m
//  demo 6
//
//  Created by admin on 15/12/22.
//  Copyright (c) 2015年 CC. All rights reserved.



//

#import "Masonry.h"
#import "ViewController.h"
#import "ScrollTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WeakSelf
    
    ScrollTextView *scrollView = [[ScrollTextView alloc] init];
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(weakSelf.view).insets(UIEdgeInsetsMake(60, 15, 100, 15));
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
