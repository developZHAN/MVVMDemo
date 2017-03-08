//
//  UIView+TYFrame.m
//
//  Created by 詹瞻
//
//  For Fast APP
//

#import "UIView+TYFrame.h"

@implementation UIView (TYFrame)

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
    
}

- (CGFloat)y
{
    return self.frame.origin.y;
}
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
    
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)ty_left {
    return self.frame.origin.x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////

- (void)setTy_left:(CGFloat)ty_left {
    CGRect frame = self.frame;
    frame.origin.x = ty_left;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)ty_top {
    return self.frame.origin.y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTy_top:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)ty_right {
    return self.frame.origin.x + self.frame.size.width;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTy_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)ty_bottom {
    return self.frame.origin.y + self.frame.size.height;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTy_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)centerX {
    return self.center.x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)centerY {
    return self.center.y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)ty_width {
    return self.frame.size.width;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTy_width:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)ty_height {
    return self.frame.size.height;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTy_height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGPoint)ty_origin {
    return self.frame.origin;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTy_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)ty_size {
    return self.frame.size;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)ty_centerX {
    return self.center.x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTy_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)ty_centerY {
    return self.center.y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTy_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTy_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGPoint)ty_topRight
{
    return CGPointMake(self.frame.origin.x+self.frame.size.width,self.frame.origin.y);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTy_topRight:(CGPoint)ty_topRight
{
    CGRect frame = self.frame;
    
    CGFloat xdetal = ty_topRight.x - frame.origin.x - frame.size.width;
    frame.origin.x = frame.origin.x + xdetal;
    
    frame.origin.y = ty_topRight.y;
    
    self.frame = frame;
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGPoint)ty_bottomLeft
{
    return CGPointMake(self.frame.origin.x,self.frame.origin.y+self.frame.size.height);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTy_bottomLeft:(CGPoint)ty_bottomLeft
{
    CGRect frame = self.frame;
    
    CGFloat ydetal = ty_bottomLeft.y - frame.origin.y - frame.size.height;
    frame.origin.y = frame.origin.y + ydetal;
    
    frame.origin.x = ty_bottomLeft.x;
    
    self.frame = frame;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGPoint)ty_bottomRight
{
    return CGPointMake(self.frame.origin.x+self.frame.size.width,self.frame.origin.y+self.frame.size.height);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTy_bottomRight:(CGPoint)ty_bottomRight
{
    CGRect frame = self.frame;
    
    CGFloat xdetal = ty_bottomRight.x - frame.origin.x - frame.size.width;
    frame.origin.x = frame.origin.x + xdetal;
    
    CGFloat ydetal = ty_bottomRight.y - frame.origin.y - frame.size.height;
    frame.origin.y = frame.origin.y + ydetal;
    
    self.frame = frame;
}

- (CGFloat)ty_rightToSuper
{
    return self.superview.bounds.size.width - self.frame.size.width - self.frame.origin.x;
}

- (void)setTy_rightToSuper:(CGFloat)rightToSuper
{
    CGRect frame = self.frame;
    
    frame.origin.x =  self.superview.bounds.size.width - self.frame.size.width  - rightToSuper,
    self.frame = frame;
}

- (CGFloat)ty_bottomToSuper
{
    return self.superview.bounds.size.height - self.frame.size.height - self.frame.origin.y;
}

- (void)setTy_bottomToSuper:(CGFloat)bottomToSuper
{
    CGRect frame = self.frame;
    
    frame.origin.y =  self.superview.bounds.size.height - self.frame.size.height  - bottomToSuper,
    self.frame = frame;
}

- (CGPoint)ty_Point
{
    //刷新布局
    [self.superview layoutIfNeeded];
    [self layoutIfNeeded];
    return self.frame.origin;
}

- (CGSize)ty_Size
{
    //刷新布局
    [self layoutIfNeeded];
    [self.superview layoutIfNeeded];
    return self.frame.size;
}

@end
