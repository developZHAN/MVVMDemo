//
//  TYPartIView.m
//  TYMVVMDemo
//
//  Created by 詹瞻 on 2017/3/8.
//  Copyright © 2017年 developZHAN. All rights reserved.
//

#import "TYPartIView.h"
#import "TYPartIModel.h"

@interface TYPartIView ()

/**
 *  测试按钮
 */
@property (nonatomic, weak) UIButton *testBtn;

/**
 *  跳转按钮
 */
@property (nonatomic, weak) UIButton *jumpOtherVCBtn;

/**
 *  测试label
 */
@property (nonatomic, weak) UILabel *testLabel;

@end

@implementation TYPartIView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = TYColorOrange;
        [self setUpAllSubViews];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    _testBtn.ty_centerX = self.ty_centerX * 0.5;
    _testBtn.ty_top = _testBtn.ty_left;
    
    _jumpOtherVCBtn.ty_centerX = self.ty_centerX * 1.5;
    _jumpOtherVCBtn.ty_top = _testBtn.ty_top;
    
    _testLabel.ty_centerX = self.ty_centerX;
    _testLabel.ty_top = _testBtn.ty_bottom + 20;
    
}

#pragma mark - User Method
/**
 *  创建子控件
 */
- (void)setUpAllSubViews
{
    UIButton *testBtn = [TYUICreator createButtonWithTitle:@"点我监听事件改变"
                                                      size:CGSizeMake(self.ty_width / 3, self.ty_height / 3)
                                                titleColor:TYColorBlue
                                                      font:TYFontSize(14)
                                                    target:self
                                                    action:@selector(testBtnClick:)];
    [testBtn setBackgroundColor:TYColorCoffee];
    _testBtn = testBtn;
    [self addSubview:_testBtn];
    
    UIButton *jumpOtherVCBtn = [TYUICreator createButtonWithTitle:@"点我带你去看看"
                                                             size:CGSizeMake(self.ty_width / 3, self.ty_height / 3)
                                                       titleColor:TYColorBlue
                                                             font:TYFontSize(14)
                                                           target:self
                                                           action:@selector(jumpOtherVCBtnClick:)];
    [jumpOtherVCBtn setBackgroundColor:TYColorGray];
    _jumpOtherVCBtn = jumpOtherVCBtn;
    [self addSubview:_jumpOtherVCBtn];
    
    UILabel *testLabel = [TYUICreator createLabelWithSize:CGSizeMake(self.ty_width, 30)
                                                     text:@"我是来显示模型数据的"
                                                    color:TYColorBlackFont
                                                     font:TYFontSize(18)];
    testLabel.textAlignment = NSTextAlignmentCenter;
    testLabel.backgroundColor = TYColorClear;
    _testLabel = testLabel;
    [self addSubview:_testLabel];
}


/**
 *  按钮点击事件
 */
- (void)testBtnClick:(UIButton *)sender
{
    //传递事件
//    if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(ty_view:withEvents:)]) {
//        [self.viewDelegate ty_view:self withEvents:@{@"click" : @"btn"}];
//    }
    
//    if (self.viewEventsBlock) {
//        self.viewEventsBlock(@"btnClick");
//    }
}

- (void)jumpOtherVCBtnClick:(UIButton *)sender
{
    //传递事件
    if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(ty_view:withEvents:)]) {
        [self.viewDelegate ty_view:self withEvents:@{@"jump" : @"vc"}];
    }
}

/**
 *  根据模型数据配置view
 */
//- (void)ty_configureViewWithModel:(id)model

/**
 *  根据视图模型数据配置view
 */
- (void)ty_configureViewWithViewModel:(id<TYViewModelProtocol>)viewModel{
    
    [viewModel ty_viewModelWithModelBlock:^(id model) {
        TYPartIModel *partIModel = (TYPartIModel *)model;
        self.testLabel.text = partIModel.title;
    }];
}

@end
