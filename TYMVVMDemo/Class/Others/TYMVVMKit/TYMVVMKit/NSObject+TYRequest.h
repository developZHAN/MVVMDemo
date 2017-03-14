//
//  NSObject+TYRequest.h
//  TYMVVMDemo
//
//  Created by 詹瞻 on 2017/3/9.
//  Copyright © 2017年 developZHAN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TYRequestProtocol.h"

typedef enum : NSInteger{
    /** GET */
    TYRequestMethodGET,
    /** POST */
    TYRequestMethodPOST,
    /** UPLOAD */
    TYRequestMethodUPLOAD,
    /** DOWNLOAD */
    TYRequestMethodDOWNLOAD
    
}TYRequestMethod;

@class TYRequestFileConfig;
@interface NSObject (TYRequest)<TYRequestProtocol>

/**
 *  scheme (eg: http, https, ftp)
 */
@property (nonatomic ,copy, nonnull) NSString *ty_scheme;

/**
 *  host
 */
@property (nonatomic ,copy, nonnull) NSString *ty_host;

/**
 *  path
 */
@property (nonatomic ,copy, nonnull) NSString *ty_path;

/**
 *  method
 */
@property (nonatomic ,assign) TYRequestMethod ty_method;

/**
 *  url (如果设置了url, 则不需要再设置scheme, host, path属性)
 */
@property (nonatomic ,copy, nonnull) NSString *ty_url;

/**
 *  parameters
 */
@property (nonatomic, retain, nonnull) id ty_params;

/**
 *  fileConfig
 */
@property (nonatomic, retain, nonnull) TYRequestFileConfig *ty_fileConfig;

@end
