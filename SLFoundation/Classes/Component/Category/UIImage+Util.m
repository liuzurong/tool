//
//  UIImage+Util.m
//  SLFoundation
//
//  Created by tgtao on 2017/12/22.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import "UIImage+Util.h"

@implementation UIImage (Util)

+(UIImage *)bundleImageWithName:(NSString *)imageName
{
//    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"SLFoundationBundle" ofType:@"bundle"];
//    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
//    int scale = (int)[UIScreen mainScreen].scale;
//    if (scale != 1) {
//        imageName = [NSString stringWithFormat:@"%@@%dx", imageName,scale];
//    }
//
//    NSString *path = [bundle pathForResource:imageName ofType:@"png"];
//    NSLog(@"bundle path = %@,image path = %@",bundlePath,path);
//
//    UIImage *image = [UIImage imageWithContentsOfFile:path];
    return [self bundle:@"SLFoundationBundle" name:imageName];
}

+(UIImage *)bundle:(NSString *)bundleName name:(NSString *)imageName {
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    int scale = (int)[UIScreen mainScreen].scale;
    if (scale != 1) {
        imageName = [NSString stringWithFormat:@"%@@%dx", imageName,scale];
    }
    
    NSString *path = [bundle pathForResource:imageName ofType:@"png"];
    NSLog(@"bundle path = %@,image path = %@",bundlePath,path);
    
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    return image;
}

- (UIImage *)circleImage {
    
    // 开始图形上下文
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    
    // 获得图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 设置一个范围
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    // 根据一个rect创建一个椭圆
    CGContextAddEllipseInRect(ctx, rect);
    
    // 裁剪
    CGContextClip(ctx);
    
    // 将原照片画到图形上下文
    [self drawInRect:rect];
    
    // 从上下文上获取剪裁后的照片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
