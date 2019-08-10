//
//  SLBaseController.m
//  SLFoundation
//
//  Created by tgtao on 2017/12/21.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import "SLBaseController.h"
#import "UIImage+Color.h"
#import "SLTapRefreshView.h"
#import "UIView+Util.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

@interface SLBaseController ()<SLTapRefreshViewDelegate>
@property (nonatomic, strong) UIControl *rightTitleImageButton;
@property (nonatomic, strong) UIButton *leftButton,*rightButton;
@property (nonatomic, strong) SLTapRefreshView *refreshView;
@end

@implementation SLBaseController

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    _rightTitleImageButton = nil;
    _leftButton = nil;
    _rightButton = nil;
    _viewModel = nil;
    _param = nil;
    _navigationColor = nil;
}

-(UINavigationController *)navigationController
{
    UINavigationController *navi = nil;
    if (self.slNavigationController) {
        navi = self.slNavigationController;
    } else
        navi = [super navigationController];
    
    if (nil == navi) {
        navi = [self topViewController].navigationController;
    }
    return navi;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.navigationColor = WhiteBackGroundColor;
        _selectSignal = [RACSubject subject];
        [self initData];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        //        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = YES;
    }
#endif
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                     TextNormalColor, NSForegroundColorAttributeName,
                                                                     [UIFont fontWithName:@"Arial-Bold" size:18.0], NSFontAttributeName,
                                                                     nil]];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    //当vc在navi中时不会调用，只会调用navi的这个方法，所以可以用下面方法来设置
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    [self hideNavigationBarHairLineWithColor:self.navigationColor];
    self.view.backgroundColor = LightGrayF5Color;
    [self initView];
    [self bindSubscriber];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSucess) name:SLUserLoginSucessNotification object:nil];
}

- (void)loginSucess {
    
}

//当vc在navi中时不会调用，只会调用navi的这个方法
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self layoutSubviews];
}

#pragma mark - init
-(void)initView
{
    
}

-(void)initData
{
    
}

-(void)bindSubscriber {
    
}

-(void)layoutSubviews {
    
}

#pragma mark - need override
+(Class)viewModelClass {
    return [SLBaseVM class];
}

#pragma mark - Getter
-(SLBaseVM *)viewModel {
    if (nil == _viewModel) {
        _viewModel = [[[self class] viewModelClass] new];
    }
    return _viewModel;
}

#pragma mark - Setter
-(void)setNavigationColor:(UIColor *)navigationColor
{
    _navigationColor = navigationColor;
    [self hideNavigationBarHairLineWithColor:navigationColor];
}

#pragma mark - navigation bar color
-(void)hideNavigationBarHairLineWithColor:(UIColor *)color
{
    if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:color] forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:[UIColor clearColor]]];
    }
}

-(void)translucentNavigationBar
{
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
//    UIView * barBackground = self.navigationController.navigationBar.subviews.firstObject;
//    if (@available(iOS 11.0, *))
//    {
//        barBackground.alpha = 0;
//        [barBackground.subviews setValue:@(0) forKeyPath:@"alpha"];
//    } else {
//        barBackground.alpha = 0;
//    }
    
    for (UIView *sv in self.navigationController.navigationBar.subviews) {
        if ([sv isKindOfClass:NSClassFromString(@"_UIBarBackground")]) {
            sv.hidden = YES;
        }
        for (UIView *ssv in sv.subviews) {
            if (ssv.height == 64 || ssv.height == 0.5)
                ssv.hidden = YES;
        }
    }
}

-(void)untranslucentNavigationBar {
    for (UIView *sv in self.navigationController.navigationBar.subviews) {
        if ([sv isKindOfClass:NSClassFromString(@"_UIBarBackground")]) {
            sv.hidden = NO;
        }
        for (UIView *ssv in sv.subviews) {
            if (ssv.height == 64 || ssv.height == 0.5)
                ssv.hidden = NO;
        }
    }
}

#pragma mark - Actions
-(void)leftButtonClick:(id)sender
{
    if (self.navigationController.viewControllers.count > 1) { 
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
        [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)rightButtonClick:(id)sender
{
    
}

#pragma mark - config navigation bar item
-(UIButton *)createButton:(BOOL)bLeft titleLength:(NSInteger)length
{
    UIButton *button = [self getButton:bLeft titleLength:length];
    if (bLeft) {
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        button.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        button.titleEdgeInsets = UIEdgeInsetsMake(0, -20 + (length - 1) * 10, 0, 0);
        self.leftButton = button;
    }
    else
    {
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -20);
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -20);
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -20 + (length - 1) * 10);
        self.rightButton = button;
    }
    
    return button;
}

-(UIButton *)getButton:(BOOL)bLeft titleLength:(NSInteger)length
{
    UIButton *button = bLeft? self.leftButton : self.rightButton;
    if (nil == button) {
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, length>2?70:50, 30);
        [button.titleLabel setFont:[UIFont systemFontOfSize:18.f]];
        @weakify(self);
        [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            @strongify(self);
            if (bLeft) {
                [self leftButtonClick:x];
            }
            else
            {
                [self rightButtonClick:x];
            }
        }];
    }
    return button;
}

-(UIBarButtonItem *)createBarItemWithTitle:(NSString *)title color:(UIColor *)color isLeft:(BOOL)bLeft
{
    UIButton *button = [self createButton:bLeft titleLength:title.length];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    return barItem;
}

