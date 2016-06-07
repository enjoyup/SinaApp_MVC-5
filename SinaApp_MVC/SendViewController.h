//
//  SendViewController.h
//  SinaApp_MVC
//
//  Created by mac on 16/5/25.
//  Copyright © 2016年 SuperWang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SinaTool.h"




@interface SendViewController : UIViewController
{
    SinaTool *_sinaTool;
    UITextView *textView;
    NSData *imaData;
    UIView * whiteView;
    UICollectionView *_collectionView;
    NSMutableArray *arr;
    UICollectionView *_emojiCollectionView;}
@property(nonatomic,strong)NSMutableArray *Array;


@end
