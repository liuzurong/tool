//
//  SLBaseWebController.h
//  SLFoundation
//
//  Created by tgtao on 2018/1/31.
//  Copyright © 2018年 tgtao. All rights reserved.
//

#import <SLFoundation/SLFoundation.h>
#import <WebKit/WebKit.h>

@interface SLBaseWebController : SLBaseController<WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webView;

-(void)loadWithUrlString:(NSString *)urlString;
@end
