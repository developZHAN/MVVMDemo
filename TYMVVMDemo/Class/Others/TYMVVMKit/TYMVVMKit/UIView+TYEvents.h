//
//  UIView+TYEvents.h
//  TYMVVMDemo
//
//  Created by 詹瞻 on 2017/3/8.
//  Copyright © 2017年 developZHAN. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ViewEventsBlock)();

@interface UIView (TYEvents)

/**
 *  viewDelegate 传递事件
 */
@property (nullable, nonatomic, weak) id<TYViewProtocol> viewDelegate;

/**
 *  block 传递事件
 */
@property (nonatomic, copy) ViewEventsBlock viewEventsBlock;

/**
 *  将view中的事件交由viewManger处理
 */
- (void)ty_viewWithViewManger:(id<TYViewProtocol>)viewManger;

@end

NS_ASSUME_NONNULL_END
