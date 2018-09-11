//
//  UIImage+LX_Extention.h
//  inspect_tpson
//
//  Created by tpson on 2018/2/1.
//  Copyright © 2018年 杭州拓深科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LX_Extention)

/**
 根据颜色生成新的图片

 @param color 颜色
 @return 新的颜色图片
 */
+ (instancetype)imageWithColor:(UIColor *)color;


/**
 给图片在指定图片位置,添加一个标记

 @param image 原来的图片
 @param signColor 标记颜色
 @param positionX 相对原图x值
 @param positionY 相对原图y值
 @return 图片在指定图片位置,添加一个标记
 */
+ (UIImage *)imageWithOriginalName:(UIImage *)image signColor:(UIColor *)signColor signPositionX:(CGFloat)positionX ignPositionY:(CGFloat)positionY;


/**
 裁剪圆形图片

 @return 圆形图片
 */
- (instancetype)circleImag;
- (instancetype)circleImagnamed:(NSString *)imageName;
+ (instancetype)circleImage:(NSString *)name;

@end
