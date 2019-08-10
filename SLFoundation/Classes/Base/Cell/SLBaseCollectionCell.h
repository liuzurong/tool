//
//  SLBaseCollectionCell.h
//  SLFoundation
//
//  Created by tgtao on 2018/2/1.
//  Copyright © 2018年 tgtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Util.h"
#import "Colors.h"
#import "Macros.h"

@interface SLBaseCollectionCell : UICollectionViewCell

+(CGFloat)getCellHeight;
+(CGFloat)getCellHeightWithData:(id)data;
+(instancetype)constructorCell:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

-(void)configureCell:(id)object;
@end
