//
//  SinaEmojiLayout.m
//  SinaApp_MVC
//
//  Created by mac on 16/6/1.
//  Copyright © 2016年 SuperWang. All rights reserved.
//


//自定义layout需要重写3个系统方法
//1,prepareLayout 在这个方法里面,需要计算出每个item的frame
//2,collectViewContextsize ,返回collectionView的可滑动区域
//3,-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect



#import "SinaEmojiLayout.h"

@implementation SinaEmojiLayout


-(void)prepareLayout{
    
    _attributesArr=[[NSMutableArray alloc]init];
    
    CGFloat itemW=(CGRectGetWidth([[UIScreen mainScreen]bounds])-80)/7;
    
    NSInteger sections=self.collectionView.numberOfSections;
    
    for (NSInteger section=0; section<sections; section++) {
        NSInteger rows=[self.collectionView numberOfItemsInSection:section];
        CGFloat gap=10;
        
        CGFloat screenW=CGRectGetWidth([[UIScreen mainScreen]bounds]);
        for (NSInteger row=0; row<rows; row++) {
            
            CGFloat itemX=(itemW+gap)*(row%7)+gap+screenW*(row/21)+_contentWidth;
            CGFloat itemY=(itemW+gap)*((row/7)%3)+gap;
            
            UICollectionViewLayoutAttributes *attribute=[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForRow:row inSection:section]];
            attribute.frame=CGRectMake(itemX, itemY, itemW, itemW);
            [_attributesArr addObject:attribute];
        }
        _contentWidth+=(rows+20)/21*screenW;
        
    }
}
-(CGSize)collectionViewContentSize{
    return CGSizeMake(_contentWidth, self.collectionView.frame.size.height);
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *resArray=[[NSMutableArray alloc]init];
    [_attributesArr enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (CGRectIntersectsRect(rect,obj.frame)) {
            [resArray addObject:obj];
        }
    }];
    return resArray;
}



@end
