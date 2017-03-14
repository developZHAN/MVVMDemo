//
//  NSObject+TYProperties.h
//  TYMVVMDemo
//
//  Created by 詹瞻 on 2017/3/9.
//  Copyright © 2017年 developZHAN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TYViewProtocol.h"
#import "TYViewModelProtocol.h"
#import "TYViewMangerProtocol.h"
#import "TYMediator.h"

NS_ASSUME_NONNULL_BEGIN

/**
 *  viewModelBlock
 */
typedef _Nonnull id (^viewModelBlock)();
/**
 *  viewMangerInfosBlock
 */
typedef void (^viewMangerInfosBlock)();
/**
 *  viewModelInfosBlock
 */
typedef void (^viewModelInfosBlock)();

@interface NSObject (TYProperties)

/**
 *  viewModelBlock
 */
@property (nonatomic, copy, nonnull) viewModelBlock viewModelBlock;

/**
 *  获取一个对象的全部属性
 */
- (nullable NSDictionary *)ty_allProperties;

/**
 *  viewMangerDelegate
 */
@property (nonatomic, weak, nullable) id<TYViewMangerProtocol> viewMangerDelegate;

/**
 *  viewMangerInfosBlock
 */
@property (nonatomic, copy) viewMangerInfosBlock viewMangerInfosBlock;

/**
 *  viewModelDelegate
 */
@property (nonatomic, weak, nullable) id<TYViewModelProtocol> viewModelDelegate;

/**
 *  viewModelInfosBlock
 */
@property (nonatomic, copy) viewMangerInfosBlock viewModelInfosBlock;

/**
 *  mediator
 */
@property (nonatomic, strong) TYMediator *ty_mediator;

/**
 *  ty_viewMangerInfos
 */
@property (nonatomic, copy) NSDictionary *ty_viewMangerInfos;

/**
 *  ty_viewModelInfos
 */
@property (nonatomic, copy) NSDictionary *ty_viewModelInfos;

@end

NS_ASSUME_NONNULL_END
