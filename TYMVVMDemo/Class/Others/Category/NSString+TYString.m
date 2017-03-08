//
//  NSString+TYString.m
//
//  Created by 詹瞻
//
//  For Fast APP
//

#import "NSString+TYString.h"

@implementation NSString (TYString)

- (BOOL)isNull
{
    if (![self isKindOfClass:[NSString class]]) {
        return YES;
    }
    
    if (!self || [self isKindOfClass:[NSNull class]] || self.length == 0 || [self isEqualToString:@""]) {
        return YES;
    }else{
        return NO;
    }
}

- (BOOL)isPhoneNumber
{
    NSString *MOBILE = @"^1[34578]\\d{9}$";
    NSPredicate *regexTestMobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",MOBILE];
    if ([regexTestMobile evaluateWithObject:self]) {
        return YES;
    }else {
        return NO;
    }
}


//+(NSString *)currentTimeString
//{
//    NSDate *date = [NSDate date];
//    //这个是NSDate类型的日期，所要获取的年月日都放在这里；
//    NSCalendar *cal = [NSCalendar currentCalendar];
//    //这句是说你要获取日期的元素有哪些。获取年就要写NSYearCalendarUnit，获取小时就要写NSHourCalendarUnit，中间用|隔开；
//    unsigned int unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
//
//    NSDateComponents *dateComponents = [cal components:unitFlags fromDate:date];//把要从date中获取的unitFlags标示的日期元素存放在NSDateComponents类型的d里面； //然后就可以从d中获取具体的年月日了；
//    NSInteger year = [dateComponents year];
//    NSInteger month = [dateComponents month];
//    NSInteger day = [dateComponents day];
//    NSInteger hour = [dateComponents hour];
//    NSInteger min = [dateComponents minute];
//    NSInteger sec = [dateComponents second];
//    
//    return [NSString stringWithFormat:@"%ld_%ld_%ld_%ld_%ld_%ld",year,month,day,hour,min,sec];
//}
//
//+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString
//{
//    // 格式化时间
//    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
//    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
//    [formatter setDateStyle:NSDateFormatterMediumStyle];
//    [formatter setTimeStyle:NSDateFormatterShortStyle];
//    [formatter setDateFormat:@"MM月dd日 HH:mm"];
//    
//    // 毫秒值转化为秒
//    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]/ 1000.0];
//    NSString* dateString = [formatter stringFromDate:date];
//    return dateString;
//}
//
//- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
//{
//    //textView
//    UILabel *label = [[UILabel alloc] init];
//    label.numberOfLines = 0;
//    
//    label.font = font;
//    label.text = self;
//    label.lineBreakMode = NSLineBreakByTruncatingTail;
//
//    
//    
//    return [label sizeThatFits:maxSize];
//}
//
//+ (NSString *)getAuthCode
//{
//    //获取时间戳
//    long timeInterval = [[NSDate dateWithTimeIntervalSinceNow:0] timeIntervalSince1970] * 1000;
//    
//    NSString *timeStr = [NSString stringWithFormat:@"%ld",timeInterval];
//    
//    NSString *str = @"";
//    
//    while (timeInterval > 0) {
//        str = [str stringByAppendingString:[NSString stringWithFormat:@"%ld",timeInterval%7]];
//        timeInterval /= 7;
//    }
//    
//    NSString *authStr = [[[timeStr stringByAppendingString:[str substringWithRange:NSMakeRange(0, 2)]] stringByAppendingString:[NSString stringWithFormat:@"%u",arc4random()]] stringByAppendingString:[str substringWithRange:NSMakeRange(2, 4)]];
//    
//    return authStr;
//    
//}
//
//- (BOOL)isConnectWithMe
//{
//    //判断id是群聊还是用户
//    if (self.length == TYAccountCurrent.userId.length) {
//        //用户
//        NSMutableArray *contactList = [TYContactTool contactList];
//        for (TYContact *contact in contactList) {
//            if ([self isEqualToString:contact.userId]) {
//                return YES;
//            }
//        }
//
//    }else if (self.length == TYUserInfoCurrent.uUsername.length){
//        NSMutableArray *contactList = [TYContactTool contactList];
//        //如果发来的是 userName
//        for (TYContact *contact in contactList) {
//            if ([self isEqualToString:contact.username]) {
//                return YES;
//            }
//        }
//
//    }else{
//        //群聊
//        NSMutableArray *groupContactList = [TYContactTool groupContactList];
//        for (TYGroupContact *groupContact in groupContactList) {
//            if ([self isEqualToString:groupContact.teamId]) {
//                return YES;
//            }
//        }
//    }
//    return NO;
//}

@end
