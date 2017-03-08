//
//  TYPartIVC.m
//  TYMVVMDemo
//
//  Created by 詹瞻 on 2017/3/7.
//  Copyright © 2017年 developZHAN. All rights reserved.
//

#import "TYPartIVC.h"

#import "TYPartIView.h"

@interface TYPartIVC ()



@end

@implementation TYPartIVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MVVM Demo";
    self.view.backgroundColor = TYColorWhiteBg;
    
    //将 partI 的事件处理者代理给 partIViewManger (代理方式)
    
    TYPartIView *partIView = [[TYPartIView alloc] initWithFrame:CGRectMake(0, TYHeightNavigationBar, TYWidthDevice, 180)];
    
    [self.view addSubview:partIView];

    

}



@end
