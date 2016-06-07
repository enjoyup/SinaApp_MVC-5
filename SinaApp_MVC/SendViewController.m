//
//  SendViewController.m
//  SinaApp_MVC
//
//  Created by mac on 16/5/25.
//  Copyright © 2016年 SuperWang. All rights reserved.
//
#define IMAGE_WIDTH ([[UIScreen mainScreen]bounds].size.width)/4
#define BUTTON_WIDTH ([[UIScreen mainScreen]bounds].size.width)/5

#import "SendViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "ZLPhotoActionSheet.h"
#import "CollectionViewCell.h"
#import <objc/runtime.h>
#import "SinaEmojiCollectionViewCell.h"
#import "SinaEmojiLayout.h"
#import "SinaEmoticonManager.h"
#import "SinaEmoticonPackage.h"


@interface NSTextAttachment (emoji)
@property(nonatomic,copy)NSString *chs;

@end

@implementation NSTextAttachment(emoji)

-(void)setChs:(NSString *)chs
{
    objc_setAssociatedObject(self, @"CHS", chs, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(NSString *)chs
{
    return objc_getAssociatedObject(self, @"CHS");
}
@end




@interface SendViewController ()<SinaToolDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation SendViewController

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [textView becomeFirstResponder];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
   
    whiteView=[[UIView alloc]init];
    whiteView.frame=CGRectMake(0, self.view.frame.size.height-44, self.view.frame.size.width, 44);
    whiteView.backgroundColor=[UIColor cyanColor];
    whiteView.backgroundColor=[UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1];
    [self.view addSubview:whiteView];
    
    
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cacleAction)];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"发送" style:UIBarButtonItemStylePlain target:self action:@selector(sendAction)];
    
    textView=[[UITextView alloc]init];
    textView.frame=CGRectMake(10, 64, self.view.frame.size.width-20, 100);
    textView.text=@"分享新鲜事...";
    textView.font=[UIFont systemFontOfSize:17];
    textView.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:textView];
    

    _sinaTool=[[SinaTool alloc]init];
    _sinaTool.delegate=self;
    
    for (int i=0; i<5; i++) {
        UIButton *fiveButton=[[UIButton alloc]init];
        fiveButton.frame=CGRectMake(BUTTON_WIDTH*(i%5), 0, BUTTON_WIDTH, 40);
        [fiveButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d",i]] forState:UIControlStateNormal];
        fiveButton.tag = i;
        [fiveButton addTarget:self action:@selector(imageButton:) forControlEvents:UIControlEventTouchUpInside];
        [fiveButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [whiteView addSubview:fiveButton];
    }
        
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(changeTextFieldFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    UICollectionViewFlowLayout *flow=[[UICollectionViewFlowLayout alloc]init];
    flow.minimumInteritemSpacing=10;
    flow.minimumLineSpacing=10;
    flow.sectionInset=UIEdgeInsetsMake(20, 10, 10, 10);
    flow.scrollDirection=UICollectionViewScrollDirectionVertical;
    flow.itemSize=CGSizeMake(80, 80);
    
    _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 300) collectionViewLayout:flow];
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    _collectionView.hidden=YES;
    _collectionView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    
    UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handlelongGesture:)];
    [_collectionView addGestureRecognizer:longGesture];
}


