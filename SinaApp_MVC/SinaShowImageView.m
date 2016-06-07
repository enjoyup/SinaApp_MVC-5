//
//  SinaShowImageView.m
//  SinaApp_MVC
//
//  Created by mac on 16/5/23.
//  Copyright © 2016年 SuperWang. All rights reserved.
//
#define GAP 10
#define IMG_WIDTH ([[UIScreen mainScreen]bounds].size.width-4*GAP)/3
#define TAG_ADD 100

#import "SinaShowImageView.h"
#import <UIImageView+WebCache.h>
#import "ZYPicUrls.h"
@implementation SinaShowImageView

-(instancetype)initWithFrame:(CGRect)frame
{
    
    self=[super initWithFrame:frame];
    
    if (self) {
        
        for (int i=0; i<9; i++) {
            UIImageView *imageView=[[UIImageView alloc]init];
            
            imageView.backgroundColor=[UIColor blackColor];
            
            [self addSubview:imageView];
            
            imageView.frame=CGRectMake(GAP+(IMG_WIDTH+GAP)*(i%3), GAP+(IMG_WIDTH+GAP)*(i/3), IMG_WIDTH, IMG_WIDTH);
            
            imageView.tag=i+TAG_ADD;
            
            imageView.hidden=YES;
            
            imageView.userInteractionEnabled=YES;
            
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction:)];
            
            [tapGesture setNumberOfTapsRequired:1];
            
            [tapGesture setNumberOfTouchesRequired:1];
            
            [imageView addGestureRecognizer:tapGesture];
        }
    }
    return self;
}
-(void)tapGestureAction:(UITapGestureRecognizer*)gesture
{
    //NSLog(@"===");
    if ([_delegate respondsToSelector:@selector(topShowImage:imageViewTag:)]) {
        
        [_delegate topShowImage:self imageViewTag:gesture.view.tag-TAG_ADD];
        
    }
    
}
-(void)setImagesWithArray:(NSArray*)picArray
{
    for (UIImageView *imageView in self.subviews) {
        
        imageView.hidden=YES;
        
    }
    __block CGFloat maxY=0;
    
    [picArray enumerateObjectsUsingBlock:^(NSObject *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString *urlStr=nil;
        
        if ([obj isKindOfClass:[NSDictionary class]]) {
            
            urlStr=((NSDictionary*)obj)[@"thumbnail_pic"];
            
        }else if ([obj isKindOfClass:[ZYPicUrls class]]){
            
            urlStr=((ZYPicUrls*)obj).thumbnailPic;
            
        }
        
        
        UIImageView *imageView=(UIImageView*)[self viewWithTag:idx+TAG_ADD];
        
        imageView.hidden=NO;
        
        [imageView sd_setImageWithURL:[NSURL URLWithString:urlStr]];
        
        maxY=CGRectGetMaxY(imageView.frame)+GAP;
        
    }];
    CGRect rect=self.frame;
    
    rect.size.height=maxY;
    
    self.frame=rect;
}



@end
