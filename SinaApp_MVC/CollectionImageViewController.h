//
//  CollectionImageViewController.h
//  SinaApp_MVC
//
//  Created by mac on 16/5/24.
//  Copyright © 2016年 SuperWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CollectionImageViewControllerDelegate <NSObject>

-(void)tapCollectioonImageWithAnimationView:(UIImageView*)animationView;

-(void)tapCollectioonImageWithAnimationView:(UIImageView *)animationView toFrame:(CGRect)toRect;

@end


@interface CollectionImageViewController : UIViewController
{
    //动画
    UIImageView *_animationImageView;
    UICollectionView *_collectionView;
}
//图片查看数据源
@property(nonatomic,strong)NSArray *picUrls;

@property(nonatomic,assign)NSInteger tag;

@property(nonatomic,strong)NSArray *picFrames;//坐标数组

@property(nonatomic,assign)id delegate;
@end
