//
//  TYUICreator.h
//
//  Created by 詹瞻
//
//  For Fast APP
//

#import <Foundation/Foundation.h>

#define TYRectFromSize(size) CGRectMake(0,0,size.width,size.height)

//用于按钮中，文字和图片相对方向
typedef NS_ENUM(NSInteger, BtnImgDirectionType)
{
    BtnImgDirectionDefault,     //默认:图片居左, 文字居右.整体左右结构.
    BtnImgDirectionRight,       //文字居左, 图片居右.整体左右结构.
    BtnImgDirectionTop,         //图片居上, 文字居下.整体上下结构.
    BtnImgDirectionBottom,      //文字居上, 图片居下.整体上下结构.
};

@class TYInPutView;
@interface TYUICreator : NSObject

//For Line
//绘制线
+ (UIView *)createLineWithSize:(CGSize)size
                       bgColor:(UIColor *)color;

/**
 *  create UIView
 *
 *  @param size         size of view
 *  @param bgColor      bgColor of view
 *  @param cornerRadius cornerRadius of view
 *
 *  @return UIView
 */
+ (UIView *)createViewWithSize:(CGSize)size
                       bgColor:(UIColor *)bgColor
                        radius:(float)cornerRadius;

+ (UIView *)createViewWithSize:(CGSize)size
                       bgColor:(UIColor *)bgColor
                        radius:(float)cornerRadius
                       gesture:(UIGestureRecognizer *)gesture;


//For UILabel
+ (UILabel *)createLabelWithSize:(CGSize)size
                            text:(NSString *)text
                     sysFontSize:(int)fontSize;

+ (UILabel *)createLabelWithSize:(CGSize)size
                            text:(NSString *)text
                           color:(UIColor *)color
                            font:(UIFont *)font;

+ (UILabel *)createLabelWithSize:(CGSize)size
                           aText:(NSMutableDictionary *)aText
                         bgColor:(UIColor *)bgColor;

//+ (UILabel *)createLabelWithFont:(UIFont *)font
//                           aText:(NSMutableDictionary *)aText;

+ (UIView *)createTitleViewWithSize:(CGSize)size
                                text:(NSString *)text
                         sysFontSize:(int)fontSize;

+ (UIView *)createTitleViewWithSize:(CGSize)size
                               text:(NSString *)text
                          textColor:(UIColor *)color
                        sysFontSize:(int)fontSize;

//For UIButton
+ (UIButton *)createButtonWithTitle:(NSString *)title
                               size:(CGSize)size
                         titleColor:(UIColor *)titleColor
                               font:(UIFont *)font
                             target:(id)target
                             action:(SEL)action;

+ (UIButton *)createButtonWithTitle:(NSString *)title
                               size:(CGSize)size
                         titleColor:(UIColor *)titleColor
                               font:(UIFont *)font
                         buttonType:(UIButtonType)buttonType
                            bgColor:(UIColor *)bgColor
                             corner:(float)cornerRadius
                             target:(id)target
                             action:(SEL)action;

+ (UIButton *)createButtonWithTitle:(NSString *)title
                               size:(CGSize)size
                              image:(NSString *)imageName
                          titleEdge:(UIEdgeInsets)titleEdge
                          imageEdge:(UIEdgeInsets)imageEdge
                             target:(id)target
                             action:(SEL)action;

+ (UIButton *)createButtonWithTitle:(NSString *)title
                               size:(CGSize)size
                              image:(NSString *)imageName
                         titleColor:(UIColor *)titleColor
                               font:(UIFont *)font
                      directionType:(BtnImgDirectionType)type
         contentHorizontalAlignment:(UIControlContentHorizontalAlignment)hAlign
           contentVerticalAlignment:(UIControlContentVerticalAlignment)vAlign
                  contentEdgeInsets:(UIEdgeInsets)contentEdge
                               span:(CGFloat)span
                             target:(id)target
                             action:(SEL)action;

+ (UIButton *)createButtonWithNormalImage:(NSString *)normalImageName
                         highlightedImage:(NSString *)highlightedImageName
                                   target:(id)target
                                   action:(SEL)action;

+ (UIButton *)createButtonWithSize:(CGSize)size
                              NormalImage:(NSString *)normalImageName
                         highlightedImage:(NSString *)highlightedImageName
                                   target:(id)target
                                   action:(SEL)action;

+ (UIButton *)createButtonWithSize:(CGSize)size
                       NormalImage:(NSString *)normalImageName
                     selectedImage:(NSString *)selectedImageName
                            target:(id)target
                            action:(SEL)action;


//For UIImageView
+ (UIImageView *)createImageViewWithSize:(CGSize)size;
+ (UIImageView *)createImageViewWithName:(NSString *)imageName;
+ (UIImageView *)createImageViewWithName:(NSString *)imageName size:(CGSize)size;
+ (UIImageView *)createImageViewWithName:(NSString *)imageName size:(CGSize)size radius:(float)cornerRadius;


