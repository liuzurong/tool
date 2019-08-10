//
//  SLBaseWebController.m
//  SLFoundation
//
//  Created by tgtao on 2018/1/31.
//  Copyright © 2018年 tgtao. All rights reserved.
//

#import "SLBaseWebController.h"

@interface SLBaseWebController ()
@property (nonatomic ,copy) NSString *urlString;

@end

@implementation SLBaseWebController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setBackNavigationItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tapRefreshViewToRequestData {
    [self loadWithUrlString:_urlString];
}

-(void)loadWithUrlString:(NSString *)urlString {
    
    _urlString = [self encodeToPercentEscapeString: urlString];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlString]]];
}

- (NSString *)encodeToPercentEscapeString :(NSString *)urlString{
    NSString *encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                 (CFStringRef)urlString,
                                                                (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                                                NULL,
                                                                kCFStringEncodingUTF8));
    return encodedString;
    
}




#pragma mark - getter
-(WKWebView *)webView {
    if (nil == _webView) {
        _webView = [WKWebView new];
        _webView.navigationDelegate = self;
        _webView.scrollView.bounces = NO;
        [self.view addSubview:_webView];
    }
    
    return _webView;
}

#pragma mark - Overrride
-(void)layoutSubviews {
    [_webView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(@0);
    }];
}

#pragma mark - WebViewDelegate
-(void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler{  if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {                  NSURLCredential *card = [[NSURLCredential alloc]initWithTrust:challenge.protectionSpace.serverTrust];
    completionHandler(NSURLSessionAuthChallengeUseCredential,card);
    }
    
}


-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    [self beginRefresh];
}

-(void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    [self failureRefresh];
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [self endRefresh];
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
