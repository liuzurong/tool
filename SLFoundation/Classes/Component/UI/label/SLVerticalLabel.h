//
//  SLLabel.h
//  SLSaid
//
//  Created by liuzurong on 2018/2/11.
//  Copyright © 2018年 liuzu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    VerticalAlignmentTop = 0, // default
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;

@interface SLVerticalLabel : UILabel
@property (nonatomic) VerticalAlignment verticalAlignment;  
@end
