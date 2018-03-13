//
//  ViewController.m
//  TagView
//
//  Created by 卞西西 on 16/8/23.
//  Copyright © 2016年 卞西西. All rights reserved.
//

#import "ViewController.h"

#import "NewLineButtonView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NewLineButtonView *tagView = [NewLineButtonView GetView:@[@"woshhjkdschhs",@"fghjk",@"rtyu"] width:[UIScreen mainScreen].bounds.size.width - 30];
    [self.view addSubview:tagView];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
