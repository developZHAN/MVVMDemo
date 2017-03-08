//
//  TYUICreator.m
//
//  Created by 詹瞻
//
//  For Fast APP
//

#import "TYUICreator.h"


@implementation TYUICreator

//For Line
//绘制线
+ (UIView *)createLineWithSize:(CGSize)size bgColor:(UIColor *)color{
    
    UIView *line = [[UIView alloc]initWithFrame:TYRectFromSize(size)];
    line.backgroundColor = color;
    
    return line;
}

//For view
+ (UIView *)createViewWithSize:(CGSize)size
                       bgColor:(UIColor *)bgColor
                        radius:(float)cornerRadius
{
    UIView *view = [[UIView alloc] initWithFrame:TYRectFromSize(size)];
    view.backgroundColor = bgColor;
    view.layer.cornerRadius = cornerRadius;
    return view;
}

+ (UIView *)createViewWithSize:(CGSize)size
                       bgColor:(UIColor *)bgColor
                        radius:(float)cornerRadius
                       gesture:(UIGestureRecognizer *)gesture
{
    UIView *view = [TYUICreator createViewWithSize:size
                                           bgColor:bgColor
                                            radius:cornerRadius];
    [view addGestureRecognizer:gesture];
    return view;
}


//For UILabel
+ (UILabel *)createLabelWithSize:(CGSize)size
                            text:(NSString *)text
                     sysFontSize:(int)fontSize
{
    UILabel *label = [self createLabelWithSize:size
                                          text:text
                                         color:TYColorBlack
                                          font:TYFontWithSize(fontSize)];
    return label;
}

+ (UILabel *)createLabelWithSize:(CGSize)size
                            text:(NSString *)text
                           color:(UIColor *)color
                            font:(UIFont *)font
{
    NSMutableDictionary *aText = [NSMutableDictionary dictionary];
    aText[@"text"] = text;
    aText[@"font"] = font;
    aText[@"textColor"] = color;
    UILabel *label = [self createLabelWithSize:size
                                         aText:aText
                                       bgColor:TYColorWhiteBg];
    return label;
}

//+ (UILabel *)createLabelWithFont:(UIFont *)font
//                           aText:(NSMutableDictionary *)aText
//{
//    //此处根据font确定控件大小
//    UILabel *label = [self createLabelWithSize:(CGSize)aText[@"size"]
//                                         aText:aText
//                                       bgColor:nil];
//    return label;
//}

+ (UILabel *)createLabelWithSize:(CGSize)size
                           aText:(NSMutableDictionary *)aText
                         bgColor:(UIColor *)bgColor
{
    UILabel *label = [[UILabel alloc] initWithFrame:TYRectFromSize(size)];
    [label setValuesForKeysWithDictionary:aText];
    label.backgroundColor = bgColor;
    label.numberOfLines = 0;
    
    //结尾部分的内容以……方式省略，显示头的文字
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    
//    label.font = [UIFont fontWithName:TYFontName size:label.font.pointSize];

    return label;
}

+ (UIView *)createTitleViewWithSize:(CGSize)size
                            text:(NSString *)text
                     sysFontSize:(int)fontSize
{
    return [self createTitleViewWithSize:size text:text textColor:TYColorWhite sysFontSize:fontSize];
}

+ (UIView *)createTitleViewWithSize:(CGSize)size
                               text:(NSString *)text
                          textColor:(UIColor *)color
                        sysFontSize:(int)fontSize
{
    UIButton *titleView = [TYUICreator createButtonWithTitle:text
                                                        size:size
                                                  titleColor:color
                                                        font:TYFontWithSize(fontSize)
                                                      target:nil action:nil];
    titleView.titleEdgeInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
    
    titleView.userInteractionEnabled = NO;
    titleView.backgroundColor = TYColorClear;
    
    [titleView sizeToFit];
    
    return titleView;
}