-(UIBarButtonItem *)createBarItemWithImage:(UIImage *)image isLeft:(BOOL)bLeft
{
    UIButton *button = [self createButton:bLeft titleLength:0];
    [button setImage:image forState:UIControlStateNormal];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    return barItem;
}

-(void)setBackNavigationItem
{
    self.navigationItem.leftBarButtonItem = [self createBarItemWithImage:[UIImage bundleImageWithName:@"navi_btn_back"] isLeft:YES];;
}

-(void)setWhiteBackNavigationItem {
    self.navigationItem.leftBarButtonItem = [self createBarItemWithImage:[UIImage bundleImageWithName:@"navi_white_back"] isLeft:YES];;
}

-(void)setLeftNavigationItemBarTitle:(NSString *)title color:(UIColor *)color
{
    self.navigationItem.leftBarButtonItem = [self createBarItemWithTitle:title color:color isLeft:YES];
}

-(void)setLeftNavigationItemBarImage:(UIImage *)image
{
    self.navigationItem.leftBarButtonItem = [self createBarItemWithImage:image isLeft:YES];
}

-(void)setRightNavigationItemBarTitle:(NSString *)title color:(UIColor *)color
{
    self.navigationItem.rightBarButtonItem = [self createBarItemWithTitle:title color:color isLeft:NO];
}

-(void)setRightNavigationItemBarImage:(UIImage *)image
{
    self.navigationItem.rightBarButtonItem = [self createBarItemWithImage:image isLeft:NO];
}
-(void)setLeftNavigationItemBarImage:(UIImage *)image title:(NSString *)title color:(UIColor *)color{
    NSString * str = [NSString stringWithFormat:@" %@",title];
    UIButton * btn = [UIButton buttonWithType:0];
    //    btn.frame = CGRectMake(0, 0, 50, 50);
    [btn setTitle:str forState:0];
    [btn setTitleColor:color forState:0];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setImage:image forState:0];
    btn.imageEdgeInsets = UIEdgeInsetsMake(0,-15, 0, btn.titleLabel.frame.origin.x);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, -10, 0, btn.titleLabel.frame.size.width);
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = barItem;
    CGSize titleSize = [title sizeWithFont:btn.font
                         constrainedToSize:CGSizeMake(MAXFLOAT, 0.0)
                             lineBreakMode:NSLineBreakByWordWrapping];
    btn.frame = CGRectMake(0, 0, titleSize.width + 13 + 15, 30);
    [btn addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)setRightNavigationItemBarImage:(UIImage *)image title:(NSString *)title color:(UIColor *)color
{
    UIControl *button = nil;
    UILabel *titleLabel = nil;
    UIImageView *imageView = nil;
    if (nil == _rightTitleImageButton) {
        button = [[UIControl alloc] init];
        _rightTitleImageButton = button;
        
        titleLabel = [[UILabel alloc] init];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textColor = color;
        titleLabel.text = title;
        titleLabel.tag = 10001;
        [button addSubview:titleLabel];
        
        imageView = [[UIImageView alloc] init];
        imageView.image = image;
        imageView.tag = 10002;
        [button addSubview:imageView];
        
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(button).with.offset(0);
            make.top.equalTo(button).with.offset(0);
            make.height.equalTo(button);
        }];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(titleLabel.mas_right).with.offset(5);
            make.centerY.equalTo(button);
        }];
        
        [button addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        CGSize titleSize = [title sizeWithFont:titleLabel.font
                             constrainedToSize:CGSizeMake(MAXFLOAT, 0.0)
                                 lineBreakMode:NSLineBreakByWordWrapping];
        button.frame = CGRectMake(0, 0, titleSize.width + 5 + 12, 30);
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    }
    else
    {
        button = _rightTitleImageButton;
        titleLabel = (UILabel *)[button viewWithTag:10001];
        imageView = (UIImageView *)[button viewWithTag:10002];
        
        titleLabel.text = title;
        imageView.image = image;
    }
}

-(void)hideLeftButton:(BOOL)hidden
{
    self.leftButton.hidden = hidden;
}

-(void)hideRightButton:(BOOL)hidden
{
    self.rightButton.hidden = hidden;
}

-(void)pushVC:(NSString *)vcName params:(id)params hidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed {
    Class cls = NSClassFromString(vcName);
    SLBaseController *vc = (SLBaseController *)[cls new];
    vc.param = params;
    vc.hidesBottomBarWhenPushed = hidesBottomBarWhenPushed;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - refresh view
-(SLTapRefreshView *)refreshView {
    if (nil == _refreshView) {
        _refreshView = [SLTapRefreshView new];
        _refreshView.delegate = self;
        [self.view addSubview:_refreshView];
        [_refreshView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
            make.width.height.mas_equalTo(kScreenWidth - 80);
        }];
    }
    return _refreshView;
}

- (void)tapRefreshViewToRequestData {
    
}

-(void)beginRefresh {
    self.refreshView.state = TapRefreshViewStateLoading;
}

-(void)endRefresh {
    _refreshView.state = TapRefreshViewStateSuccess;
}

-(void)failureRefresh {
    _refreshView.state = TapRefreshViewStateFailure;
}



#pragma clang diagnostic pop
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
