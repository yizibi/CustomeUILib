
//
//  UIImage+LX_Extention.m
//  inspect_tpson
//
//  Created by tpson on 2018/2/1.
//  Copyright © 2018年 杭州拓深科技有限公司. All rights reserved.
//

#import "UIImage+LX_Extention.h"

@implementation UIImage (LX_Extention)
+ (instancetype)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 10.0f, 10.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

// 给图片添加标记
+ (UIImage *)imageWithOriginalName:(UIImage *)image signColor:(UIColor *)signColor signPositionX:(double)positionX ignPositionY:(double)positionY {
    
    //1.获取图片
    UIImage *signalImage = [[UIImage imageWithColor:signColor] circleImag];
    //2.开启上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //3.绘制背景图片
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    //绘制标记图片到当前上下文
    CGFloat signX = positionX * image.size.width;
    CGFloat signY = positionY * image.size.height;
    
    CGRect rect = CGRectMake(signX, signY, 40, 40);
    [signalImage drawInRect:rect];
    //4.从上下文中获取新图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    //5.关闭图形上下文
    UIGraphicsEndImageContext();
    //返回图片
    return newImage;
}


/**
 *  圆形图片
 *
 *  @return 圆形图片
 */
- (instancetype)circleImag
{
    UIGraphicsBeginImageContext(self.size);
    
    CGContextRef imgRef = UIGraphicsGetCurrentContext();
    
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    CGContextAddEllipseInRect(imgRef, rect);
    
    CGContextClip(imgRef);
    
    [self drawInRect:rect];
    
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImg;
}
- (instancetype)circleImagnamed:(NSString *)imageName
{
    return [[UIImage imageNamed:imageName] circleImag];
}


+ (instancetype)circleImage:(NSString *)name{
    return [self imageNamed:name].circleImag;
}


@end
