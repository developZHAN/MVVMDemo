//
//  TYPartIViewManger.m
//  TYMVVMDemo
//
//  Created by 詹瞻 on 2017/3/8.
//  Copyright © 2017年 developZHAN. All rights reserved.
//

#import "TYPartIViewManger.h"

@interface TYPartIViewManger ()

@end

@implementation TYPartIViewManger

#pragma mark - UIView的delegate方法
- (void)ty_view:(__kindof UIView *)view withEvents:(NSDictionary *)events{
    
    NSLog(@"-------------%@", events);
    if ([[events allKeys] containsObject:@"jump"]) {
        NSLog(@"跳转控制器...");
    }
}

#pragma mark - viewEvents Block
- (viewEventsBlock)ty_viewMangerWithViewEventBlockOfInfos:(NSDictionary *)infos{
    return ^(NSString *info){
        if (self.viewMangerInfosBlock) {
            self.viewMangerInfosBlock();
        }
        
        if (self.viewMangerDelegate && [self.viewMangerDelegate respondsToSelector:@selector(ty_viewManger:withInfos:)]) {
            [self.viewMangerDelegate ty_viewManger:self withInfos:@{@"info":@"view被点击了"}];
        }
    };
}

#pragma mark - viewModel delegate
- (void)ty_viewModel:(id)viewModel withInfos:(NSDictionary *)infos{
    NSLog(@"%@",infos);
}

#pragma mark - 中介者传值
- (void)ty_notice{
    [self.ty_mediator noticeViewModelWithInfos:self.ty_viewMangerInfos];
}
@end
