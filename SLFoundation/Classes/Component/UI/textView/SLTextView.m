//
//  SLTextView.m
//  SLSaid
//
//  Created by liuzurong on 2018/3/1.
//  Copyright © 2018年 liuzu. All rights reserved.
//

#import "SLTextView.h"
#import "SLVerticalLabel.h"
@interface SLTextView ()<UITextViewDelegate>

@property (nonatomic ,strong) UITextView *textView;

@property (nonatomic ,strong) SLVerticalLabel *placeHolderLabel;
@end
@implementation SLTextView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addview];
    }
    return self;
}

- (void)changePlaceHolderFrame {
     [_layoutTextViewSignal sendNext:_placeHolderLabel];
     [_layoutTextViewSignal sendNext:self.textView];
}
- (void)addview {
    _layoutTextViewSignal = [RACSubject subject];
    [self setPlaceholder:@""];
    [self addSubview:self.placeHolderLabel];
    [self addSubview:self.textView];
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [_placeHolderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
}

- (void)setTextFont:(UIFont *)textFont {
    self.textView.font = textFont;
    _placeHolderLabel.font = textFont;
}
- (void)setPlaceholder:(NSString *)placeholder{
    _placeHolderLabel.text = placeholder;
}

- (void)setPlaceholderCorlor:(UIColor *)placeholderCorlor {
    _placeHolderLabel.textColor = placeholderCorlor;
}


#pragma mark -

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}


- (void)textChanged:(NSNotification *)obj {
    UITextView *textView = (UITextView *)obj.object;
    NSString *toBeString = textView.text;
    if (toBeString&&toBeString.length>0) {
        _placeHolderLabel.hidden = YES;
    }else{
        _placeHolderLabel.hidden = NO;
    }
    _text = textView.text;
  
}


- (SLVerticalLabel *)placeHolderLabel {
    if (!_placeHolderLabel) {
        _placeHolderLabel = [[SLVerticalLabel alloc]initWithFrame:CGRectMake(0, 0,100 , 200 )];
        _placeHolderLabel.textColor = TextLowGrayDFColor;
        _placeHolderLabel.font = [UIFont systemFontOfSize:12];
        _placeHolderLabel.verticalAlignment = VerticalAlignmentTop;
        
    }
    return _placeHolderLabel;
}

- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0,100 , 200 )];
        _textView.editable = YES;
        _textView.delegate = self;
        _textView.font = [UIFont systemFontOfSize:12];
        _textView.returnKeyType = UIReturnKeyDone;
        _textView.backgroundColor= [UIColor clearColor];
    } else {}
    return _textView;
}

- (void)dealloc {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
}

@end
