//
//  TYPartIViewModel.m
//  TYMVVMDemo
//
//  Created by 詹瞻 on 2017/3/9.
//  Copyright © 2017年 developZHAN. All rights reserved.
//

#import "TYPartIViewModel.h"
#import "TYPartIModel.h"
#import "TYPartIRequest.h"
#import "TYAction.h"

@interface TYPartIViewModel ()

@end

@implementation TYPartIViewModel

#pragma mark - 加载网络请求
- (NSURLSessionTask *)ty_viewModelWithProgress:(progressBlock)progress success:(successBlock)success failure:(failureBlock)failure {
    
    return [[TYAction shareAction] sendRequestBlock:^id(NSObject *request) {
        return [[TYPartIModel alloc] init];
    } progress:nil success:^(id responseObject) {
        NSArray *modelArray = [TYPartIModel mj_objectArrayWithKeyValuesArray:responseObject[@"books"]];
        if (success) {
            success(modelArray);
        }
    } failure:nil];
    
}

- (id)getRandomData:(NSArray *)array
{
    u_int32_t index = arc4random_uniform((u_int32_t)10);
    return array[index];
}

#pragma mark - 配置加工模型数据, 并通过block传递给view
- (void)ty_viewModelWithModelBlock:(void (^)(id))modelBlock{
    [self ty_viewModelWithProgress:nil
                           success:^(id responseBoject) {
                               
                               if (modelBlock) {
                                   if (self.viewModelDelegate && [self.viewModelDelegate respondsToSelector:@selector(ty_viewModel:withInfos:)]) {
                                       [self.viewModelDelegate ty_viewModel:self withInfos:@{@"info":@"呵呵, 你好, 我是viewModel, 我加载数据成功了"}];
                                   }
                                   
                                   modelBlock([self getRandomData:responseBoject]);
                               }
                               
                           }failure:nil];
}

#pragma mark - viewManger delegate
- (void)ty_viewManger:(id)viewManger withInfos:(NSDictionary *)infos{
    NSLog(@"%@",infos);
}

#pragma mark - viewManger block
- (viewMangerInfosBlock)ty_viewModelWithViewMangerBlockOfInfos:(NSDictionary *)infos{
    return ^{
        NSLog(@"hello");
    };
}

#pragma mark - 中介者传值
- (void)ty_notice{
    [self.ty_mediator noticeViewMangerWithInfos:self.ty_viewMangerInfos];
}
@end
