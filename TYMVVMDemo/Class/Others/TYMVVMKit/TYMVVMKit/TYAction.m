//
//  TYAction.m
//  TYMVVMDemo
//
//  Created by 詹瞻 on 2017/3/12.
//  Copyright © 2017年 developZHAN. All rights reserved.
//

#import "TYAction.h"
#import "AFNetworking.h"
#import "NSObject+TYRequest.h"

static NSString *const TYRequestUrlPath     = @"TYRequestUrlPath";
static NSString *const TYRequestParameters  = @"TYRequestParameters";

@interface TYAction ()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManger;

/**
 *  scheme
 */
@property (nonatomic ,copy) NSString *shceme;
/**
 *  host
 */
@property (nonatomic ,copy) NSString *host;

@end

@implementation TYAction

static id _instance;

+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    
    return _instance;
}

+ (instancetype)shareAction
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    
    return _instance;
}

- (AFHTTPSessionManager *)sessionManger{
    if (!_sessionManger) {
        _sessionManger = [AFHTTPSessionManager manager];
        _sessionManger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain" , nil];
        _sessionManger.requestSerializer.timeoutInterval = (!self.timeoutInterval ?: self.timeoutInterval);
    }
    return _sessionManger;
}

- (void)configScheme:(NSString *)scheme host:(NSString *)host{
    self.shceme = scheme;
    self.host   = host;
}

- (NSURLSessionTask *)sendRequest:(id)request progress:(progressBlock)progress succcess:(successBlock)success failure:(failureBlock)failure{
    if ([request respondsToSelector:@selector(ty_requestConfigures)]) {
        [request ty_requestConfigures];
    }
    
    NSObject *requestObject = (NSObject *)request;
    NSURLSessionTask *sessionDataTask = nil;
    
    switch (requestObject.ty_method) {
        
        case TYRequestMethodGET:
            sessionDataTask = [self get:request progress:progress success:success failure:failure];
            break;
        
        case TYRequestMethodPOST:
            sessionDataTask = [self post:request progress:progress success:success failure:failure];
            break;
            
        case TYRequestMethodUPLOAD:
            sessionDataTask = [self upload:request progress:progress success:success failure:failure];
            break;
            
        case TYRequestMethodDOWNLOAD:
            sessionDataTask = [self download:request progress:progress success:success failure:failure];
            break;
            
        default:
            break;
    }
    
    return sessionDataTask;
}

- (NSURLSessionTask *)sendRequestBlock:(id (^)(NSObject *))requestBlock
                              progress:(progressBlock)progress
                               success:(successBlock)success
                               failure:(failureBlock)failure
{
    if (requestBlock) {
        NSObject *requestObj = [[NSObject alloc] init];
        return [self sendRequest:requestBlock(requestObj) progress:progress succcess:success failure:failure];
        
    }else{
        return nil;
    }
}

- (NSURLSessionDataTask *)get:(id)request
                     progress:(progressBlock)progress
                      success:(successBlock)success
                      failure:(failureBlock)failure
{
    NSDictionary *requestDictionary = [self requestObject:request];
    NSString *urlPath = requestDictionary[TYRequestUrlPath];
    NSDictionary *parameters = requestDictionary[TYRequestParameters];
    
    return [self.sessionManger GET:urlPath
                        parameters:parameters
                          progress:^(NSProgress * _Nonnull downloadProgress) {
                              
                              if (progress) {
                                  if (downloadProgress) {
                                      progress(downloadProgress);
                                  }
                              }
                              
                          }success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                              
                              if (success) {
                                  if (responseObject) {
                                      success(responseObject);
                                  }
                              }
                              
                          }failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                              
                              if (failure) {
                                  if (error) {
                                      failure(error);
                                  }
                              }
                              
                          }];
}

- (NSURLSessionDataTask *)post:(id)request
                      progress:(progressBlock)progress
                       success:(successBlock)success
                       failure:(failureBlock)failure
{
    NSDictionary *requestDictionary = [self requestObject:request];
    NSString *urlPath = requestDictionary[TYRequestUrlPath];
    NSDictionary *parameters = requestDictionary[TYRequestParameters];
    
    return [self.sessionManger POST:urlPath
                         parameters:parameters
                           progress:^(NSProgress * _Nonnull uploadProgress) {
                               
                               if (progress) {
                                   if (uploadProgress) {
                                       progress(uploadProgress);
                                   }
                               }
    
                           }success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                               
                               if (success) {
                                   if (responseObject) {
                                       success(responseObject);
                                   }
                               }
    
                           }failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                               if (failure) {
                                   if (error) {
                                       failure(error);
                                   }
                               }
                           }];
}

