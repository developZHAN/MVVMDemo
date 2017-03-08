//
//  UIImage+TYImage.h
//
//  Created by 詹瞻
//
//  For Fast APP
//


@interface UIImage (Image)

/**
 *  load the original image without rendering
 */
+ (instancetype)imageWithOriginalName:(NSString *)imageName;

+ (UIImage *)imageByScalingToMaxSize:(UIImage *)sourceImage;

- (UIImage *)imageToUpMirrored;

+ (UIImage *)imageWithTYColor:(UIColor *)color;

+ (UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;
@end
