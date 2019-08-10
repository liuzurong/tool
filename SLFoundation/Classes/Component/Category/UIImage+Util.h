//
//  UIImage+Util.h
//  SLFoundation
//
//  Created by tgtao on 2017/12/22.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Util)

+(UIImage *)bundleImageWithName:(NSString *)imageName;
+(UIImage *)bundle:(NSString *)bundleName name:(NSString *)imageName;
- (UIImage *)circleImage;
@end
