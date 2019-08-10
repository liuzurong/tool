//
//  SLBaseController.h
//  SLFoundation
//
//  Created by tgtao on 2017/12/21.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+Util.h"
#import "SLBaseVM.h"
#import "Colors.h"
#import "Macros.h"
#import <ReactiveObjC/ReactiveObjC.h>
@interface SLBaseController : UIViewController
@property (nonatomic, strong) SLBaseVM *viewModel;
@property (nonatomic, weak) SLBaseController *slParentVC;
@property (nonatomic, weak) UINavigationController *slNavigationController;
@property (nonatomic, strong) id param;
@property (nonatomic, strong) UIColor *navigationColor;

@property (nonatomic, strong) RACSubject *selectSignal;

+(Class)viewModelClass;

-(void)initData;
-(void)initView;
-(void)bindSubscriber;
-(void)layoutSubviews;

//set navi color
-(void)hideNavigationBarHairLineWithColor:(UIColor *)color;
-(void)translucentNavigationBar;
-(void)untranslucentNavigationBar;

//config navigation item
-(void)setBackNavigationItem;
-(void)setWhiteBackNavigationItem;
-(void)setLeftNavigationItemBarTitle:(NSString *)title color:(UIColor *)color;
-(void)setLeftNavigationItemBarImage:(UIImage *)image;
-(void)setRightNavigationItemBarTitle:(NSString *)title color:(UIColor *)color;
-(void)setRightNavigationItemBarImage:(UIImage *)image;
-(void)setLeftNavigationItemBarImage:(UIImage *)image title:(NSString *)title color:(UIColor *)color;
-(void)setRightNavigationItemBarImage:(UIImage *)image title:(NSString *)title color:(UIColor *)color;

-(void)rightButtonClick:(id)sender;
-(void)leftButtonClick:(id)sender;

-(void)hideLeftButton:(BOOL)hidden;

-(void)hideRightButton:(BOOL)hidden;

-(void)pushVC:(NSString *)vcName params:(id)params hidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed;

- (void)loginSucess;

-(void)beginRefresh;
-(void)endRefresh;
-(void)failureRefresh;
@end
