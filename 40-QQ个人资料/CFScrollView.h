//
//  CFScrollView.h
//  40-QQ个人资料
//
//  Created by 于 传峰 on 15/7/31.
//  Copyright (c) 2015年 于 传峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CFScrollView : UIView
- (instancetype)initWithFrame:(CGRect)frame backImage:(UIImage *)image;
@property(nonatomic, assign) NSTimeInterval duration;
@end
