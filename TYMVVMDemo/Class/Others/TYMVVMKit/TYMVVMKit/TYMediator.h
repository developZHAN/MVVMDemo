//
//  TYMediator.h
//  TYMVVMDemo
//
//  Created by 詹瞻 on 2017/3/9.
//  Copyright © 2017年 developZHAN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TYViewModelProtocol.h"
#import "TYViewMangerProtocol.h"

@interface TYMediator : NSObject

/**
 *  viewModel
 */
@property (nonatomic, strong) NSObject<TYViewModelProtocol> *viewModel;

/**
 *  viewManger
 */
@property (nonatomic, strong) NSObject<TYViewMangerProtocol> *viewManger;

/**
 *  初始化
 */
- (instancetype)initWithViewModel:(id<TYViewModelProtocol>)viewModel viewManger:(id<TYViewMangerProtocol>)viewManger;

+ (instancetype)mediatorWithViewModel:(id<TYViewModelProtocol>)viewModel viewManger:(id<TYViewMangerProtocol>)viewManger;

/**
 *  将info通知viewModel
 */
- (void)noticeViewModelWithInfos:(NSDictionary *)infos;

/**
 *  将infos通知viewManger
 */
- (void)noticeViewMangerWithInfos:(NSDictionary *)infos;

@end
