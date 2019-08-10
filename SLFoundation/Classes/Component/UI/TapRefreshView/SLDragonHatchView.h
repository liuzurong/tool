//
//  PLUDragonHatchView.h
//  TGA
//
//  Created by mafengxin on 16/6/2.
//  Copyright © 2016年 developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLDragonHatchView : UIImageView

@property (nonatomic, assign) CGFloat percentage;

@property (nonatomic, assign) CGPoint maskOffset;
-(void)updateLayer;

-(void)hidelayer:(BOOL) hidden;

@end
