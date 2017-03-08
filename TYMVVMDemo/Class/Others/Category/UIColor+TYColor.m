//
//  UIColor+TYColor.m
//
//  Created by 詹瞻
//
//  For Fast APP
//

#import "UIColor+TYColor.h"

static NSMutableArray *_ramdomColorList;

@implementation UIColor (TYColor)

+ (NSMutableArray *)ramdomColorList
{
    if (!_ramdomColorList) {
        
        _ramdomColorList = [NSMutableArray array];
        
        [_ramdomColorList addObject:TYColor(255, 227, 251)];
        [_ramdomColorList addObject:TYColor(232, 255, 140)];
        [_ramdomColorList addObject:TYColor(255, 222, 201)];
        [_ramdomColorList addObject:TYColor(245, 164, 51)];
        [_ramdomColorList addObject:TYColor(179, 209, 193)];
        [_ramdomColorList addObject:TYColor(167, 148, 150)];
        [_ramdomColorList addObject:TYColor(219, 217, 183)];
        [_ramdomColorList addObject:TYColor(229, 123, 133)];
        [_ramdomColorList addObject:TYColor(137, 119, 179)];
        [_ramdomColorList addObject:TYColor(214, 208, 206)];
        [_ramdomColorList addObject:TYColor(129, 194, 214)];
        [_ramdomColorList addObject:TYColor(129, 146, 214)];
        [_ramdomColorList addObject:TYColor(217, 179, 230)];
        [_ramdomColorList addObject:TYColor(220, 247, 161)];
        [_ramdomColorList addObject:TYColor(242, 114, 125)];
        [_ramdomColorList addObject:TYColor(190, 217, 132)];
        [_ramdomColorList addObject:TYColor(242, 195, 107)];
        [_ramdomColorList addObject:TYColor(242, 147, 92)];
        [_ramdomColorList addObject:TYColor(242, 106, 75)];
        [_ramdomColorList addObject:TYColor(141, 124, 105)];
    }
    return _ramdomColorList;
}

+ (UIColor *)randomColorInListWithAlpha:(CGFloat)alpha
{
    [self ramdomColorList];
    
    //生成0 - 20随机数
    NSInteger ramdomNum = arc4random() % 20;
    
    return [_ramdomColorList[ramdomNum] colorWithAlphaComponent:alpha];
}


@end
