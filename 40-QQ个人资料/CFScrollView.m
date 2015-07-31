//
//  CFScrollView.m
//  40-QQ个人资料
//
//  Created by 于 传峰 on 15/7/31.
//  Copyright (c) 2015年 于 传峰. All rights reserved.
//

#import "CFScrollView.h"

#define scrollViewW self.scrollView.bounds.size.width
#define scrollViewH self.scrollView.bounds.size.height
#define imageViewW  self.imageView.bounds.size.width
#define imageViewH  self.imageView.bounds.size.height


@interface CFScrollView()
@property(nonatomic, weak) UIScrollView* scrollView;
@property(nonatomic, weak) UIImageView* imageView;
@property(nonatomic, strong) NSMutableArray* values;
@property(nonatomic, weak) NSValue* currentValue;
@end

@implementation CFScrollView

- (instancetype)initWithFrame:(CGRect)frame backImage:(UIImage *)image
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupSubViewsWithImage:image];
    }
    
    return self;
}

- (void)setupSubViewsWithImage:(UIImage *)image
{
    UIScrollView* scrollView = [[UIScrollView alloc] init];
    [self addSubview:scrollView];
    self.scrollView = scrollView;
    scrollView.frame = self.bounds;
    
    scrollView.backgroundColor = [UIColor clearColor];
    
    UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
    [scrollView addSubview:imageView];
    self.imageView = imageView;
    imageView.frame = (CGRect){ 0, 0, imageView.bounds.size};
    
    scrollView.contentSize = imageView.bounds.size;
    
    [self setupValues];
}

- (void)didMoveToWindow
{
    [super didMoveToWindow];
    
    [self addAnimation];
    
    [self registeNotificationCenter];
}
-(void)registeNotificationCenter
{
    // 程序进入前台
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addAnimation) name:UIApplicationWillEnterForegroundNotification object:[UIApplication sharedApplication]];
}

- (void)addAnimation {
    
    CABasicAnimation* translation = [CABasicAnimation animation];
    translation.keyPath = @"transform.translation";
    translation.toValue = [self anyValue];
    translation.repeatCount = 1;
    translation.duration = self.duration;
    translation.removedOnCompletion = NO;
    translation.fillMode = kCAFillModeForwards;
    translation.delegate = self;
    [self.imageView.layer addAnimation:translation forKey:nil];
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag) {
        [self addAnimation];
    }
}

- (void)setupValues
{
    NSMutableArray* values = [[NSMutableArray alloc] init];
    [values addObject:[NSValue valueWithCGPoint:CGPointMake(0, 0.0)]];
    [values addObject:[NSValue valueWithCGPoint:CGPointMake((scrollViewW - imageViewW), 0.0)]];
    [values addObject:[NSValue valueWithCGPoint:CGPointMake((scrollViewW - imageViewW), (scrollViewH - imageViewH))]];
    [values addObject:[NSValue valueWithCGPoint:CGPointMake(0.0, (scrollViewH - imageViewH))]];
    
    self.values = values;
}

- (NSValue *)anyValue
{
    NSValue* anyValue = self.currentValue;
    while (CGPointEqualToPoint(self.currentValue.CGPointValue, anyValue.CGPointValue)) {
        anyValue = self.values[arc4random_uniform((u_int32_t)self.values.count)];
    }
    self.currentValue = anyValue;
    return anyValue;
}

- (NSValue *)currentValue
{
    if (!_currentValue) {
        _currentValue =[NSValue valueWithCGPoint:CGPointMake(0, 0.0)];
    }
    return _currentValue;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
