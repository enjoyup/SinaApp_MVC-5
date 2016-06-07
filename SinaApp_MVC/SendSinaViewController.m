//
//  SendSinaViewController.m
//  SinaApp_MVC
//
//  Created by mac on 16/5/25.
//  Copyright © 2016年 SuperWang. All rights reserved.
//
#define TAG_ADD 100
#define WIDTH 2*[[UIScreen mainScreen]bounds].size.width
#import "SendSinaViewController.h"
#import "SendViewController.h"
#import "AppDelegate.h"

@interface EffectButton : UIButton

@property(nonatomic,assign)CGPoint startPoint;
@property(nonatomic,assign)CGPoint endPoint;
@property(nonatomic,assign)CGPoint farPoint;
@property(nonatomic,assign)BOOL number;

@end

@implementation EffectButton

@end


@interface SendSinaViewController ()
{
    NSInteger _flag; //按钮的当前索引
    NSTimer *_timer;
    NSInteger _currentFlag;
    NSMutableArray * Array;
    
    
}
@end

@implementation SendSinaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    Array=[[NSMutableArray alloc]init];
    [self effEct];
    [self showEffectButton];
    
    //---分享新鲜事图片
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 200, 70)];
    imageView.image=[UIImage imageNamed:@"Default_splashscreen_slogan@2x"];
    [self.view addSubview:imageView];
    
    
    //---下方添加的白色View
    UIView * whiteView=[[UIView alloc]init];
    whiteView.frame=CGRectMake(0, self.view.frame.size.height-44, self.view.frame.size.width, self.view.frame.size.height-44);
    whiteView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:whiteView];
    
    
    //---X图片按钮
    UIButton *centerButton=[[UIButton alloc]init];
    centerButton.frame=CGRectMake(whiteView.center.x-20, 0, 44, 44);
    [centerButton setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_close@2x"] forState:UIControlStateNormal];
    [centerButton addTarget:self action:@selector(remove) forControlEvents:UIControlEventTouchUpInside];
    [whiteView addSubview:centerButton];
    
    
    //--X图片按钮旋转45度动画
    CABasicAnimation *baseAn = [CABasicAnimation animationWithKeyPath:@"transform"];
    baseAn.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_4, 0, 0, 1)];
    baseAn.duration = 0.3;
    baseAn.removedOnCompletion = NO;
    baseAn.fillMode = kCAFillModeForwards;
    [centerButton.layer addAnimation:baseAn forKey:@"baseAn"];
    
   
    //-----轻扫手势
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeGestureAction)];
    swipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:swipeGesture];

    //-----点击手势
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureAction)];
    //需要的手指数量
    tapGesture.numberOfTouchesRequired = 1;
    //需要的点击次数
    tapGesture.numberOfTapsRequired = 1;
    //将手势添加到需要识别的视图上面
    [self.view addGestureRecognizer:tapGesture];

    
    
    
}

//=====点击后退按钮执行的方法
-(void)click
{
    
    for (EffectButton *button in Array) {
        
        CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform"];
        animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0, 0, 0)];
        animation.duration = 0.3;
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        [button.layer addAnimation:animation forKey:@"asnima"];
        
    }

}


///=====清扫手势 动画
-(void)swipeGestureAction
{
    NSLog(@"=========");
    
    for (EffectButton *button in Array) {
        
        CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform"];
        animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0, 0, 0)];
        animation.duration = 0.3;
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        [button.layer addAnimation:animation forKey:@"asnima"];
        
    }
    
}

//====view展示出来后做的动画是显示还是隐藏
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self isShow:YES];
}

//====毛玻璃展示
-(void)effEct
{
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    
    UIVisualEffectView * effectView = [[UIVisualEffectView alloc]initWithEffect:blurEffect];
    effectView.frame = self.view.frame;
    
    [self.view addSubview:effectView];
    
}

//=====对12个按钮初始位置的设定
-(void)showEffectButton
{
    NSArray *buttonArray=[NSArray arrayWithObjects:@"tabbar_compose_idea@2x",@"tabbar_compose_photo@2x",@"tabbar_compose_headlines@2x",@"tabbar_compose_friend@2x",@"tabbar_compose_camera@2x",@"tabbar_compose_music@2x",@"tabbar_compose_lbs@2x",@"tabbar_compose_review@2x",@"tabbar_compose_more@2x",@"tabbar_compose_envelope@2x",@"tabbar_compose_productrelease@2x",@"tabbar_compose_shooting@2x", nil];
    NSArray *labelArray=[NSArray arrayWithObjects:@"文字",@"照片/视频",@"头条文章",@"好友圈",@"微博相机",@"音乐",@"签到",@"点评",@"更多",@"红包",@"商品",@"秒拍", nil];
    
    CGFloat buttonWidth=81;
    CGFloat gap = WIDTH/7;
    
    for (int i=0; i<12; i++) {
        
        EffectButton *button=[EffectButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:buttonArray[i]] forState:UIControlStateNormal];
        
        [button setTitle:labelArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(toController:) forControlEvents:UIControlEventTouchUpInside];
        button.tag=i+TAG_ADD;
        [self.view addSubview:button];
        
        [Array addObject:button];
        
        [button setTitleEdgeInsets:UIEdgeInsetsMake(81, -81, -20, 0)];
        button.bounds=CGRectMake(0, 0, buttonWidth, buttonWidth);
        
        CGFloat ViewCenterH=CGRectGetHeight(self.view.frame)/2;
        CGFloat buttonOffSetY=(i/6==0)?(ViewCenterH-buttonWidth):(ViewCenterH+buttonWidth);
        
        button.startPoint=CGPointMake((i%6+1)*gap, CGRectGetHeight(self.view.frame)+buttonWidth);
        button.farPoint=CGPointMake((i%6+1)*gap,buttonOffSetY-30);
        button.endPoint=CGPointMake((i%6+1)*gap,buttonOffSetY);
        

        button.center=button.startPoint;
    }
    
    
}

