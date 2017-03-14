//
//  TYAction.h
//  TYMVVMDemo
//
//  Created by 詹瞻 on 2017/3/12.
//  Copyright © 2017年 developZHAN. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TYRequestProtocol.h"

/**
 *  请求成功block
 */
typedef void (^successBlock)(id responseObject);

/**
 *  请求失败block
 */
typedef void (^failureBlock)(NSError *error);

/**
 *  请求响应block
 */
typedef void (^reponseBlock)(id dataObj, NSError *error);

/**
 *  请求进度响应block
 */
typedef void (^progressBlock)(NSProgress *progress);



@class TYActionFileConfig;
@interface TYAction : NSObject

/**
 *  请求时间
 */
@property (nonatomic ,assign) NSTimeInterval timeoutInterval;

/**
 *  reachable
 */
@property (nonatomic ,assign, readonly, getter = isReachable) BOOL reachable;

/**
 *  reachableViaWAN
 */
@property (nonatomic ,assign, readonly, getter = isReachableViaWAN) BOOL rechableViaWAN;

/**
 *  reachableViaWiFi
 */
@property (nonatomic ,assign, readonly, getter = isReachableViaWiFi) BOOL reachableViaWiFi;


/**
 *  单例
 */
+ (instancetype)shareAction;

/**
 *  取消所有操作
 */
- (void)cancelAllOperations;

/**
 *  配置全局的scheme和host, 若request中重新设置新值, 则值为request中设置的新值
 *
 *  @param scheme scheme(eg: http, https, ftp)
 *  @param host   host
 */
- (void)configScheme:(NSString *)scheme host:(NSString *)host;

/**
 *  发送请求(在外部配置request)
 */
- (NSURLSessionTask *)sendRequest:(id)request
                         progress:(progressBlock)progress
                         succcess:(successBlock)success
                          failure:(failureBlock)failure;

/**
 *  发送请求block(在block内配置block)
 */
- (NSURLSessionTask *)sendRequestBlock:(id (^)(NSObject *request))requestBlock
                              progress:(progressBlock)progress
                               success:(successBlock)success
                               failure:(failureBlock)failure;

@end

/**
 *  用来封装上文件数据的模型类
 */
@interface TYRequestFileConfig : NSObject

/**
 *  文件数据
 */
@property (nonatomic, strong) NSData *fileData;

/**
 *  服务器接收参数名
 */
@property (nonatomic ,copy) NSString *name;

/**
 *  文件名
 */
@property (nonatomic ,copy) NSString *fileName;

/**
 *  文件类型
 */
@property (nonatomic ,copy) NSString *mimeType;

+ (instancetype)fileConfigWithFileData:(NSData *)fileData
                                  name:(NSString *)name
                              fileName:(NSString *)fileName
                              mimeType:(NSString *)mimeType;

- (instancetype)initWithFileData:(NSData *)fileData
                            name:(NSString *)name
                        fileName:(NSString *)fileName
                        mimeType:(NSString *)mimeType;
@end