//For UIButton
+ (UIButton *)createButtonWithTitle:(NSString *)title
                               size:(CGSize)size
                         titleColor:(UIColor *)titleColor
                               font:(UIFont *)font
                             target:(id)target
                             action:(SEL)action
{
    return [self createButtonWithTitle:title
                                  size:(CGSize)size
                            titleColor:titleColor
                                  font:font
                            buttonType:UIButtonTypeCustom
                               bgColor:nil
                                corner:0
                                target:target
                                action:action];
}

+ (UIButton *)createButtonWithTitle:(NSString *)title
                               size:(CGSize)size
                         titleColor:(UIColor *)titleColor
                               font:(UIFont *)font
                         buttonType:(UIButtonType)buttonType
                            bgColor:(UIColor *)bgColor
                             corner:(float)cornerRadius
                             target:(id)target
                             action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:buttonType];
    button.frame = TYRectFromSize(size);
    [button setTitle:title forState:UIControlStateNormal];
    if (titleColor) {
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (font) {
        button.titleLabel.font = font;
    }
    if (bgColor) {
        button.backgroundColor = bgColor;
    }
    if (cornerRadius > 0) {
        button.layer.cornerRadius = cornerRadius;
    }
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)createButtonWithTitle:(NSString *)title
                               size:(CGSize)size
                              image:(NSString *)imageName
                          titleEdge:(UIEdgeInsets)titleEdge
                          imageEdge:(UIEdgeInsets)imageEdge
                             target:(id)target
                             action:(SEL)action
{
    UIButton *button = [self createButtonWithTitle:title size:size titleColor:nil font:nil target:target action:action];
    [button setImage:[UIImage imageWithOriginalName:imageName] forState:UIControlStateNormal];
    [button setTitleEdgeInsets:titleEdge];
    [button setImageEdgeInsets:imageEdge];
    return button;
}

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
                             action:(SEL)action
{
    UIButton *button = [self createButtonWithTitle:title
                                              size:size
                                        titleColor:titleColor
                                              font:font
                                            target:target
                                            action:action];
    
    [button setImage:[UIImage imageWithOriginalName:imageName] forState:UIControlStateNormal];
    button.contentHorizontalAlignment = hAlign;
    button.contentVerticalAlignment = vAlign;
    button.contentEdgeInsets = contentEdge;
    
    CGSize imageSize = button.imageView.frame.size;
    CGSize titleSize = button.titleLabel.frame.size;
    CGFloat totalWidth = (imageSize.width + titleSize.width) + span;
    CGFloat totalHeight = (imageSize.height + titleSize.height) + span;
    
    switch (type) {
        case BtnImgDirectionDefault:
        {
            if (UIControlContentHorizontalAlignmentRight == hAlign) {
                button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, span);
            }else{
                button.titleEdgeInsets = UIEdgeInsetsMake(0, span, 0, 0);
            }
        }
            break;
        case BtnImgDirectionRight:
            button.imageEdgeInsets = UIEdgeInsetsMake(0, (totalWidth - imageSize.width) , 0, -titleSize.width);
            button.titleEdgeInsets = UIEdgeInsetsMake(0, -imageSize.width , 0, (totalWidth - titleSize.width));
            break;
        case BtnImgDirectionTop:
            button.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0, 0, - titleSize.width);
            button.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, - (totalHeight - titleSize.height),0);
            break;
        case BtnImgDirectionBottom:
            button.imageEdgeInsets = UIEdgeInsetsMake((totalHeight - imageSize.height), 0, 0, - titleSize.width);
            button.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, (totalHeight - titleSize.height),0);
            break;
    }
    return button;
}

+ (UIButton *)createButtonWithNormalImage:(NSString *)normalImageName
                         highlightedImage:(NSString *)highlightedImageName
                                   target:(id)target
                                   action:(SEL)action
{
    UIButton *button = [self createButtonWithTitle:nil size:CGSizeZero titleColor:nil font:nil target:target action:action];
    [button setImage:[UIImage imageWithOriginalName:normalImageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageWithOriginalName:highlightedImageName] forState:UIControlStateHighlighted];
    CGSize size = [button imageForState:UIControlStateNormal].size;
    button.frame = TYRectFromSize(size);;
    return button;
}

