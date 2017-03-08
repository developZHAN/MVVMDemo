//
//  UIView+TYEvents.m
//  TYMVVMDemo
//
//  Created by 詹瞻 on 2017/3/8.
//  Copyright © 2017年 developZHAN. All rights reserved.
//

#import "UIView+TYEvents.h"
#import <objc/runtime.h>

@implementation UIView (TYEvents)

/**
 *  使用runtime关联函数, 将viewDelegate viewEventsBlock关联给分类
 */
- (id<TYViewProtocol>)viewDelegate{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setViewDelegate:(id<TYViewProtocol>)viewDelegate{
    objc_setAssociatedObject(self, @selector(viewDelegate), viewDelegate, OBJC_ASSOCIATION_ASSIGN);
}

- (ViewEventsBlock)viewEventsBlock{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setViewEventsBlock:(ViewEventsBlock)viewEventsBlock{
    objc_setAssociatedObject(self, @selector(viewEventsBlock), viewEventsBlock, OBJC_ASSOCIATION_COPY);
}

- (void)ty_viewWithViewManger:(id<TYViewProtocol>)viewManger{
    if (viewManger) {
        self.viewDelegate = viewManger;
    }
}

@end
