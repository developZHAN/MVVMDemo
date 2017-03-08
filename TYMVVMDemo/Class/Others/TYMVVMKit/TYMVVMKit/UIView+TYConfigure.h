//
//  UIView+TYConfigure.h
//  TYMVVMDemo
//
//  Created by 詹瞻 on 2017/3/8.
//  Copyright © 2017年 developZHAN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TYViewModelProtocol.h"

@interface UIView (TYConfigure)

/**
 *  根据model配置UIView, 设置UIView内容
 */
- (void)ty_configureViewWithModel:(id)model;

/**
 *  根据viewModel配置UIView, 设置UIView内容
 */
- (void)ty_configureViewWithViewModel:(id<TYViewModelProtocol>)viewModel;

@end