+ (UIButton *)createButtonWithSize:(CGSize)size
                       NormalImage:(NSString *)normalImageName
                  highlightedImage:(NSString *)highlightedImageName
                            target:(id)target
                            action:(SEL)action
{
    UIButton *button = [self createButtonWithNormalImage:normalImageName
                     highlightedImage:highlightedImageName
                               target:target
                               action:action];
    button.frame = TYRectFromSize(size);
    
    return button;
}

+ (UIButton *)createButtonWithSize:(CGSize)size
                       NormalImage:(NSString *)normalImageName
                  selectedImage:(NSString *)selectedImageName
                            target:(id)target
                            action:(SEL)action
{
    UIButton *button = [self createButtonWithNormalImage:normalImageName
                                        highlightedImage:selectedImageName
                                                  target:target
                                                  action:action];
    [button setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    button.frame = TYRectFromSize(size);
    
    return button;
}


#pragma mark - For UIImageView
+ (UIImageView *)createImageViewWithName:(NSString *)imageName
{
    CGSize size = [UIImage imageWithOriginalName:imageName].size;
    return [self createImageViewWithName:imageName size:size];
}

+ (UIImageView *)createImageViewWithSize:(CGSize)size
{
    return [self createImageViewWithName:nil size:size];
}

+ (UIImageView *)createImageViewWithName:(NSString *)imageName size:(CGSize)size
{
    return [self createImageViewWithName:imageName size:size radius:0];
}

+ (UIImageView *)createImageViewWithName:(NSString *)imageName size:(CGSize)size radius:(float)cornerRadius
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:TYRectFromSize(size)];
    imageView.image = [UIImage imageWithOriginalName:imageName];
    imageView.userInteractionEnabled = YES;
    imageView.layer.cornerRadius = cornerRadius;
    imageView.layer.masksToBounds = YES;
    return imageView;
}


#pragma mark - For UITextField
+ (UITextField *)createTextFieldWithSize:(CGSize)size
                             placeholder:(NSString *)placeholder
                                delegate:(id<UITextFieldDelegate>)delegate
{
    UITextField *textField = [[UITextField alloc] initWithFrame:TYRectFromSize(size)];
    textField.placeholder = placeholder;
    textField.delegate = delegate;
    return textField;
}

+ (UITextField *)createTextFieldWithSize:(CGSize)size
                                    Font:(UIFont *)font
                               textColor:(UIColor *)textColor
                         backgroundColor:(UIColor *)backgroundColor
                             borderStyle:(UITextBorderStyle)borderStyle
                             placeholder:(NSString *)placeholder
                            keyboardType:(UIKeyboardType)keyboardType
                           returnKeyType:(UIReturnKeyType)returnKeyType
                                delegate:(id<UITextFieldDelegate>)delegate
{
    UITextField *textField = [self createTextFieldWithSize:size placeholder:placeholder delegate:delegate];
    textField.font = font;
    textField.textColor = textColor;
    textField.backgroundColor = backgroundColor;
    textField.borderStyle = borderStyle;
    textField.keyboardType = keyboardType;
    textField.returnKeyType = returnKeyType;
    return textField;
}


#pragma mark - For UITextView
+ (UITextView *)createTextViewWithSize:(CGSize)size
                               aString:(NSAttributedString *)atrributeString
                            editEnable:(BOOL)eEnable
                          scroolEnable:(BOOL)sEnable
{
    UITextView *textView = [[UITextView alloc] initWithFrame:TYRectFromSize(size)];
    if (atrributeString) {
        textView.attributedText = atrributeString;
    }
    textView.editable = eEnable;
    textView.scrollEnabled = sEnable;
    textView.showsHorizontalScrollIndicator = NO;
    textView.showsVerticalScrollIndicator = NO;
    return textView;
}


