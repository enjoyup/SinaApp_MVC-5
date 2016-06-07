//
//  SinaCustomCollectionViewCell.h
//  SinaApp_MVC
//
//  Created by mac on 16/5/24.
//  Copyright © 2016年 SuperWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SinaCustomCollectionViewCell;

@protocol SinaCustomCollectionViewCellDelegate <NSObject>

-(void)collectionViewDidTap;

@end

@interface SinaCustomCollectionViewCell : UICollectionViewCell<UIScrollViewDelegate>

@property(nonatomic,strong)UIImageView *picImageView;

@property(nonatomic,strong)UIScrollView *picScrollView;

@property(nonatomic,assign)id delegate;

-(void)resetFrame;
@end
