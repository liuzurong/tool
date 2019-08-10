//
//  SLBaseCollectionCell.m
//  SLFoundation
//
//  Created by tgtao on 2018/2/1.
//  Copyright © 2018年 tgtao. All rights reserved.
//

#import "SLBaseCollectionCell.h"

@implementation SLBaseCollectionCell

+(CGFloat)getCellHeight
{
    return 44.f;
}

+(CGFloat)getCellHeightWithData:(id)data
{
    return 44.f;
}

+(instancetype)constructorCell:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"cell";//NSStringFromClass([self class]);
    SLBaseCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    if (nil == cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.backgroundColor = WhiteBackGroundColor;
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super init];
    if (self) {
        [self createSubviews];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self createSubviews];
    }
    return self;
}

-(void)createSubviews
{

}

//-(void)layoutSubviews {
//    [super layoutSubviews];
////    [_lineView mas_updateConstraints:^(MASConstraintMaker *make) {
////        make.left.right.bottom.equalTo(@0);
////        make.height.equalTo(@0.5);
////    }];
//}

-(void)configureCell:(id)object
{
    
}
@end