#pragma mark - For UITableView
+ (UITableView *)createTableViewWithSize:(CGSize)size
                                   style:(UITableViewStyle)style
                               rowHeight:(float)height
                                delegate:(id<UITableViewDelegate, UITableViewDataSource>)delegate
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:TYRectFromSize(size) style:style];
    if (height == 0) {
        height = 44;
    }
    tableView.rowHeight = height;
    tableView.delegate = delegate;
    tableView.dataSource = delegate;
    return tableView;
}

+ (UITableView *)createTableViewWithSize:(CGSize)size
                                   style:(UITableViewStyle)style
                              headerView:(UIView *)headerView
                              footerView:(UIView *)footerView
                            scrollEnable:(BOOL)sEnable
                           bouncesEnable:(BOOL)bEnable
                              zeroMargin:(BOOL)zeroMargin
                      seporatorLineColor:(UIColor *)seporatorLineColor
                                delegate:(id<UITableViewDelegate, UITableViewDataSource>)delegate
{
    UITableView *tableView = [self createTableViewWithSize:size style:style rowHeight:0 delegate:delegate];
    if (headerView) {
        tableView.tableHeaderView = headerView;
    }
    if (footerView) {
        tableView.tableFooterView = footerView;
    }else{
        tableView.tableFooterView = [[UIView alloc] init];
    }
    if (zeroMargin) {
        if ([tableView respondsToSelector:@selector(setSeparatorInset:)]){
            [tableView setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([tableView respondsToSelector:@selector(setLayoutMargins:)]){
            [tableView setLayoutMargins:UIEdgeInsetsZero];
        }
    }
    tableView.scrollEnabled = sEnable;
    tableView.bounces = bEnable;
    tableView.separatorColor = seporatorLineColor;
    return tableView;
}

//+ (UIWebView *)createWebViewWithSize:(CGSize)size
//                              webUrl:(NSString *)url
//                             baseURL:(NSURL *)baseUrl
//                          htmlString:(NSString *)htmlString
//                            delegate:(id<UIWebViewDelegate>)delegate
//{
//    UIWebView *webView = [[UIWebView alloc] initWithFrame:FSRectFromSize(size)];
//    webView.delegate = delegate;
//    webView.scrollView.bounces = NO;
//    
//    if (![FSStringTools isEmpty:url]) {
//        NSURLRequest *request = [FSNetTools getRequestWithURLString:url method:@"GET" timeOut:FS_Timeout];
//        [webView loadRequest:request];
//    }
//    
//    if (![FSStringTools isEmpty:htmlString]) {
//        [webView loadHTMLString:htmlString baseURL:baseUrl];
//    }
//    
//    return webView;
//}

//UIBarButtonItem
+ (UIBarButtonItem *)createBarBtnItemWithSize:(CGSize)size
                                        Image:(NSString *)image
                                    highImage:(NSString *)highImage
                                       target:(id)target
                                       action:(SEL)action
                             forControlEvents:(UIControlEvents)controlEvents
{
    // btn
    UIButton *btn = [[UIButton alloc] initWithFrame:TYRectFromSize(size)];
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    
    [btn addTarget:target action:action forControlEvents:controlEvents];
    
    return  [[UIBarButtonItem alloc] initWithCustomView:btn];
}

//UIBarButtonItem
+ (UIBarButtonItem *)createBarBtnItemWithSize:(CGSize)size
                                        text:(NSString *)text
                                        font:(UIFont *)font
                                        color:(UIColor *)color
                                       target:(id)target
                                       action:(SEL)action
                             forControlEvents:(UIControlEvents)controlEvents
{
    // btn
    UIButton *btn = [[UIButton alloc] initWithFrame:TYRectFromSize(size)];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn setTitle:text forState:UIControlStateNormal];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:controlEvents];
    
    return  [[UIBarButtonItem alloc] initWithCustomView:btn];
}


