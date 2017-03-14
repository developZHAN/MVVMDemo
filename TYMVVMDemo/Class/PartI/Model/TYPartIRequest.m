//
//  TYPartIRequest.m
//  TYMVVMDemo
//
//  Created by 詹瞻 on 2017/3/9.
//  Copyright © 2017年 developZHAN. All rights reserved.
//

#import "TYPartIRequest.h"

@implementation TYPartIRequest

- (void)ty_requestConfigures{
    
    self.ty_scheme  = @"https";
    self.ty_host    = @"api.douban.com";
    self.ty_path    = @"v2/book/search";
    self.ty_method  = TYRequestMethodGET;
    
}

- (id)ty_requestParameters{
    return @{@"q" : @"基础"};
}

@end
