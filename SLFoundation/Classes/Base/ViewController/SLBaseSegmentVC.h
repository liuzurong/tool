//
//  SLBaseSegmentVC.h
//  SLFoundation
//
//  Created by tgtao on 2018/3/5.
//  Copyright © 2018年 tgtao. All rights reserved.
//

#import <SLFoundation/SLFoundation.h>

@class DDXSegmentView;
@interface SLBaseSegmentVC : SLBaseTableViewController

@property (nonatomic, strong) DDXSegmentView *segmentView;
@property (nonatomic, copy) NSArray<__kindof SLBaseController *> *viewControllers;
@property (nonatomic, assign) NSInteger selectedIndex;

@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *indicatorColor;
@property (nonatomic, strong) UIColor *underlineColor;
@property (nonatomic, assign) CGFloat segmentOriginY;
@property (nonatomic, assign) CGRect segmentFrame;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIScrollView *scrollView;

-(NSArray *)segmentTitles;
-(NSArray *)segmentImages;
-(CGFloat)segmentHeight;
-(void)switchToSelectedView:(NSInteger)selectedIndex;
@end
