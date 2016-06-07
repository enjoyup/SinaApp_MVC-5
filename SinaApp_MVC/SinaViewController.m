//
//  SinaViewController.m
//  SinaApp_MVC
//
//  Created by SuperWang on 16/5/18.
//  Copyright © 2016年 SuperWang. All rights reserved.
//
#define GAP 10
#define IMG_WIDTH ([[UIScreen mainScreen]bounds].size.width-4*GAP)/3
#define TAG_ADD 100
#import "SinaViewController.h"
#import "SinaLoginView.h"
#import "SinaTool.h"
#import "DataModels.h"
#import "UIButton+WebCache.h"
#import "NSString+Addtion.h"
#import "SinaCustomTableViewCell.h"
#import "MJRefresh.h"
#import "MBProgressHUD.h"
#import "CollectionImageViewController.h"

@interface SinaViewController ()<SinaLoginViewDelegate,SinaToolDelegate,UITableViewDelegate,UITableViewDataSource>
{
    SinaTool *_sinaTool;
    UITableView *_myTableView;
    
    SinaCustomTableViewCell *_sinaCell;
  
}
@property(strong,nonatomic)NSArray *homeLineArray;
@property(strong,nonatomic)NSMutableArray *textHightArray;
@property(strong,nonatomic)NSMutableArray *imageButtonArray;
@end

