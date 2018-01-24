//
//  LPEndButton.m
//  CHISLIM
//
//  Created by L on 2017/12/18.
//  Copyright © 2017年 wuhaidong. All rights reserved.
//

#define degreesToRadians(x) (M_PI*(x)/180.0)

#define EBRGBColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:b/255.0 alpha:(a)]


#import "LPEndButton.h"

@interface  LPEndButton() <CAAnimationDelegate>

@property(nonatomic,strong)CAShapeLayer *shadowLayer;

@property(nonatomic,strong)CAShapeLayer *mainLayer;

@end

@implementation LPEndButton


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self loadAllLayer];
        [self addSubview:self.mainButton];
    }
    return self;
}


-(void)loadAllLayer{
    
    _shadowLayer = [[CAShapeLayer alloc]init];
    _shadowLayer.lineWidth = self.frame.size.width*0.1;
    _shadowLayer.strokeColor = EBRGBColor(254, 57, 26, 0.4).CGColor;
    _shadowLayer.fillColor = [UIColor clearColor].CGColor;
    _shadowLayer.strokeStart =degreesToRadians(-90);;
    _shadowLayer.strokeEnd =degreesToRadians(270);
    _shadowLayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.width/2) radius:self.frame.size.width/2 startAngle:0 endAngle:0 clockwise:YES].CGPath;
    _mainLayer = [[CAShapeLayer alloc]init];
    _mainLayer.lineWidth = self.frame.size.width*0.1;
    _mainLayer.strokeColor = EBRGBColor(254, 57, 26, 0.4).CGColor;
    _mainLayer.strokeStart =degreesToRadians(-90);
    _mainLayer.strokeEnd =degreesToRadians(-90);
    _mainLayer.fillColor = [UIColor clearColor].CGColor;
    _mainLayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.width/2) radius:self.frame.size.width/2 startAngle:degreesToRadians(-90)endAngle:degreesToRadians(270) clockwise:YES].CGPath;
    [_shadowLayer addSublayer:_mainLayer];
    [self.layer addSublayer:_shadowLayer];
    
}


-(UIButton *)mainButton{
    
    if (nil == _mainButton) {
        
        _mainButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _mainButton.frame =CGRectMake(self.frame.size.width*0.05 + 1 , self.frame.size.width*0.05 + 1, self.frame.size.width*0.9 - 2, self.frame.size.width*0.9 - 2);
        _mainButton.layer.masksToBounds = NO;
        _mainButton.layer.cornerRadius = self.frame.size.width*0.9 / 2 - 1;
        [_mainButton addTarget:self action:@selector(beganAnimation) forControlEvents:UIControlEventTouchDown];
        [_mainButton addTarget:self action:@selector(endAllAnimation) forControlEvents:UIControlEventTouchUpOutside];
        [_mainButton addTarget:self action:@selector(endAllAnimation) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mainButton;
}



-(void)beganAnimation{
    
    [UIView animateKeyframesWithDuration:0.1 delay:0 options:0 animations: ^{
        _mainButton.transform = CGAffineTransformMakeScale(0.98, 0.98);
    } completion:nil];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.delegate  = self;
    animation.fromValue = [NSNumber numberWithFloat:0.0];
    animation.toValue = [NSNumber numberWithFloat:1.0];
    animation.duration = 1;
    animation.repeatCount = 1;
    [_mainLayer addAnimation: animation forKey:@"mainLayer"];
    
}


-(void)endAllAnimation{
    
    [UIView animateKeyframesWithDuration:0.1 delay:0 options:0 animations: ^{
        _mainButton.transform = CGAffineTransformMakeScale(1, 1);
    } completion:nil];
    [_mainLayer removeAllAnimations];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [UIView animateKeyframesWithDuration:0.1 delay:0 options:0 animations: ^{
        _mainButton.transform = CGAffineTransformMakeScale(1, 1);
    } completion:nil];
    if (flag) {
        if (nil != self.delegate && [self.delegate respondsToSelector:@selector(finishEndButtonAction)]) {
            [self.delegate  finishEndButtonAction];
        }
    }
    
}


@end
