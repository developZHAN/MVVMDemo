//
//  NSObject+TYRequest.m
//  TYMVVMDemo
//
//  Created by 詹瞻 on 2017/3/9.
//  Copyright © 2017年 developZHAN. All rights reserved.
//

#import "NSObject+TYRequest.h"
#import <objc/runtime.h>

@implementation NSObject (TYRequest)

- (NSString *)ty_scheme{
    return objc_getAssociatedObject(self, @selector(ty_scheme));
}
- (void)setTy_scheme:(NSString *)ty_scheme{
    objc_setAssociatedObject(self, @selector(ty_scheme), ty_scheme, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)ty_host{
    return objc_getAssociatedObject(self, @selector(ty_host));
}
- (void)setTy_host:(NSString *)ty_host{
    objc_setAssociatedObject(self, @selector(ty_host), ty_host, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)ty_path{
    return objc_getAssociatedObject(self, @selector(ty_path));
}
- (void)setTy_path:(NSString *)ty_path{
    objc_setAssociatedObject(self, @selector(ty_path), ty_path, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (TYRequestMethod)ty_method{
    return [objc_getAssociatedObject(self, @selector(ty_method)) integerValue];
}
- (void)setTy_method:(TYRequestMethod)ty_method{
    objc_setAssociatedObject(self, @selector(setTy_method:), @(ty_method), OBJC_ASSOCIATION_ASSIGN);
}

- (NSString *)ty_url{
    return objc_getAssociatedObject(self, @selector(ty_url));
}
- (void)setTy_url:(NSString *)ty_url{
    objc_setAssociatedObject(self, @selector(ty_url), ty_url, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (id)ty_params{
    return objc_getAssociatedObject(self, @selector(ty_params));
}
- (void)setTy_params:(id)ty_params{
    objc_setAssociatedObject(self, @selector(ty_params), ty_params, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (TYRequestFileConfig *)ty_fileConfig{
    return objc_getAssociatedObject(self, @selector(ty_fileConfig));
}
- (void)setTy_fileConfig:(TYRequestFileConfig *)ty_fileConfig{
    objc_setAssociatedObject(self, @selector(ty_fileConfig), ty_fileConfig, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
