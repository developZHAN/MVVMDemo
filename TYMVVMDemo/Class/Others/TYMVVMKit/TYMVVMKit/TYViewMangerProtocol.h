//
//  TYViewMangerProtocol.h
//  TYMVVMDemo
//
//  Created by 詹瞻 on 2017/3/8.
//  Copyright © 2017年 developZHAN. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^viewEventsBlock)();

/**
 *  将自己的信息返回给viewModel的block
 */
typedef void (^viewModelInfosBlock)();

/**
 *  将自己的信息返回给viewManger的block
 */
typedef void (^viewMangerInfosBlock)();


@protocol TYViewMangerProtocol <NSObject>

@optional

- (void)ty_notice;

/**
 *  设置controller的子视图的管理者为self
 */
- (void)ty_viewMangerWithSuperView:(UIView *)superView;

/**
 *  设置subview的管理者为self
 *
 *  @param subview  被管理的subview
 */
- (void)ty_viewMangerWithSubview:(UIView *)subview;

/**
 *  设置添加subview的事件
 *
 *  @param subview  被管理的subview
 *  @param info     附带信息, 用于区分调用
 */
- (void)ty_viewMangerWithHandleOfSubview:(UIView *)subview info:(NSString *)info;

/**
 *  返回viewManger所管理的视图
 *
 *  @return viewManger所管理的视图
 */
- (__kindof UIView *)ty_viewMangerOfSubview;

/**
 *  得到其他viewManger所管理的subview, 自己用于内部
 *
 *  @param viewInfos 其他的subviews
 */
- (void)ty_viewMangerWithOtherSubviews:(NSDictionary *)viewInfos;

/**
 *  需要重新布局subview时, 更改subview的frame或者约束
 *
 *  @param updateBlock 更新布局完成的block
 */
- (void)ty_viewMangerWithLayoutSubviews:(void (^)())updateBlock;

/**
 *  使视图更新到最新的布局约束或者frame
 */
- (void)ty_viewMangerWithUpdateLayoutSubviews;

/**
 *  将model数据传递给viewManger
 */
- (void)ty_viewMangerWithModel:(NSDictionary *(^)())dictBlock;

/**
 *  处理viewBlock事件
 */
- (viewEventsBlock)ty_viewMangerWithViewEventBlockOfInfos:(NSDictionary *)infos;

/**
 *  处理viewModelInfosBlock
 */
- (viewModelInfosBlock)ty_viewMangerWithViewModelBlockOfInfos:(NSDictionary *)infos;

/**
 *  处理viewMangerInfosBlock
 */
- (viewMangerInfosBlock)ty_viewMangerWithOtherViewMangerBlockOfInfos:(NSDictionary *)infos;

/**
 *  将viewManger中的信息通过代理传递给viewModel
 *  
 *  @param viewManger   viewManger自己
 *  @param infos        描述信息
 */
- (void)ty_viewManger:(id)viewManger withInfos:(NSDictionary *)infos;


@end
