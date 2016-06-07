//
//  SinaShowImageView.h
//  SinaApp_MVC
//
//  Created by mac on 16/5/23.
//  Copyright © 2016年 SuperWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SinaShowImageView;

@protocol SinaShowImageViewDelegete <NSObject>

-(void)topShowImage:(SinaShowImageView*)showImageView imageViewTag:(NSInteger)imageTag;

@end


@interface SinaShowImageView : UIView

@property(assign,nonatomic)id delegate;

@property(strong,nonatomic)NSIndexPath *indexPath;

@property(assign,nonatomic)BOOL isRetweeted;

-(void)setImagesWithArray:(NSArray*)picArray;
@end


