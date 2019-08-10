//
//  SLBaseSegmentVC.m
//  SLFoundation
//
//  Created by tgtao on 2018/3/5.
//  Copyright © 2018年 tgtao. All rights reserved.
//

#import "SLBaseSegmentVC.h"
#import "DDXSegmentView.h"

@interface SLBaseSegmentVC ()<UIScrollViewDelegate>

@property (nonatomic, weak) SLBaseController *currentSelectedVC;

@property (nonatomic, strong) UIView *backView;
@end

@implementation SLBaseSegmentVC

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.currentSelectedVC viewWillAppear:animated];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.currentSelectedVC viewDidDisappear:animated];
}

-(void)viewDidAppear:(BOOL)animated
{
    [self.currentSelectedVC viewDidAppear:YES];
}

-(instancetype)init {
    if (self = [super init]) {
        self.selectedColor = TextRedColor;
        self.normalColor = TextNormalColor;
        self.indicatorColor = RedBackGroundColor;
        self.underlineColor = TextLowGrayDHColor;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _contentView = [UIView new];
    [self.view addSubview:_contentView];
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(@0);
    }];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.segmentOriginY, kScreenWidth, self.view.frame.size.height - [self segmentHeight]-self.segmentOriginY)];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    [_contentView addSubview:_scrollView];
    _backView = [UIView new];
    _backView.hidden = YES;
    _backView.userInteractionEnabled = NO;
    [_scrollView addSubview:_backView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.equalTo(_contentView);
        make.top.equalTo(self.segmentView.mas_bottom);
    }];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_scrollView);
        make.height.equalTo(_scrollView);
        make.width.equalTo(_contentView);
    }];
    [self.segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(_contentView);
        make.top.equalTo(@(self.segmentOriginY));
        make.height.equalTo(@([self segmentHeight]));
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Override
-(void)initData {
    self.segmentOriginY = 0;
    self.segmentFrame = CGRectMake(0, self.segmentOriginY, kScreenWidth, [self segmentHeight]);
}

#pragma mark - Setter
-(void)setViewControllers:(NSArray<__kindof SLBaseController *> *)viewControllers
{
    _viewControllers = nil;
    _viewControllers = [viewControllers copy];
    
    SLBaseController *viewController = viewControllers[self.selectedIndex];
    [self.scrollView addSubview:viewController.view];
    [viewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_scrollView);
        make.top.equalTo(@0);
        make.leading.equalTo(@(_scrollView.width*self.selectedIndex));
        make.width.equalTo(_scrollView);
    }];
    
    [_backView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_scrollView);
        make.height.equalTo(_scrollView);
        make.width.equalTo(_scrollView).multipliedBy(_viewControllers.count);
    }];
    
    self.currentSelectedVC = viewController;
}

#pragma mark - Getter
-(DDXSegmentView *)segmentView
{
    if (nil == _segmentView) {
        NSArray *arrTitles = [self segmentTitles];
        NSArray *images = [self segmentImages];
        if (images.count == arrTitles.count) {
            _segmentView = [[DDXSegmentView alloc] initWithFrame:self.segmentFrame selectIndex:self.selectedIndex titles:arrTitles images:images];
        } else {
            _segmentView = [[DDXSegmentView alloc] initUnderLineWithFrame:self.segmentFrame selectIndex:self.selectedIndex titles:arrTitles];
        }
        [_segmentView setUnderlinePadding:2.0];
        [_segmentView setUnderlineColor:self.underlineColor];
        [_segmentView setTextColor:self.normalColor];
        //        [self.segmentView setTextColor:TextBlueColor atIndex:0];
        
        _segmentView.backgroundColor = WhiteBackGroundColor;
        [_segmentView setIndicatorColor:self.indicatorColor];
        [_segmentView setIndicatorHeight:2.];
        [_segmentView setTextFont:FontWithSize(14.f)];
        [_segmentView setTextFont:FontWithSize(14.) atIndex:0];
        [_segmentView setIndicatorWidth:kScreenWidth/7.];
        [_contentView addSubview:_segmentView];
        
        @weakify(self);
        [_segmentView.selectedSignal subscribeNext:^(UIButton* button) {
            @strongify(self);
            if (self.segmentView.selectedIndex == button.tag) {
                return;
            }
            
            [self.segmentView setTextColor:self.normalColor atIndex:self.segmentView.selectedIndex];
            [self.segmentView setTextColor:self.selectedColor atIndex:button.tag];
            
            [self segmentButtonClickAtIndex:button.tag];
            self.segmentView.selectedIndex = button.tag;
            //            self.navLabel.text = arrTitles[button.tag];
        }];
    }
    
    return _segmentView;
}

#pragma mark - method
-(void)segmentButtonClickAtIndex:(NSInteger)index
{
    self.selectedIndex = index;
}

-(void)setSelectedIndex:(NSInteger)selectedIndex
{
    if (_selectedIndex == selectedIndex) {
        return;
    }
    
    [self switchToSelectedView:selectedIndex];
    self.scrollView.contentOffset = CGPointMake(selectedIndex * _scrollView.width, 0);
    _selectedIndex = selectedIndex;
}

-(void)switchToSelectedView:(NSInteger)selectedIndex
{
    //    [self.segmentView setTextFont:FontWithSize(14.) atIndex:self.segmentView.selectedIndex];
    //    [self.segmentView setTextFont:BoldFontWithSize(14.) atIndex:selectedIndex];
    [self.segmentView setTextColor:self.normalColor atIndex:self.segmentView.selectedIndex];
    [self.segmentView setTextColor:self.selectedColor atIndex:selectedIndex];
    self.segmentView.selectedIndex = selectedIndex;
    [self.segmentView setIndicatoPosition:selectedIndex];
    
    SLBaseController *viewController = self.viewControllers[self.selectedIndex];
    SLBaseController *toViewController = self.viewControllers[selectedIndex];
    //    CGRect frame = self.view.bounds;
    //    frame.origin.x = selectedIndex * kScreenWidth;
    //    frame.origin.y = self.segmentView.maxY;
    //    frame.size.height = frame.size.height - self.segmentView.maxY;
    //    NSLog(@"self.segmentView.maxY %f",self.segmentView.maxY);
    //    toViewController.view.frame = frame;
    
    [viewController viewWillDisappear:YES];
    [viewController viewDidDisappear:YES];
    if (toViewController.view.superview == nil) {
        [self.scrollView addSubview:toViewController.view];
        [toViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_scrollView);
            make.top.equalTo(@0);
            make.leading.equalTo(@(_scrollView.width*selectedIndex));
            make.width.equalTo(_scrollView);
        }];
    }
    else
    {
        [toViewController viewWillAppear:YES];
        [toViewController viewDidAppear:YES];
    }
    _currentSelectedVC = toViewController;
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int selectedIndex = (int)(scrollView.contentOffset.x - 0)/_scrollView.width ;
    if (self.selectedIndex == selectedIndex) {
        return;
    }
    
    [self switchToSelectedView:selectedIndex];
    _selectedIndex = selectedIndex;
    //    NSArray *titles = @[@"自选",@"题材",@"沪深",@"港股",@"美股",@"环球"];
    //    self.navLabel.text = titles[selectedIndex];
}


#pragma mark - Should override
-(NSArray *)segmentTitles {
    return nil;
}

-(NSArray *)segmentImages {
    return nil;
}

-(CGFloat)segmentHeight {
    return AdaptHeightByIp6(47.f);
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

