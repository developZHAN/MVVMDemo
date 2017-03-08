//
//  UIView+TYFrame.h
//
//  Created by 詹瞻
//
//  For Fast APP
//

#import <UIKit/UIKit.h>

/**
 *  为了避免组件库进入其他项目之后使用的同名属性被其他Category方法覆盖修改
 *
 *  我们增加ty_前缀确保始终进入正确的设置流程
 */

@interface UIView (TYFrame)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

/**
 * Shortcut for frame.origin.x.
 *
 * Sets frame.origin.x = left
 */
@property (nonatomic) CGFloat ty_left;

/**
 * Shortcut for frame.origin.y
 *
 * Sets frame.origin.y = top
 */
@property (nonatomic) CGFloat ty_top;

/**
 * Shortcut for frame.origin.x + frame.size.width
 *
 * Sets frame.origin.x = right - frame.size.width
 */
@property (nonatomic) CGFloat ty_right;

/**
 * Shortcut for frame.origin.y + frame.size.height
 *
 * Sets frame.origin.y = bottom - frame.size.height
 */
@property (nonatomic) CGFloat ty_bottom;

/**
 * Shortcut for frame.size.width
 *
 * Sets frame.size.width = width
 */
@property (nonatomic) CGFloat ty_width;

/**
 * Shortcut for frame.size.height
 *
 * Sets frame.size.height = height
 */
@property (nonatomic) CGFloat ty_height;

/**
 * Shortcut for frame.origin
 */
@property (nonatomic) CGPoint ty_origin;

/**
 * Shortcut for frame.size
 */
@property (nonatomic) CGSize ty_size;

/**
 * Shortcut for center.x
 *
 * Sets center.x = centerX
 */
@property (nonatomic) CGFloat ty_centerX;

/**
 *  右上角
 *  self.origin.x+self.size.width,self.origin.y
 */
@property (nonatomic) CGPoint ty_topRight;

/**
 *  左下角
 *
 *  self.origin.x,self.origin.y+self.size.height
 */
@property (nonatomic) CGPoint ty_bottomLeft;

/**
 *  右下角
 *
 *  self.origin.x+self.size.width,self.origin.y+self.size.height
 */
@property (nonatomic) CGPoint ty_bottomRight;

/**
 * Shortcut for center.y
 *
 * Sets center.y = centerY
 */
@property (nonatomic) CGFloat ty_centerY;

/**
 *  Shortcut for right to superview
 *  Sets frame.origin.x = superview.width - rightToSuper -frame.size.width
 */
@property (nonatomic) CGFloat ty_rightToSuper;

/**
 *  shortcut for bottom to superview
 *  set frame.origin.y = superview.height - bottomToSuper - frame.size.height
 */
@property (nonatomic) CGFloat ty_bottomToSuper;


//提供自动布局后view的宽高和坐标
@property (nonatomic ,assign, readonly) CGPoint ty_Point;
@property (nonatomic ,assign, readonly) CGSize ty_Size;

@end