//=====点击12按钮执行的方法,平移效果
-(void)toController:(EffectButton*)sender
{
    _currentFlag=sender.tag;
    if (_currentFlag==108){
    
        for (EffectButton *button in Array){
         
            CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform"];
            animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(-400, 0, 0)];
            animation.duration = 0.3;
            animation.removedOnCompletion = NO;
            animation.fillMode = kCAFillModeForwards;
            [button.layer addAnimation:animation forKey:@"animation"];
            
        }
        
    }else{
       
        for (EffectButton *btn in Array) {
            
            if (_currentFlag ==btn.tag) {
                
                [self largeButton:btn];
            }
            else{
                [self smallWithButton:btn];
            }
        }
        
    }
  
}


-(void)isShow:(BOOL)isShow
{
    _flag=isShow?0:11;//根据是否显示,判断flag的初始值
    
    SEL select=isShow?@selector(show):@selector(hide);//根据是否显示,判断调用动画的方法
    
    if (!_timer) {
       _timer= [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:select userInfo:nil repeats:YES];
    }
}

//=====button从View外动画显示到View上
-(void)show
{
    if (_flag==11) {
        [_timer invalidate];
        _timer=nil;
    }
    EffectButton *button=[self.view viewWithTag:_flag+TAG_ADD ];
    CAKeyframeAnimation *key=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    key.removedOnCompletion=NO;
    key.duration=0.5;
    key.fillMode=kCAFillModeForwards;
    
    CGMutablePathRef path=CGPathCreateMutable();
    
   
        
    CGPathMoveToPoint(path, NULL, button.startPoint.x, button.startPoint.y);
    CGPathAddLineToPoint(path, NULL, button.farPoint.x, button.farPoint.y);
    CGPathAddLineToPoint(path, NULL, button.endPoint.x, button.endPoint.y);
    
    key.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    
    key.path=path;
    [button.layer addAnimation:key forKey:@"key"];
    button.center=button.endPoint;
    _flag++;
}

//=====button从View上动画移动到View外
-(void)hide
{
    if (_flag==0) {
        [_timer invalidate];
        _timer=nil;
    }
    EffectButton *button=[self.view viewWithTag:_flag+TAG_ADD ];
    CAKeyframeAnimation *keyF=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    keyF.removedOnCompletion=NO;
    keyF.duration=0.5;
    keyF.fillMode=kCAFillModeForwards;
    
    CGMutablePathRef path=CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, button.endPoint.x, button.endPoint.y);
    CGPathAddLineToPoint(path, NULL, button.startPoint.x, button.startPoint.y);
    
    keyF.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    
    keyF.path=path;
    [button.layer addAnimation:keyF forKey:@"keyF"];
    button.center=button.endPoint;
    _flag--;

}

//=====按钮放大效果
-(void)largeButton:(EffectButton*)button
{
    CABasicAnimation *base=[CABasicAnimation animationWithKeyPath:@"transform"];
    base.toValue=[NSValue valueWithCATransform3D:CATransform3DMakeScale(2, 2, 1)];
    CABasicAnimation *opacity =[CABasicAnimation animationWithKeyPath:@"opacity"];
    opacity.toValue=@(0);
    CAAnimationGroup *group=[CAAnimationGroup animation];
    group.removedOnCompletion=NO;
    group.fillMode = kCAFillModeForwards;
    group.duration = 0.3;
    group.animations = @[base,opacity];
    group.delegate = self;
    [button.layer addAnimation:group forKey:@"large"];
    
}

//=====按钮缩小效果
-(void)smallWithButton:(EffectButton*)button
{
    CABasicAnimation *base = [CABasicAnimation animationWithKeyPath:@"transform"];
    base.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0, 0, 1)];
    base.removedOnCompletion = NO;
    base.fillMode = kCAFillModeForwards;
    base.duration = 0.3;
    [button.layer addAnimation:base forKey:@"small"];

}


//=====点击按钮模态到发送微博界面
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    EffectButton *btn = [self.view viewWithTag:_currentFlag];
    
    CAAnimation *an =
    [btn.layer animationForKey:@"large"];
    if (an == anim) {
        if (btn.tag==100) {
            [self dismissViewControllerAnimated:NO completion:^{
                SendViewController *sendCtr = [[SendViewController alloc]init];
                AppDelegate *delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
                UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:sendCtr];
                [delegate.window.rootViewController presentViewController:nav animated:YES completion:nil];
            }];

       }
        
    }

}


//=====点击手势 动画
-(void)tapGestureAction
{
    [self isShow:NO];
    [self performSelector:@selector(dismissViewControllerAnimated:completion:) withObject:nil afterDelay:0.5];
    
}

//======X图片按钮的点击方法
-(void)remove
{
    [self isShow:NO];
    [self performSelector:@selector(dismissViewControllerAnimated:completion:) withObject:nil afterDelay:0.5];

}




@end