- (NSURLSessionDownloadTask *)download:(id)request
                              progress:(progressBlock)progress
                               success:(successBlock)success
                               failure:(failureBlock)failure
{
    NSDictionary *requestDictionary = [self requestObject:request];
    NSString *urlPath = requestDictionary[TYRequestUrlPath];
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:sessionConfiguration];
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:urlPath]];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:req
                                                                     progress:^(NSProgress * _Nonnull downloadProgress) {
                                                                         
                                                                         if (progress) {
                                                                             if (downloadProgress) {
                                                                                 progress(downloadProgress);
                                                                             }
                                                                         }
    
                                                                     }destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
                                                                         
                                                                         NSURL *documentUrl = [[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory
                                                                                                                                     inDomain:NSUserDomainMask
                                                                                                                            appropriateForURL:nil
                                                                                                                                       create:NO
                                                                                                                                        error:nil];
                                                                         return [documentUrl URLByAppendingPathComponent:[response suggestedFilename]];
    
                                                                     }completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
                                                                         
                                                                         if (failure) {
                                                                             if (error) {
                                                                                 failure(error);
                                                                             }
                                                                         }
                                                                         
                                                                         if (success) {
                                                                             if (response) {
                                                                                 success(response);
                                                                             }
                                                                         }
    
                                                                     }];
    [downloadTask resume];
    return downloadTask;
}

- (NSURLSessionDataTask *)upload:(id)request
                        progress:(progressBlock)progress
                         success:(successBlock)success
                         failure:(failureBlock)failure
{
    NSDictionary *requestDictionary = [self requestObject:request];
    NSString *urlPath = requestDictionary[TYRequestUrlPath];
    NSDictionary *parameters = requestDictionary[TYRequestParameters];
    
    NSObject *requestObject = (NSObject *)request;
    
    return [self.sessionManger POST:urlPath
                         parameters:parameters
          constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
              
              [formData appendPartWithFileData:requestObject.ty_fileConfig.fileData
                                          name:requestObject.ty_fileConfig.name
                                      fileName:requestObject.ty_fileConfig.fileName
                                      mimeType:requestObject.ty_fileConfig.mimeType];
              
    
          }progress:^(NSProgress * _Nonnull uploadProgress) {
        
              if (progress) {
                  if (uploadProgress) {
                      progress(uploadProgress);
                  }
              }
    
          }success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
              if (success) {
                  if (responseObject) {
                      success(responseObject);
                  }
              }
    
          }failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
              if (failure) {
                  if (error) {
                      failure(error);
                  }
              }
              
          }];
}

- (NSDictionary *)requestObject:(id)request{
    NSObject *requestObject = (NSObject *)request;
    
    //urlPath
    NSString *urlPath = nil;
    if (requestObject.ty_url.length) {
        urlPath = requestObject.ty_url;
    }else{
        NSString *scheme = nil;
        NSString *host   = nil;
        
        scheme  = (self.shceme.length > 0) ? self.shceme : requestObject.ty_scheme;
        host    = (self.host.length > 0) ? self.host : requestObject.ty_host;
        urlPath = [NSString stringWithFormat:@"%@://%@%@", scheme, host, requestObject.ty_path];
    }
    
    // parameters
    id parameters = nil;
    if ([request respondsToSelector:@selector(ty_requestParameters)]) {
        parameters = [request ty_requestParameters];
    }else if ([request respondsToSelector:@selector(setTy_params:)]){
        parameters = requestObject.ty_params;
    }
    
    return @{
             TYRequestUrlPath       : urlPath,
             TYRequestParameters    : parameters ?: @""
             
             };
}

- (void)cancelAllOperations{
    [self.sessionManger.operationQueue cancelAllOperations];
}

- (BOOL)isReachable{
    return [AFNetworkReachabilityManager sharedManager].isReachable;
}

- (BOOL)isRechableViaWAN{
    return [AFNetworkReachabilityManager sharedManager].isReachableViaWWAN;
}

- (BOOL)isReachableViaWiFi{
    return [AFNetworkReachabilityManager sharedManager].isReachableViaWiFi;
}
@end
