//
//  ViewController.m
//  EndButton
//
//  Created by Lpkiki on 2018/1/24.
//  Copyright © 2018年 kiki. All rights reserved.
//

#import "ViewController.h"
#import "LPEndButton.h"




@interface ViewController ()<LPEndButtonDelegate>
/** redBtn  结束 */
@property (nonatomic,strong) LPEndButton *redBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.view addSubview:self.redBtn];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//长按完成点击事件
-(void)finishEndButtonAction {
    NSLog(@"--------");
}

- (LPEndButton  *)redBtn {
    if (!_redBtn) {
        _redBtn = [[LPEndButton alloc]initWithFrame:CGRectMake(100, 100, 91, 91)];
        _redBtn.delegate =  self;
        _redBtn.mainButton.backgroundColor  = [UIColor redColor];
        [_redBtn.mainButton setTitle:@"结束" forState:UIControlStateNormal];
        [_redBtn.mainButton setTitle:@"结束" forState:UIControlStateHighlighted];
        [_redBtn.mainButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_redBtn.mainButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        _redBtn.mainButton.titleLabel.font = [UIFont systemFontOfSize:17];
    }
    return _redBtn;
}

@end
