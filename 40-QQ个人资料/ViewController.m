//
//  ViewController.m
//  40-QQ个人资料
//
//  Created by 于 传峰 on 15/7/29.
//  Copyright (c) 2015年 于 传峰. All rights reserved.
//

#import "ViewController.h"
#import "CFScrollView.h"

//#define scrollViewW self.scrollView.bounds.size.width
//#define scrollViewH self.scrollView.bounds.size.height
//#define imageViewW  self.jayView.bounds.size.width
//#define imageViewH  self.jayView.bounds.size.height


@interface ViewController ()<UIScrollViewDelegate, UICollisionBehaviorDelegate>
//@property(nonatomic, weak) UIScrollView* scrollView;
//@property(nonatomic, strong) UIDynamicAnimator* theAnimator;
//@property(nonatomic, weak) UIImageView* jayView;
//@property(nonatomic, strong) NSMutableArray* values;
//@property(nonatomic, weak) NSValue* currentValue;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor grayColor];
    
    CGRect frame = self.view.bounds;
    frame.size.height = frame.size.height * 0.5;
    CFScrollView* scrollView = [[CFScrollView alloc] initWithFrame:frame backImage:[UIImage imageNamed:@"jay"]];
    scrollView.duration = 5;
    [self.view addSubview:scrollView];

//    UIScrollView* scrollView = [[UIScrollView alloc] init];
//    [self.view addSubview:scrollView];
//    self.scrollView = scrollView;
//    CGRect frame = self.view.bounds;
//    frame.size.height = frame.size.height * 0.5;
//    scrollView.frame = frame;
//    
//    scrollView.backgroundColor = [UIColor grayColor];
//    scrollView.delegate = self;
//    
//    UIImageView* jayImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jay"]];
//    [scrollView addSubview:jayImageView];
//    self.jayView = jayImageView;
//    jayImageView.frame = (CGRect){ 0, 0, jayImageView.bounds.size};
//    
//    scrollView.contentSize = jayImageView.bounds.size;
//
//    [self setupValues];
//    [self addDynamicBehaviour];
}

/*
- (void)addDynamicBehaviour {
    
    CABasicAnimation* translation = [CABasicAnimation animation];
    translation.keyPath = @"transform.translation";
    NSValue* value = [self anyValue];
    translation.toValue = value;
    translation.repeatCount = 1;
    translation.duration = 5;
    translation.removedOnCompletion = NO;
    translation.fillMode = kCAFillModeForwards;
    translation.delegate = self;
    [self.jayView.layer addAnimation:translation forKey:nil];

}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag) {
        [self addDynamicBehaviour];
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
    while (anyValue == self.currentValue) {
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
 */
@end
