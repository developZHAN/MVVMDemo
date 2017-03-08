//
//  NSString+TYString.h
//
//  Created by 詹瞻
//
//  For Fast APP
//

#import <Foundation/Foundation.h>

@interface NSString (TYString)

///**
// *  获取当前时间
// */
//+ (NSString *)currentTimeString;
//
///**
// *  时间戳转换为时间
// */
//+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString;
//
///**
// *  通过文本计算尺寸
// */
//- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;
//
//
///**
// *  获取七牛上传接口验证码
// */
//+ (NSString *)getAuthCode;
//
///**
// *  判断id 对应的联系人是否我的 好友 或者 群聊
// */
//- (BOOL)isConnectWithMe;

/**
 *  判断字符串是否为空
 */
- (BOOL)isNull;

/**
 *  判断是否手机号码
 */
- (BOOL)isPhoneNumber;

/**
 *  解析服务器返回的状态码
 */
//- (NSString *)AnalysisStateCode;
@end
