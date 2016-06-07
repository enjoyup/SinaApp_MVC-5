//
//  CollectionViewCell.m
//  SinaApp_MVC
//
//  Created by mac on 16/5/30.
//  Copyright © 2016年 SuperWang. All rights reserved.
//

#import "CollectionViewCell.h"



@implementation CollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView=[[UIImageView alloc]initWithFrame:self.bounds];
        [self addSubview:_imageView];

        _button=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        _button.backgroundColor=[UIColor purpleColor];
        
        _button.tag=self.tag;


        [self addSubview:_button];
        
}
    return self;
}




@end