//For UITextFiled
+ (UITextField *)createTextFieldWithSize:(CGSize)size
                             placeholder:(NSString *)placeholder
                                delegate:(id<UITextFieldDelegate>)delegate;

+ (UITextField *)createTextFieldWithSize:(CGSize)size
                                    Font:(UIFont *)font
                               textColor:(UIColor *)textColor
                         backgroundColor:(UIColor *)backgroundColor
                             borderStyle:(UITextBorderStyle)borderStyle
                             placeholder:(NSString *)placeholder
                            keyboardType:(UIKeyboardType)keyboardType
                           returnKeyType:(UIReturnKeyType)returnKeyType
                                delegate:(id<UITextFieldDelegate>)delegate;


//For UITextView
+ (UITextView *)createTextViewWithSize:(CGSize)size
                               aString:(NSAttributedString *)atrributeString
                            editEnable:(BOOL)eEnable
                          scroolEnable:(BOOL)sEnable;


//For UITableView
+ (UITableView *)createTableViewWithSize:(CGSize)size
                                   style:(UITableViewStyle)style
                               rowHeight:(float)height
                                delegate:(id<UITableViewDelegate, UITableViewDataSource>)delegate;

+ (UITableView *)createTableViewWithSize:(CGSize)size
                                   style:(UITableViewStyle)style
                              headerView:(UIView *)headerView
                              footerView:(UIView *)footerView
                            scrollEnable:(BOOL)sEnable
                           bouncesEnable:(BOOL)bEnable
                              zeroMargin:(BOOL)zeroMargin
                      seporatorLineColor:(UIColor *)seporatorLineColor
                                delegate:(id<UITableViewDelegate, UITableViewDataSource>)delegate;


////For UIWebView
//+ (UIWebView *)createWebViewWithSize:(CGSize)size
//                              webUrl:(NSString *)url
//                             baseURL:(NSURL *)baseUrl
//                          htmlString:(NSString *)htmlString
//                            delegate:(id<UIWebViewDelegate>)delegate;
//

//UIBarButtonItem
+ (UIBarButtonItem *)createBarBtnItemWithSize:(CGSize)size
                                        Image:(NSString *)image
                                    highImage:(NSString *)highImage
                                       target:(id)target
                                       action:(SEL)action
                             forControlEvents:(UIControlEvents)controlEvents;

+ (UIBarButtonItem *)createBarBtnItemWithSize:(CGSize)size
                                         text:(NSString *)text
                                         font:(UIFont *)font
                                        color:(UIColor *)color
                                       target:(id)target
                                       action:(SEL)action
                             forControlEvents:(UIControlEvents)controlEvents;

//#pragma mark - custom controls
//
////For TYAnimTextField
//+ (TYAnimTextField *)createAnimTextFieldWithSize:(CGSize)size
//                                            Font:(UIFont *)font
//                                       textColor:(UIColor *)textColor
//                                 backgroundColor:(UIColor *)backgroundColor
//                                     borderStyle:(UITextBorderStyle)borderStyle
//                                     placeholder:(NSString *)placeholder
//                                    keyboardType:(UIKeyboardType)keyboardType
//                                   returnKeyType:(UIReturnKeyType)returnKeyType
//                                        delegate:(id<UITextFieldDelegate>)delegate;
//
//
//////For TYInPutView
////+ (TYInPutView *)createInPutViewWithsize:(CGSize)size
////                                    Type:(TYInPutViewType)inPutViewType;
//
//
////For TYAgreeView
//+ (TYAgreeView *)createAgreeViewWithSize:(CGSize)size
//                                  target:(id)target
//                                  action:(SEL)action;
//
//
////For Verity
//+ (TYVerityButton *)createVerityButtonWithSize:(CGSize)size
//                                         Title:(NSString *)title
//                                          font:(UIFont *)font
//                                          time:(NSTimeInterval)time
//                                        corner:(float)corner
//                                        target:(id)target
//                                        action:(SEL)action;
//
////For Region View
//+ (TYRegionView *)createRegionViewWithRegionStr:(NSString *)regionStr
//                                           font:(UIFont *)font;
//
////For TYKeyValueTextLabel
//+ (TYKeyValueTextLabel *)createKeyValueTextLabelWithSize:(CGSize)size
//                                                 textKey:(NSString *)textKey
//                                               textValue:(NSString *)textValue
//                                                keyColor:(UIColor *)keyColor
//                                              valueColor:(UIColor *)valueColor
//                                                 keyFont:(UIFont *)keyFont
//                                               valueFont:(UIFont *)valueFont;
@end