@implementation SinaViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"微博用户";
    
    
    _myTableView = [[UITableView alloc]init];
    _myTableView.frame = self.view.frame;
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    [self.view addSubview:_myTableView];
    
    [_myTableView registerClass:[SinaCustomTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    //1,先判断是否登录
    _sinaTool = [[SinaTool alloc]init];
    _sinaTool.delegate = self;
    
    
    
    //已经登录,并且token没过期
    if ([_sinaTool isLogin]&&[_sinaTool isValid]){

        _myTableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            //请求homeline,请求新浪api
            [_sinaTool getHomeTimeLineWithToken:[_sinaTool getToken]];
            
        }];

        
     }else{
         
        self.tabBarController.tabBar.hidden = YES;
        //登录
        SinaLoginView *loginView = [[SinaLoginView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
        //设置代理
        loginView.delegate = self;
        
        [self.view addSubview:loginView];
        
        //开始授权
        [loginView startOauthRequest:[_sinaTool oauthRequest]];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//计算cell高度
-(CGFloat)cellHeightWithTextHeigth:(NSNumber*)textH
{
    if (!_sinaCell) {
        _sinaCell = [[SinaCustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell"];
    }
    
    return [_sinaCell getCellHeightWithTextHeight:textH ];
}

#pragma mark - UITableViewDataSource
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"%@-%ld",NSStringFromSelector(_cmd),(long)indexPath.row);
    
    //cell 当前的高度 = cellSubView maxY
    ZYStatuses *model=self.homeLineArray[indexPath.row];
    return [self cellHeightWithTextHeigth:@(model.textHeight+model.imageHeight+model.retTextHeight+model.retImageHeight)];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.homeLineArray.count;
}

//---UITableViewCellDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
   SinaCustomTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    ZYStatuses *statuesesModel = self.homeLineArray[indexPath.row];
    
    [cell.headImgButton sd_setBackgroundImageWithURL:[NSURL URLWithString:statuesesModel.user.profileImageUrl] forState:UIControlStateNormal];
    cell.titleLabel.text = statuesesModel.user.name;
    
   
    
    //使用类别中封装的截取方法,进行截取
    cell.sourceLabel.text = [NSString stringWithFormat:@"%@ 来自%@",[statuesesModel.createdAt timeString],[statuesesModel.source sinaSourceString]];
    
    
    cell.contentLabel.attributedText = [statuesesModel.text sinaString];
    
    //修改contentLabel的高度
    CGRect contentRect = cell.contentLabel.frame;
    contentRect.size.height = statuesesModel.textHeight;
    cell.contentLabel.frame = contentRect;
    
    CGRect showImageRect =cell.showImagesView.frame;
    showImageRect.origin.y=CGRectGetMaxY(cell.contentLabel.frame);
    cell.showImagesView.frame=showImageRect;
    
   [cell.showImagesView setImagesWithArray:statuesesModel.picUrls];
    
    cell.showImagesView.delegate=self;
    cell.showImagesView.indexPath=indexPath;
    cell.retweetedView.hidden=YES;
    cell.retweetedView.retContentLable.text=nil;
    [cell.retweetedView.retShowImageView setImagesWithArray:nil];
    
    cell.retweetedView.retShowImageView.delegate=self;
    cell.retweetedView.retShowImageView.indexPath=indexPath;
    if (statuesesModel.retweetedStatus) {
        cell.retweetedView.hidden=NO;
        cell.retweetedView.retContentLable.attributedText=[statuesesModel.retweetedStatus.text sinaString];
        
        
        [cell.retweetedView.retShowImageView setImagesWithArray:statuesesModel.retweetedStatus.picUrls];
        
        
        
        CGRect rect=cell.retweetedView.retContentLable.frame;
        rect.size.height=statuesesModel.retTextHeight;
        cell.retweetedView.retContentLable.frame=rect;
        
        CGRect rect1=cell.retweetedView.retShowImageView.frame;
        rect1.size.height=statuesesModel.retImageHeight;
        rect1.origin.y=CGRectGetMaxY(rect);
        cell.retweetedView.retShowImageView.frame=rect1;
        
        CGRect rect2=cell.retweetedView.frame;
        rect2.origin.y=CGRectGetMaxY(cell.showImagesView.frame);
        rect2.size.height=CGRectGetMaxY(rect1);
        cell.retweetedView.frame=rect2;
        
    }
    
    return cell;
}



#pragma mark - SinaLoginViewDelegate
//获得codeStirng
-(void)loginView:(SinaLoginView*)loginView didGetCodeString:(NSString*)codeString
{
    //获得code之后,移除loginView
    [loginView removeFromSuperview];
    self.tabBarController.tabBar.hidden = NO;
    //获取授权
    [_sinaTool getAccessTokenWithCode:codeString];
    
}

//获得请求Error
-(void)loginView:(SinaLoginView*)loginView didFailWithError:(NSError*)error
{
    NSLog(@"%@",error);
}

#pragma mark - SinaToolDelegate
//获得token
-(void)sinaTool:(SinaTool*)sinaTool didGetToken:(NSString*)token;
{
    NSLog(@"Token:%@",token);
    //第一次获得token的时候,请求timeline
    [sinaTool getHomeTimeLineWithToken:token ];
    
}
//获得数据
-(void)sinaTool:(SinaTool *)sinaTool didGetHomeLine:(NSArray *)array
{
    //跟新数据源
    self.homeLineArray = array;
    
    //得到数据之后对text的高度进行计算
    for (ZYStatuses *model in array){
        
        if (model.text.length >0){
            
            CGRect textRect =
            [model.text boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.view.frame)-20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
            
            //@{} 字典
            //@[] 数组
            //@() number
            
            NSInteger row=(model.picUrls.count+2)/3;
            CGFloat showImageHeight = row*(IMG_WIDTH+GAP)+GAP;
            
            
            model.textHeight=CGRectGetHeight(textRect);
            model.imageHeight=showImageHeight;
            
            if (model.retweetedStatus) {
                textRect =
                [model.retweetedStatus.text boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.view.frame)-20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
                NSInteger row=(model.retweetedStatus.picUrls.count+2)/3;
                showImageHeight = row*(IMG_WIDTH+GAP)+GAP;
                model.retTextHeight=CGRectGetHeight(textRect);
                model.retImageHeight=showImageHeight;

            }
        }else{
            
            NSLog(@"微博内容为空");
        }
    }
    [_myTableView.mj_header endRefreshing];
    [_myTableView reloadData];
}

//获得error
-(void)sinaTool:(SinaTool*)sinaTool didFailedWithError:(NSError*)error;
{
    NSLog(@"%@",error);
}

-(void)topShowImage:(SinaShowImageView*)showImageView imageViewTag:(NSInteger)imageTag
{
    //NSLog(@"%ld",showImageView.indexPath.row);
    
    ZYStatuses *model=self.homeLineArray[showImageView.indexPath.row];
    
    CollectionImageViewController *showImageCtr=[[CollectionImageViewController alloc]init];
    
    showImageCtr.tag=imageTag;
    
    showImageCtr.picUrls=model.picUrls;
    
    if (showImageView.isRetweeted) {
        
         showImageCtr.picUrls=  model.retweetedStatus.picUrls;
        
    }
   
    NSMutableArray *rectArray=[[NSMutableArray alloc]init];
    
    for (UIImageView *subView in showImageView.subviews) {
        if (subView.hidden==YES) {
            continue;
        }
        
        CGRect subViewRect=[subView.superview convertRect:subView.frame toView:self.view ];
        
        NSValue *value=[NSValue valueWithCGRect:subViewRect];//将结构体转换成oc对象
        
        [rectArray addObject:value];
    }
    showImageCtr.picFrames=rectArray;
    
    showImageCtr.delegate=self;
    
    [self presentViewController:showImageCtr animated:NO completion:nil];

    
    
}
-(void)tapCollectioonImageWithAnimationView:(UIImageView *)animationView
{
    [self.view addSubview:animationView];
}


//-------CollectionImageViewControllerDelegate
-(void)tapCollectioonImageWithAnimationView:(UIImageView *)animationView toFrame:(CGRect)toRect
{
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
        animationView.frame=toRect;
        
    } completion:^(BOOL finished) {
        
        [animationView removeFromSuperview];
    }];
}





@end
