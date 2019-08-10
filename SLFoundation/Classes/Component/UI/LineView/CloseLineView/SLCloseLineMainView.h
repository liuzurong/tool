//
//  SLCloseLineMainView.h
//  SLFoundation
//
//  Created by tgtao on 2017/12/25.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import <SLFoundation/SLFoundation.h>

@interface SLCloseLineMainView : SLBaseView
@property (nonatomic, assign) BOOL showCursor;

-(void)refreshkLineViewWithCode:(NSString *)code;
@end
