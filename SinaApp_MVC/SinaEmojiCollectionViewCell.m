//
//  SinaEmojiCollectionViewCell.m
//  SinaApp_MVC
//
//  Created by mac on 16/6/1.
//  Copyright © 2016年 SuperWang. All rights reserved.
//

#import "SinaEmojiCollectionViewCell.h"

@implementation SinaEmojiCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        _imageView=[[UIImageView alloc]initWithFrame:self.contentView.frame];
        
        [self.contentView addSubview:_imageView];
        
        _emojiLabel=[[UILabel alloc]initWithFrame:self.contentView.frame];
        _emojiLabel.font=[UIFont systemFontOfSize:36];
        _emojiLabel.textAlignment=NSTextAlignmentCenter;
        [self.contentView addSubview:_emojiLabel];
    }
    return self;
}

@end
