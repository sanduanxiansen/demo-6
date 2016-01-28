//
//  ScrollTextView.m
//  
//
//  Created by admin on 15/12/22.
//
//

#import "ScrollTextView.h"
#import "Masonry.h"
#import <objc/runtime.h>

@interface ScrollTextView ()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *textView;

@end

@implementation ScrollTextView

- (instancetype)init {
    if (self == [super init]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    WeakSelf;
    
//    self.backgroundColor = [UIColor yellowColor];
    self.pagingEnabled = YES;
    
    _contentView = [UIView new];
    [self addSubview:_contentView];
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
        make.width.equalTo(weakSelf);
    }];
    
    _textView = [[UILabel alloc] init];
    _textView.text = @"askhfkasdf\naksdfhkashdf\nasdhfkahjsdf\nakdhfkah";
    _textView.font = [UIFont systemFontOfSize:12];
    _textView.numberOfLines = 0;
    [self addSubview:_textView];
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(weakSelf).offset(15);
        make.right.equalTo(weakSelf).offset(-15);
    }];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor greenColor];
    [btn setTitle:@"123" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(actionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.textView.mas_bottom).offset(50);
        make.centerX.equalTo(weakSelf);
        make.size.mas_equalTo(CGSizeMake(100,100));
    }];
    
    [_contentView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(weakSelf.mas_bottom).offset(20);
        make.bottom.equalTo(btn).offset(50);
    }];
    
    
}


- (void)showMethod {
   

}

- (void)actionBtn:(id)sender {
    NSString *className = NSStringFromClass([UIView class]);
    
    
    const char *cClassName = [className UTF8String];
    
    id theClass = objc_getClass(cClassName);
    
    unsigned int outCount;
    
    NSMutableString *methodString = [NSMutableString stringWithString:@""];
    
    Method *m =  class_copyMethodList(theClass,&outCount);
    
    NSLog(@"%d",outCount);
    for (int i = 0; i<outCount; i++) {
        SEL a = method_getName(*(m+i));
        NSString *sn = NSStringFromSelector(a);
        [methodString appendString:[NSString stringWithFormat:@"%@\n",sn]];
        NSLog(@"%@",sn);
    }
    
    self.textView.text = methodString;
}


@end
