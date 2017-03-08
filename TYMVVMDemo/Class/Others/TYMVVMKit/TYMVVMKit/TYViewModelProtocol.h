//
//  TYViewModelProtocol.h
//  TYMVVMDemo
//
//  Created by 詹瞻 on 2017/3/8.
//  Copyright © 2017年 developZHAN. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 *  请求成功block
 */
typedef void (^successBlock)(id responseBoject);
/**
 *  请求失败block
 */
typedef void (^failureBlock)(NSError *error);
/**
 *  请求响应block
 */
typedef void (^responseBlock)(id dataObject, NSError *error);
/**
 *  监听进度响应block
 */
typedef void (^progressBlock)(NSProgress *progress);
/**
 *  将自己的信息返回给viewManger的block
 */
typedef void (^viewMangerInfosBlock)();
/**
 *  将自己的信息返回给viewModel的block
 */
typedef void (^viewModelInfosBlock)();


@protocol TYViewModelProtocol <NSObject>

@optional

- (void)ty_notice;

/**
 *  返回指定viewModel的所引用的控制器
 */
- (void)ty_viewModelWithViewController:(UIViewController *)viewController;

/**
 *  加载数据
 */
- (NSURLSessionTask *)ty_viewModelWithProgress:(progressBlock)progress
                                       success:(successBlock)success
                                       failure:(failureBlock)failure;

/**
 *  传递模型给view
 */
- (void)ty_viewModelWithModelBlock:(void (^)(id model))modelBlock;

/**
 *  处理viewMangerInfosBlock
 */
- (viewMangerInfosBlock)ty_viewModelWithViewMangerBlockOfInfos:(NSDictionary *)infos;

/**
 *  处理viewModelInfosBlock
 */
- (viewModelInfosBlock)ty_viewModelWithOtherViewModelBLockOfInfos:(NSDictionary *)infos;


/**
 *  将viewModel中的信息通过代理传递给viewManger
 *  @param viewModel    viewModel自己
 *  @param infos        描述信息
 */
- (void)ty_viewModel:(id)viewModel withInfos:(NSDictionary *)infos;

@end
