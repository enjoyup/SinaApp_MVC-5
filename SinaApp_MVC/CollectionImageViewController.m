//
//  CollectionImageViewController.m
//  SinaApp_MVC
//
//  Created by mac on 16/5/24.
//  Copyright © 2016年 SuperWang. All rights reserved.
//

#import "CollectionImageViewController.h"
#import "SinaCustomCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "ZYPicUrls.h"
#import <MBProgressHUD.h>//进度条
#import <SDWebImageManager.h>//
@interface CollectionImageViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,SinaCustomCollectionViewCellDelegate>

@end

@implementation CollectionImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor blackColor];
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    
    flowLayout.itemSize=[[UIScreen mainScreen]bounds].size;
    
    flowLayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    
    flowLayout.minimumInteritemSpacing=0;//设置同一列中间隔的cell最小间距。
    
    flowLayout.minimumLineSpacing=0;//设置最小行间距
    
    _collectionView=[[UICollectionView alloc]initWithFrame:[[UIScreen mainScreen]bounds] collectionViewLayout:flowLayout];
    
    _collectionView.dataSource=self;
    
    _collectionView.delegate=self;
    
    _collectionView.pagingEnabled=YES;
    
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[SinaCustomCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    //根据tag值改变偏移量
    [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:self.tag inSection:0] atScrollPosition:0 animated:NO];
    
    _collectionView.hidden=YES;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (!_animationImageView) {
        
        _animationImageView=[[UIImageView alloc]init];
        
        [self.view addSubview:_animationImageView];
        
    }
    ZYPicUrls *pic=self.picUrls[self.tag];
    
    [_animationImageView sd_setImageWithURL:[NSURL URLWithString:pic.thumbnailPic]];

    NSValue *beginValue=self.picFrames[self.tag];
    
    CGRect imageRect=beginValue.CGRectValue;
    
    _animationImageView.frame=imageRect;
    
    imageRect=[self imageRectWithImageSize:_animationImageView.image.size];
    
    [UIView animateWithDuration:0.3 animations:^{
        
        _animationImageView.frame=imageRect;
        
        _animationImageView.center=self.view.center;
        
    } completion:^(BOOL finished) {
        
        _animationImageView.hidden=YES;
        
        _collectionView.hidden=NO;
    }];
}

-(CGRect)imageRectWithImageSize:(CGSize)imageSize
{
    //CGSize imageSize=_animationImageView.image.size;
    CGRect imageRect=CGRectZero;
    
    CGFloat imageScale=imageSize.width/imageSize.height;
    
    CGFloat viewScale=CGRectGetWidth(self.view.frame)/CGRectGetHeight(self.view.frame);
    
    if (imageScale>viewScale) {
        
        imageRect.size.width=CGRectGetWidth(self.view.frame);
        
        imageRect.size.height=CGRectGetWidth(self.view.frame)/imageScale;
        
    }else{
        
        imageRect.size.height=CGRectGetHeight(self.view.frame);
        
        imageRect.size.width=CGRectGetHeight(self.view.frame)*imageScale;
        
    }
    return imageRect;
}


#pragma mark--UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.picUrls.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SinaCustomCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    //NSDictionary *dic=self.picUrls[indexPath.row];
    
    ZYPicUrls *pic=self.picUrls[indexPath.row];
    
    cell.delegate=self;
    
    NSString *largeUrl=[pic.thumbnailPic stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"large"];
    
    pic.largePic=largeUrl;
    
    SDImageCache *imageCache=[SDWebImageManager sharedManager].imageCache;
    
    UIImage *thumImage=[imageCache imageFromMemoryCacheForKey:pic.thumbnailPic];
    
    if (!thumImage) {
        
        thumImage=[imageCache imageFromDiskCacheForKey:pic.thumbnailPic];
        
    }
    if (!thumImage) {
        
        thumImage=[UIImage imageNamed:@"默认图片"];
        
    }
    
    UIImage *largeImage=[imageCache imageFromMemoryCacheForKey:largeUrl];
    
    if (!largeImage) {
        
        largeImage=[imageCache imageFromDiskCacheForKey:largeUrl];

    }
    if (!largeImage) {
        
        MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        hud.mode=MBProgressHUDModeDeterminate;//圆形的进度条
        
        //没有就下载
        [cell.picImageView sd_setImageWithURL:[NSURL URLWithString:largeUrl] placeholderImage:thumImage options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            
            hud.progress=(float)receivedSize/(float)expectedSize;
            
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            [hud hide:YES];
            
        }];
    }else{
        
        cell.picImageView.image=largeImage;
    }
    [cell resetFrame];
    //[cell.picImageView sd_setImageWithURL:[NSURL URLWithString:dic[@"thumbnail_pic"]]];
    //[cell.picImageView sd_setImageWithURL:[NSURL URLWithString:pic.thumbnailPic]];
    
    return cell;
}


#pragma mark--UIScrollViewDelegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView//滑动结束,并且减速结束
{
     self.tag = scrollView.contentOffset.x/CGRectGetWidth(self.view.frame);
}


#pragma mark--SinaCustomCollectionViewCellDelegate
-(void)collectionViewDidTap
{
    
    
    ZYPicUrls *pic=self.picUrls[self.tag];
    
    [_animationImageView sd_setImageWithURL:[NSURL URLWithString:pic.thumbnailPic]];
    
    _animationImageView.frame=[self imageRectWithImageSize:_animationImageView.image.size];
    
    _animationImageView.center=self.view.center;
    
    if ([_delegate respondsToSelector:@selector(tapCollectioonImageWithAnimationView:)]) {
        
        [_delegate tapCollectioonImageWithAnimationView:_animationImageView];
    }
    
    _animationImageView.hidden=NO;
    
    [self dismissViewControllerAnimated:NO completion:^{
        
        if ([_delegate respondsToSelector:@selector(tapCollectioonImageWithAnimationView:toFrame:)]) {
            
            NSValue *rectValue=self.picFrames[self.tag];
            
            [_delegate tapCollectioonImageWithAnimationView:_animationImageView toFrame:rectValue.CGRectValue];
        }
    }];

}
@end
