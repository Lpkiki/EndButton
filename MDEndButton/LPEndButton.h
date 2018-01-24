//
//  LPEndButton.h
//  CHISLIM
//
//  Created by L on 2017/12/18.
//  Copyright © 2017年 wuhaidong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LPEndButtonDelegate <NSObject>

@optional
//长按完成点击事件
-(void)finishEndButtonAction;

@end



@interface LPEndButton : UIView

@property(nonatomic,strong)UIButton * mainButton;

@property(nonatomic,weak)id <LPEndButtonDelegate> delegate;

@end
