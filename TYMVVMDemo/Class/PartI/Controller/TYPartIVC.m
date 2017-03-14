//
//  TYPartIVC.m
//  TYMVVMDemo
//
//  Created by 詹瞻 on 2017/3/7.
//  Copyright © 2017年 developZHAN. All rights reserved.
//

#import "TYPartIVC.h"

#import "TYPartIView.h"

#import "TYPartIViewManger.h"
#import "TYPartIViewModel.h"

@interface TYPartIVC ()

@property (nonatomic, strong)TYPartIViewManger *partIViewManger;
@property (nonatomic, strong)TYPartIViewModel *partIViewModel;
@property (nonatomic, weak) TYPartIView *partIView;

@end

@implementation TYPartIVC

- (instancetype)init{
    if (self = [super init]) {
        
        UIButton *centreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
        centreBtn.ty_size = CGSizeMake(200, 60);
        [centreBtn setTitle:@"点我加载/改变模型数据" forState:UIControlStateNormal];
        [centreBtn addTarget:self action:@selector(centreBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
        centreBtn.backgroundColor = TYColorWithRandomAlpha(1);
        centreBtn.center = self.view.center;
        
        [self.view addSubview:centreBtn];
        
    }
    return self;
}

/**
 *  懒加载
 */
- (TYPartIView *)partIView{
    if (!_partIView) {
        TYPartIView *partIView = [[TYPartIView alloc] initWithFrame:CGRectMake(0, 66, TYWidthDevice, 200)];
        [self.view addSubview:(_partIView = partIView)];
    }
    
    return _partIView;
}

- (TYPartIViewManger *)partIViewManger{
    if (!_partIViewManger) {
        _partIViewManger = [[TYPartIViewManger alloc] init];
    }
    return _partIViewManger;
}

- (TYPartIViewModel *)partIViewModel{
    if (!_partIViewModel) {
        _partIViewModel = [[TYPartIViewModel alloc] init];
    }
    return _partIViewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MVVM Demo";
    self.view.backgroundColor = TYColorWhiteBg;
    
    //将 partI 的事件处理者代理给 partIViewManger (代理方式)
    [self.partIView ty_viewWithViewManger:self.partIViewManger];
    
//    // self.partIView.viewEventsBlock (block方式)
//    self.partIView.viewEventsBlock = [self.partIViewManger ty_viewMangerWithViewEventBlockOfInfos:@{@"view" : self.partIView}];
//    
//    // viewManger ----> info <-----  viewModel 之间通过代理方式交互
//    self.partIViewManger.viewMangerDelegate = self.partIViewModel;
//    self.partIViewModel.viewModelDelegate = self.partIViewManger;
//    
//    // viewManger ----> info <-----  viewModel 之间通过block方式交互
//    self.partIViewManger.viewMangerInfosBlock = [self.partIViewModel ty_viewModelWithViewMangerBlockOfInfos:@{@"info" : @"viewManger"}];
//    
//    // 中介者传值
//    TYMediator *mediator = [TYMediator mediatorWithViewModel:self.partIViewModel viewManger:self.partIViewManger];
//    
//    self.partIViewManger.ty_mediator = mediator;
//    self.partIViewModel.ty_mediator = mediator;
//    
//    self.partIViewManger.ty_viewMangerInfos = @{@"xxxxxx" : @"22222222"};
//    [self.partIViewManger ty_notice];
//    NSLog(@"viewManger------>viewModel==%@", self.partIViewModel.ty_viewModelInfos);
//    
//    self.partIViewModel.ty_viewModelInfos = @{@"oooooo" : @"888888888"};
//    [self.partIViewModel ty_notice];
//    NSLog(@"viewModel=====>viewManger==%@", self.partIViewManger.ty_viewMangerInfos);

}

- (void)centreBtnDidClick:(UIButton *)sender
{
    // 根据viewModel配置view
    [self.partIView ty_configureViewWithModel:self.partIViewModel];
}

@end
