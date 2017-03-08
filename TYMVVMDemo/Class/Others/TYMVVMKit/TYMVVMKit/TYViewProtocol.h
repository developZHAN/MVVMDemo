//
//  TYViewProtocol.h
//  TYMVVMDemo
//
//  Created by 詹瞻 on 2017/3/8.
//  Copyright © 2017年 developZHAN. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TYViewProtocol <NSObject>

@optional

/**
 *  将view中的事件通过代理传递出去
 *  
 *  @param view     view自己
 *  @param events   所触发事件的一些描述信息
 */
- (void)ty_view:(__kindof UIView *)view withEvents:(NSDictionary *)events;


@end
