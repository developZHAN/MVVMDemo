//
//  NSObject+TYProperties.m
//  TYMVVMDemo
//
//  Created by 詹瞻 on 2017/3/9.
//  Copyright © 2017年 developZHAN. All rights reserved.
//

#import "NSObject+TYProperties.h"
#import <objc/runtime.h>

@implementation NSObject (TYProperties)

- (id<TYViewModelProtocol>)viewModelDelegate{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setViewModelDelegate:(id<TYViewModelProtocol>)viewModelDelegate{
    objc_setAssociatedObject(self, @selector(viewModelDelegate), viewModelDelegate, OBJC_ASSOCIATION_ASSIGN);
}

- (id<TYViewMangerProtocol>)viewMangerDelegate{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setViewMangerDelegate:(id<TYViewMangerProtocol>)viewMangerDelegate{
    objc_setAssociatedObject(self, @selector(viewMangerDelegate), viewMangerDelegate, OBJC_ASSOCIATION_ASSIGN);
}

- (viewMangerInfosBlock)viewMangerInfosBlock{
    return objc_getAssociatedObject(self, @selector(viewMangerInfosBlock));
}

- (void)setViewMangerInfosBlock:(viewMangerInfosBlock)viewMangerInfosBlock{
    objc_setAssociatedObject(self, @selector(viewMangerInfosBlock), viewMangerInfosBlock, OBJC_ASSOCIATION_COPY);
}

- (viewMangerInfosBlock)viewModelInfosBlock{
    return objc_getAssociatedObject(self, @selector(viewModelInfosBlock));
}

- (void)setViewModelInfosBlock:(viewMangerInfosBlock)viewModelInfosBlock{
    objc_setAssociatedObject(self, @selector(viewModelInfosBlock), viewModelInfosBlock, OBJC_ASSOCIATION_COPY);
}

- (viewModelBlock)viewModelBlock{
    return objc_getAssociatedObject(self, @selector(viewModelBlock));
}

- (void)setViewModelBlock:(viewModelBlock)viewModelBlock{
    objc_setAssociatedObject(self, @selector(viewModelBlock), viewModelBlock, OBJC_ASSOCIATION_COPY);
}

/**
 *  ty_mediator
 */
- (void)setTy_mediator:(TYMediator *)ty_mediator{
    objc_setAssociatedObject(self, @selector(ty_mediator), ty_mediator, OBJC_ASSOCIATION_RETAIN);
}

- (TYMediator *)ty_mediator{
    return objc_getAssociatedObject(self, @selector(ty_mediator));
}

/**
 *  ty_viewMangerInfos
 */
- (void)setTy_viewMangerInfos:(NSDictionary *)ty_viewMangerInfos{
    objc_setAssociatedObject(self, @selector(ty_viewMangerInfos), ty_viewMangerInfos, OBJC_ASSOCIATION_COPY);
}

- (NSDictionary *)ty_viewMangerInfos{
    return objc_getAssociatedObject(self, @selector(ty_viewMangerInfos));
}

/**
 *  ty_viewModelInfos
 */
- (void)setTy_viewModelInfos:(NSDictionary *)ty_viewModelInfos{
    objc_setAssociatedObject(self, @selector(ty_viewModelInfos), ty_viewModelInfos, OBJC_ASSOCIATION_COPY);
}

- (NSDictionary *)ty_viewModelInfos{
    return objc_getAssociatedObject(self, @selector(ty_viewModelInfos));
}

- (NSDictionary *)ty_allProperties{
    unsigned int count = 0;
    
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    NSMutableDictionary *resultDict = [@{} mutableCopy];
    
    for(NSUInteger i = 0; i < count; i++) {
        const char *propertyName = property_getName(properties[i]);
        NSString *name = [NSString stringWithUTF8String:propertyName];
        id propertyValue = [self valueForKey:name];
        
        if (propertyName) {
            resultDict[name] = propertyValue;
        }else{
            resultDict[name] = @"字典的key对应的value不能为nil";
        }
    }
    
    free(properties);
    
    return resultDict;
}

@end
