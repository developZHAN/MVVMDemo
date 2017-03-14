//
//  TYRequestProtocol.h
//  TYMVVMDemo
//
//  Created by 詹瞻 on 2017/3/9.
//  Copyright © 2017年 developZHAN. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TYRequestProtocol <NSObject>

@optional

/**
 *  配置request请求参数
 *
 *  @return NSDictionary 或者 自定义模型
 */
- (id)ty_requestParameters;

/**
 *  配置request的路径、请求参数等
 */
- (void)ty_requestConfigures;

@end
