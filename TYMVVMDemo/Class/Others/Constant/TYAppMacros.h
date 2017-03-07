//
//  TYAppMacros.h
//
//  Created by 詹瞻
//
//  For Fast APP
//
//  此类定义所有的宏

#ifndef TYAppMacros_h
#define TYAppMacros_h

//use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

/** *  ----------------------- 系统全局变量------------------------ */
#define TYMainScreen [UIScreen mainScreen]
#define TYKeyWindow [UIApplication sharedApplication].keyWindow

/** *  ----------------------- 屏幕宽高定义------------------------ */
#define TYHeightNavigationBar 64
#define TYHeightTabBar 45
#define TYSectionBarH 39

#define TYWidthDevice TYMainScreen.bounds.size.width
#define TYHeightDevice TYMainScreen.bounds.size.height
#define TYWidthFullView self.frame.size.width
#define TYHeightFullView self.frame.size.height
#define TYRectFullVC CGRectMake(0, 0, TYWidthDevice, TYHeightDevice - TYHeightNavigationBar)

//满屏CGRect
#define TYRectFullScreen TYMainScreen.bounds

//自动布局Size
#define TYAutoSizeMake(a, b) CGSizeMake((a/375.0)*TYWidthDevice,(b/667.0)*TYHeightDevice)

#define TYSizeWithWidth(a) TYAutoSizeMake(a, 0)
#define TYSizeWithHeight(a) TYAutoSizeMake(0, a)

/** *  ------------------------- 颜色定义 ------------------------- */
#define TYColorSingle(a) TYColor(a,a,a)
#define TYColorSingalp(a,b) TYColorWithAlpha(a,a,a,b)
#define TYColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define TYColorWithAlpha(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define TYColorWithRandomAlpha(a) [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:a]
#define TYColorWithRandomListAlpha(a) [UIColor randomColorInListWithAlpha:a]

#define TYColorWithHex(s)  [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s &0xFF00) >>8))/255.0 blue:((s &0xFF))/255.0 alpha:1.0]

//通用视觉规范
#define TYColorBlackFont        TYColorSingle(0)                                  //黑色 字体颜色
#define TYColorGrayFontDark     TYColorSingle(76)                                 //深灰 字体颜色
#define TYColorGrayFontLight    TYColorSingle(153)                                //浅灰 字体颜色
#define TYColorWhiteFont        TYColorSingle(255)                                //白色 字体颜色
#define TYColorBlueFont         TYColor(0, 92, 179)                               //蓝色 字体颜色

#define TYColorGrayBg           TYColorSingle(250)                                //灰色 背景颜色
#define TYColorWhiteBg          TYColorSingle(255)                                //白色 背景颜色


#define TYColorTranslucent      TYColorSingalp(0, 0.55)                           //半透明颜色
#define TYColorClear            [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0]                            //无色

#define TYColorWhite            TYColor(255, 255, 255)                            //纯白
#define TYColorRed              TYColor(255, 0, 0)                                //红色
#define TYColorOrange           TYColor(253, 106, 60)                             //橙色
#define TYColorYellow           TYColor(239, 166, 68)                             //黄色
#define TYColorGreen            TYColor(0, 255, 0)                                //绿色
#define TYColorBlue             TYColor(0, 153, 255)                              //蓝色
#define TYColorBlack            TYColor(0, 0, 0)                                  //黑色
#define TYColorGray             TYColor(153, 153, 153)                            //灰色
#define TYColorlightGray        TYColor(197, 197, 202)                            //浅灰色
#define TYColorCoffee           TYColor(185,152,99)                               //咖啡色

#define TYColorLine             TYColorSingle(204)                                //线 灰色

#define TYColorNavBg              TYColor(91, 179, 249)
#define TYColorTabNavBg              TYColor(37, 46, 75)                                 //tabBar 和 navigationBar 颜色
#define TYColorTabNavBgLight         TYColorGrayBg                                       //tabBar 和 navigationBar 颜色 (白色主题)

#define TYColorDeleteView   TYColor(230, 66, 64)
#define TYColorDeleteView_H TYColor(238, 123, 122)

#define TYColorRedPoint TYColor(255, 59, 48)

#define TYColorAutoTabNavBg [TYUserInfoCurrent.background intValue] ? TYColorTabNavBgLight : TYColorTabNavBg //自动选择
#define TYColorAutoTabBtnH  [TYUserInfoCurrent.background intValue] ? TYColorWithAlpha(230, 230, 230, 1) : TYColorWithAlpha(26, 33, 53, 1)
#define TYColorAutoTitle [TYUserInfoCurrent.background intValue] ? TYColorWithAlpha(38, 38, 38, 1) : TYColorWhiteFont

#define TYAutoChooseThemeImage(str) [TYUserInfoCurrent.background intValue] ? [@"dark_" stringByAppendingString:str] : str

/** *  ------------------------- 字体定义 ------------------------- */
#define TYFontSize(s) [UIFont systemFontOfSize:s]
//#define TYFontName @"STXihei"
#define TYBlodFont(s) [UIFont boldSystemFontOfSize:s]
#define TYTextFont [UIFont fontWithName:TYFontName size:16]
#define TYFontWithSize(a) [UIFont systemFontOfSize:a]


/** *  ------------------------- 状态码定义 ------------------------- */
#define TYStatusSussess             @"200"	// 操作成功
#define TYStatusBan                 @"301"	// 用户被禁用
#define TYStatusPwdError            @"302"	// 用户名密码错误
#define TYStatusNameExisted         @"333"	// 用户名已被注册
#define TYStatusIPBan               @"315"	// IP/设备禁用
#define TYStatusUsrLMT              @"403"	// 权限不够
#define TYStatusNullObj             @"404"	// 找不到对象
#define TYStatusUnConnect           @"415"	// 客户端网络问题
#define TYStatusDataBaseError       @"501"	// 服务器操作数据库出错
#define TYStatusFilemultiplyError   @"502"	// 文件上传出错
#define TYStatusUserNeedSetUpInfo   @"274"  // 用户需要初始化个人资料

/** *  ------------------------- 路径定义 ------------------------- */

#define TYDocumentsDirectory [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) firstObject]
#define TYCacheDirectory     [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]
#define TYLibraryDirectory   [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject]

#endif /* TYAppMacros_h */
