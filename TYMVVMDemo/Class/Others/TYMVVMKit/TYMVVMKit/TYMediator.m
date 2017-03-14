//
//  TYMediator.m
//  TYMVVMDemo
//
//  Created by 詹瞻 on 2017/3/9.
//  Copyright © 2017年 developZHAN. All rights reserved.
//

#import "TYMediator.h"
#import "NSObject+TYProperties.h"


@implementation TYMediator

- (instancetype)initWithViewModel:(id<TYViewModelProtocol>)viewModel viewManger:(id<TYViewMangerProtocol>)viewManger{
    if (self = [super init]) {
        self.viewModel = (NSObject<TYViewModelProtocol> *)viewModel;
        self.viewManger = (NSObject<TYViewMangerProtocol> *)viewManger;
    }
    
    return self;
}

+ (instancetype)mediatorWithViewModel:(id<TYViewModelProtocol>)viewModel viewManger:(id<TYViewMangerProtocol>)viewManger{
    return [[self alloc] initWithViewModel:viewModel viewManger:viewManger];
}

- (void)noticeViewModelWithInfos:(NSDictionary *)infos{
    self.viewModel.ty_viewModelInfos = infos;
}

- (void)noticeViewMangerWithInfos:(NSDictionary *)infos{
    self.viewManger.ty_viewMangerInfos = infos;
}

@end