#pragma mark - custom controls
////For TYAnimTextField
//+ (TYAnimTextField *)createAnimTextFieldWithSize:(CGSize)size
//                                            Font:(UIFont *)font
//                                       textColor:(UIColor *)textColor
//                                 backgroundColor:(UIColor *)backgroundColor
//                                     borderStyle:(UITextBorderStyle)borderStyle
//                                     placeholder:(NSString *)placeholder
//                                    keyboardType:(UIKeyboardType)keyboardType
//                                   returnKeyType:(UIReturnKeyType)returnKeyType
//                                        delegate:(id<UITextFieldDelegate>)delegate
//{
//    TYAnimTextField *textView = [[TYAnimTextField alloc]initWithFrame:TYRectFromSize(size)];
//    textView.placeholderFont = font;
//    textView.textColor = textColor;
//    textView.backgroundColor = backgroundColor;
//    textView.textFiled.borderStyle = borderStyle;
//    textView.textFiled.keyboardType = keyboardType;
//    textView.textFiled.returnKeyType = returnKeyType;
//    textView.placeStr = placeholder;
//    textView.placeholderColor = TYColorlightGray;
//    textView.textFiled.delegate = delegate;
//    
//    return textView;
//    
//    
//    
//}

////For TYInPutView
//+ (TYInPutView *)createInPutViewWithsize:(CGSize)size
//                                    Type:(TYInPutViewType)inPutViewType
//{
//    TYInPutView *inPutView = [[TYInPutView alloc] initWithsize:size Type:inPutViewType];
//    return inPutView;
//}
//
////For TYAgreeView
//+ (TYAgreeView *)createAgreeViewWithSize:(CGSize)size
//                                  target:(id)target
//                                  action:(SEL)action
//{
//    TYAgreeView *agreeView = [[TYAgreeView alloc] initWithsize:size
//                                                        target:target
//                                                        action:action];
//    return agreeView;
//}
//
////For
//+ (TYVerityButton *)createVerityButtonWithSize:(CGSize)size
//                                         Title:(NSString *)title
//                                          font:(UIFont *)font
//                                          time:(NSTimeInterval)time
//                                        corner:(float)corner
//                                        target:(id)target
//                                        action:(SEL)action
//{
//    TYVerityButton *verityButton = [[TYVerityButton alloc] initWithFrame:TYRectFromSize(size)
//                                                             setTitle:title
//                                                                 font:font
//                                                                 time:time
//                                                               corner:corner
//                                                               target:target
//                                                               action:action];
//    return verityButton;
//}
//
//+ (TYRegionView *)createRegionViewWithRegionStr:(NSString *)regionStr
//                                           font:(UIFont *)font
//{
//    regionStr = TYStringIsNull(regionStr) ? @"中国_&CHI" : regionStr;
//    TYRegionView *regionView = [[TYRegionView alloc] initWithRegionStr:regionStr font:font];
//    
//    return regionView;
//}
//
//+ (TYKeyValueTextLabel *)createKeyValueTextLabelWithSize:(CGSize)size
//                                                 textKey:(NSString *)textKey
//                                               textValue:(NSString *)textValue
//                                                keyColor:(UIColor *)keyColor
//                                              valueColor:(UIColor *)valueColor
//                                                 keyFont:(UIFont *)keyFont
//                                               valueFont:(UIFont *)valueFont
//{
//    TYKeyValueTextLabel *keyValueTextLabel = [[TYKeyValueTextLabel alloc] initWithSize:size
//                                                                               textKey:textKey
//                                                                             textValue:textValue
//                                                                              keyColor:keyColor
//                                                                            valueColor:valueColor
//                                                                               keyFont:keyFont
//                                                                             valueFont:valueFont];
//    return keyValueTextLabel;
//}
@end
