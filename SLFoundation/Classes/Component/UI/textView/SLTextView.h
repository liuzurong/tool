//
//  SLTextView.h
//  SLSaid
//
//  Created by liuzurong on 2018/3/1.
//  Copyright © 2018年 liuzu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLTextView : UIView

@property (nonatomic ,copy) NSString* placeholder;

@property (nonatomic ,strong) UIColor *placeholderCorlor;

@property (nonatomic ,strong) UIFont *textFont;

@property (nonatomic ,copy) NSString *text;

@property (nonatomic ,strong) RACSubject *layoutPlaceHolderLabelSignal;

@property (nonatomic ,strong) RACSubject *layoutTextViewSignal;

- (void)changePlaceHolderFrame ;

@end
