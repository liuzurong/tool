//
//  SLLineSegmentView.h
//  SLFoundation
//
//  Created by tgtao on 2017/12/22.
//  Copyright © 2017年 tgtao. All rights reserved.
//

#import <SLFoundation/SLFoundation.h>

@interface SLLineSegmentView : SLBaseView
@property (nonatomic, strong) RACSubject *selectedSignal;

-(instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;
@end
