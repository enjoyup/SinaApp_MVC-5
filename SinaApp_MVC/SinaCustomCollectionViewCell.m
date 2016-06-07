//
//  SinaCustomCollectionViewCell.m
//  SinaApp_MVC
//
//  Created by mac on 16/5/24.Ø
//  Copyright © 2016年 SuperWang. All rights reserved.
//

#import "SinaCustomCollectionViewCell.h"

@implementation SinaCustomCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        
        _picImageView=[[UIImageView alloc]initWithFrame:self.contentView.bounds];
       
        _picImageView.contentMode=UIViewContentModeScaleAspectFit;
        _picImageView.backgroundColor=[UIColor orangeColor];
        _picScrollView=[[UIScrollView alloc]initWithFrame:self.contentView.bounds];
       
        [self.contentView addSubview:_picScrollView];
        
        [_picScrollView addSubview:_picImageView];
        _picScrollView.backgroundColor=[UIColor purpleColor];
        _picScrollView.delegate=self;
        
        _picScrollView.minimumZoomScale=0.5;
        
        _picScrollView.maximumZoomScale=10;
        
        _picImageView.userInteractionEnabled=YES;
        
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        
        [_picImageView addGestureRecognizer:tap];
        
        UILongPressGestureRecognizer *longPress=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longAction)];
        
        [_picImageView addGestureRecognizer:longPress];

    }
    return self;
}
-(void)resetFrame
{
    _picImageView.frame=self.contentView.frame;
    _picImageView.contentMode=UIViewContentModeScaleAspectFit;
    [_picScrollView setContentSize:CGSizeZero];
}

-(void)longAction
{
    if (_picImageView.image) {
        
        UIImageWriteToSavedPhotosAlbum(_picImageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    }
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSLog(@"保存成功");
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"My Alert"
                                                                   message:@"This is an alert."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    //[self.window.rootViewController presentViewController:alert animated:YES completion:nil];
}

-(void)tapAction:(UITapGestureRecognizer*)gesture
{
    if ([_delegate respondsToSelector:@selector(collectionViewDidTap)]) {
        [_delegate collectionViewDidTap];
    }
}


-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.picImageView;
}
//缩放过程
-(void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    if (scrollView.contentSize.width<scrollView.frame.size.width) {
        
        self.picImageView.center=scrollView.center;
        
    }else if (scrollView.contentSize.width>scrollView.frame.size.width){
        
        self.picImageView.center=CGPointMake(scrollView.contentSize.width/2, scrollView.contentSize.height/2);
    }
}

@end
