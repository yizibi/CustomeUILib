//
//  LXMusicPlayingView.m
//  UICustomeLib
//
//  Created by lucy 李 on 2019/1/28.
//  Copyright © 2019年 liluxin. All rights reserved.
//

#import "LXMusicPlayingView.h"

static NSInteger lineCount = 4;

@interface LXMusicPlayingView()

@property (nonatomic, strong) UIImageView *shadowView;

@end

@implementation LXMusicPlayingView
{
    float _lineWidth;
    UIColor *_lineColor;
    NSMutableArray *_lineArray;
}

-(instancetype)initWithFrame:(CGRect)frame lineWidth:(float)lineWidth lineColor:(UIColor*)lineColor
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _lineWidth = lineWidth;
        _lineColor = lineColor;
        _lineArray = [[NSMutableArray alloc] initWithCapacity:10];
        self.shadowView = [[UIImageView alloc] initWithFrame:frame];
        self.shadowView.image = [UIImage imageNamed:@"Oval 10"];
        self.shadowView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.shadowView];
        
        [self buildLayout];
    }
    return self;
}

-(NSArray*)values
{
    return @[@[@1.0, @0.5, @0.1, @0.4, @0.7, @0.9, @1.0],
             @[@1.0, @0.8, @0.5, @0.1, @0.5, @0.7, @1.0],
             @[@1.0, @0.7, @0.4, @0.4, @0.7, @0.9, @1.0],
             @[@1.0, @0.8, @0.3, @0.2, @0.6, @0.8, @1.0]];
}

-(NSArray*)durations
{
    return @[@(0.9),@(1.0),@(0.9),@(1.0)];
}

-(void)buildLayout
{
    float margin = (40 - 4*_lineWidth)/4;
    float height = 40;
    NSArray* layerHeight = @[@(0.6*height),@(0.8*height),@(0.9*height),@(0.7*height)];
    for (int i = 0; i < lineCount; i++) {
        //初始化layer
        CAShapeLayer *layer = [[CAShapeLayer alloc] init];
        layer.fillColor = [UIColor clearColor].CGColor;
        layer.lineCap = kCALineCapRound;
        layer.strokeColor = _lineColor.CGColor;
        layer.frame = CGRectMake(20, 15, 40, 40);
        layer.lineWidth = _lineWidth;
        [self.shadowView.layer addSublayer:layer];
        
        //设置layer的位置
        CGFloat pillarHeight = [layerHeight[i] floatValue];
        CGFloat x = (i+1)*margin + i*_lineWidth;
        CGPoint startPoint = CGPointMake(x, height);
        CGPoint toPoint = CGPointMake(x, height - pillarHeight);
        UIBezierPath * path = [UIBezierPath bezierPath];
        [path moveToPoint:startPoint];
        [path addLineToPoint:toPoint];
        layer.path = path.CGPath;
        [_lineArray addObject:layer];
    }
    [self addAnimation];
}

-(void)addAnimation
{
    for (int i = 0; i<_lineArray.count; i++) {
        CALayer *layer = [_lineArray objectAtIndex:i];
        //设置动画
        CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
        //        animation.delegate = self;
        animation.values = [self values][i];
        animation.duration = [[self durations][i] floatValue];
        animation.repeatCount = HUGE_VAL;
        animation.removedOnCompletion = false;//必须设为false否则会被销毁掉
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [layer addAnimation:animation forKey:@"ESSEQAnimation"];
    }
    
}

@end