- (void)changeTextFieldFrame:(NSNotification *)notifi
{
    //NSLog(@"----%@",notifi.userInfo);
    NSDictionary *dict = notifi.userInfo;
    float time = [[dict objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGRect endRect = [[dict objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    [UIView animateWithDuration:time animations:^{
        
        [UIView setAnimationCurve:7];
        
        CGRect rect = whiteView.frame;
        rect.origin.y = endRect.origin.y - whiteView.bounds.size.height;
        whiteView.frame = rect;
    }];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    //注销第一响应
    /*if ([textView canResignFirstResponder]) {
        
        [textView resignFirstResponder];
    }*/
    //[[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    //[self.view.window endEditing:YES];
}


-(void)imageButton:(UIButton*)sender
{
    switch (sender.tag) {
        case 0:
        {
            ZLPhotoActionSheet *actionSheet = [[ZLPhotoActionSheet alloc] init];
            //设置最大选择数量
            actionSheet.maxSelectCount = 9;
            //设置预览图最大数目
            actionSheet.maxPreviewCount = 10;
            [actionSheet showWithSender:self animate:YES completion:^(NSArray<UIImage *> * _Nonnull selectPhotos) {
                
                if (self.Array==nil) {
                    self.Array=(NSMutableArray*)selectPhotos;
                    [_collectionView reloadData];
                }else if(self.Array!=nil){
                    [self.Array addObjectsFromArray:selectPhotos];
                    [_collectionView reloadData];
                }
                else if(arr!=nil) {
                    
                    [arr addObjectsFromArray:selectPhotos];
                    [_collectionView reloadData];
                }
                _collectionView.hidden=NO;
            }];
            break;
        }
        case 1:{
            break;
        }
        case 2:{
            break;
        }
        case 3:{
            NSString *imgName = nil;
            NSString *imgNameH = nil;
            if (textView.inputView) {
                //表情+键盘
                
                [self emojiKeyBoardIsHide:YES];
                imgName = @"3g";
                imgNameH = @"3h";
            }else{
                [self emojiKeyBoardIsHide:NO];
                imgName = @"3";
                imgNameH = @"3H";
            }
            
            [sender setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
            [sender setImage:[UIImage imageNamed:imgNameH] forState:UIControlStateHighlighted];
            //[self emojiKeyBoardIsHide:NO];

            break;
        }
        case 4:{
            break;
        }
        default:
            break;
    }
}

#pragma mark---点击发送按钮的方法
-(void)sendAction
{
    [_sinaTool sendHomeTimeLineWithToken:[_sinaTool getToken] withText:textView.text withImage:imaData];
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"发送成功");
}

#pragma mark---点击取消的方法
-(void)cacleAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark---UICollectionViewDataSource协议方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section//cell的数量
{
    if ([collectionView isEqual:_collectionView]) {
        if (self.Array.count<9) {
            return self.Array.count+1;
        }
        
        //return self.Array.count;
    }else if ([collectionView isEqual:_emojiCollectionView]){
        SinaEmoticonPackage *package=[SinaEmoticonManager shareManager].emoticonPackages[section];
        return package.emoticons.count;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if ([collectionView isEqual:_collectionView]) {
        return 1;
    }else if ([collectionView isEqual:_emojiCollectionView]){
        return [SinaEmoticonManager shareManager].emoticonPackages.count;
    }
    return 0;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([collectionView isEqual:_collectionView]) {
        CollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        
        
        if (self.Array!=nil) {
            
            cell.imageView.image=self.Array[indexPath.item];
            cell.backgroundColor=[UIColor yellowColor];
            NSLog(@"***%@",cell.subviews);
            //cell.addImageView.image=[UIImage imageNamed:@"compose_pic_add@2x"];
            
        }
        else if (arr!=nil) {
            cell.imageView.image=arr[indexPath.item];
        }
        
        imaData=UIImageJPEGRepresentation(cell.imageView.image, 0.5);
        cell.button.tag=indexPath.row;
        [cell.button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        return cell;

    }else if ([collectionView isEqual:_emojiCollectionView]){
        SinaEmojiCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
        
        SinaEmoticonPackage *package = [SinaEmoticonManager shareManager].emoticonPackages[indexPath.section];
        
        SinaEmoticon *emoticon = package.emoticons[indexPath.item];
        
        //1,现将cell状态置空
        cell.imageView.hidden = YES;
        cell.emojiLabel.hidden = YES;
        
        if (emoticon.type.integerValue == KEmoticonImageType ) {
            
            NSString *pngPath =[[[SinaEmoticonManager shareManager].bundlePath stringByAppendingPathComponent:package.packageId]stringByAppendingPathComponent:emoticon.png];
            
            cell.imageView.hidden = NO;
            cell.imageView.image = [UIImage imageWithContentsOfFile:pngPath];
            
        }else if (emoticon.type.integerValue == KEmoticonEmojiType){
            
            cell.emojiLabel.hidden = NO;
            cell.emojiLabel.text = emoticon.emoji;
            
        }else if (emoticon.type.integerValue == KEmoticonDeleteType){
            cell.imageView.hidden = NO;
            cell.imageView.image =[UIImage imageNamed:emoticon.png] ;
            
        }else if (emoticon.type.integerValue == KEmoticonOtherType){
            
        }
        return cell;

    }
    return nil;
}
-(void)buttonAction
{
    NSLog(@"button====");
}


#pragma mark---删除按钮方法
-(void)click:(UIButton*)sender
{
    [self.Array removeObjectAtIndex:sender.tag];
    [_collectionView reloadData];
    if (self.Array!=nil) {
        arr=self.Array;
    }
   
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([collectionView isEqual:_collectionView]) {
        NSLog(@"=========");
    }
    else if ([collectionView isEqual:_emojiCollectionView]){
        SinaEmoticonPackage *package = [SinaEmoticonManager shareManager].emoticonPackages[indexPath.section];
        
        NSLog(@"===%ld",(unsigned long)indexPath.item);
        SinaEmoticon *emoticon = package.emoticons[indexPath.row];
        
        switch (emoticon.type.integerValue) {
            case KEmoticonEmojiType:{
                //添加文字
                //表情的富文本
                NSAttributedString *emojiStr = [[NSAttributedString alloc]initWithString:emoticon.emoji];
                //获得当前文字的富文本
                NSMutableAttributedString *mAtStr = [[NSMutableAttributedString alloc]initWithAttributedString:textView.attributedText];
                
                NSRange range = textView.selectedRange;
                
                [mAtStr replaceCharactersInRange:range withAttributedString:emojiStr];
                
                textView.attributedText = mAtStr;
                
                textView.selectedRange = NSMakeRange(range.location+emoticon.emoji.length, 0);
                break;
            }
            case KEmoticonImageType:{
                //添加图片
                //创建一个附件代图片
                NSTextAttachment *attachment = [[NSTextAttachment alloc]init];
                
                NSString *pngPath =
                [[[SinaEmoticonManager shareManager].bundlePath stringByAppendingPathComponent:package.packageId] stringByAppendingPathComponent:emoticon.png];
                
                //给附件添加图片
                attachment.image = [UIImage imageWithContentsOfFile:pngPath];
                //设置大小
                attachment.bounds = CGRectMake(0, 0, 20, 20);
                //根据附件创建富文本
                NSAttributedString *atStr = [NSAttributedString attributedStringWithAttachment:attachment];
                //获得当前文字的富文本
                NSMutableAttributedString *mAtStr = [[NSMutableAttributedString alloc]initWithAttributedString:textView.attributedText];
                
                //获得光标的位置
                NSRange range = textView.selectedRange;
                //替换
                [mAtStr replaceCharactersInRange:range withAttributedString:atStr];
                
                //更新当前的展示内容
                textView.attributedText = mAtStr;
                //更新光标的位置
                //光标的location是光标的位置
                //光标的length是选中文字的长度
                textView.selectedRange = NSMakeRange(range.location+1, 0);
                break;
            }
            case KEmoticonDeleteType:{
                //删除操作
                [textView deleteBackward];
                break;
            }
            case KEmoticonOtherType:{
                //空的
                break;
            }
            default:
                break;
        }
    }
}



#pragma mark--------长按图片移动的方法
- (void)handlelongGesture:(UILongPressGestureRecognizer *)longGesture {
    //判断手势状态
    switch (longGesture.state) {
        case UIGestureRecognizerStateBegan:{
            //判断手势落点位置是否在路径上
            NSIndexPath *indexPath = [_collectionView indexPathForItemAtPoint:[longGesture locationInView:_collectionView]];
            if (indexPath == nil) {
                break;
            }
            //在路径上则开始移动该路径上的cell
            [_collectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
        }
            break;
        case UIGestureRecognizerStateChanged:
            //移动过程当中随时更新cell位置
            [_collectionView updateInteractiveMovementTargetPosition:[longGesture locationInView:_collectionView]];
            break;
        case UIGestureRecognizerStateEnded:
            //移动结束后关闭cell移动
            [_collectionView endInteractiveMovement];
            break;
        default:
            [_collectionView cancelInteractiveMovement];
            break;
    }
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([collectionView isEqual:_collectionView]) {
        //返回YES允许其item移动
        return YES;
    }else if ([collectionView isEqual:_emojiCollectionView]){
        return NO;
    }
    return 0;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath {
    if ([collectionView isEqual:_collectionView]) {
        //取出源item数据
        id objc = [self.Array objectAtIndex:sourceIndexPath.item];
        //从资源数组中移除该数据
        [self.Array removeObject:objc];
        //将数据插入到资源数组中的目标位置上
        [self.Array insertObject:objc atIndex:destinationIndexPath.item];
    }else if ([collectionView isEqual:_emojiCollectionView]){
        NSLog(@"^^^^^^^^^");
    }
}


-(void)emojiKeyBoardIsHide:(BOOL)hide
{
    if (!_emojiCollectionView) {
        SinaEmojiLayout *emojiLayout=[[SinaEmojiLayout alloc]init];
        
        _emojiCollectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 200) collectionViewLayout:emojiLayout];
        _emojiCollectionView.backgroundColor=[UIColor blueColor];
        _emojiCollectionView.delegate=self;
        _emojiCollectionView.dataSource=self;
        _emojiCollectionView.pagingEnabled=YES;
        _emojiCollectionView.backgroundColor=[UIColor orangeColor];
        [_emojiCollectionView registerClass:[SinaEmojiCollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
    }
    [textView resignFirstResponder];
    
    if (!hide) {
        textView.inputView=_emojiCollectionView;
    }else{
        textView.inputView=nil;
    }
    [textView becomeFirstResponder];
}




@end





