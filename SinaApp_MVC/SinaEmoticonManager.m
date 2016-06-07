//
//  SinaEmoticonManager.m
//  SinaApp_MVC
//
//  Created by mac on 16/5/31.
//  Copyright © 2016年 SuperWang. All rights reserved.
//

#import "SinaEmoticonManager.h"
#import "SinaEmoticonPackage.h"
@implementation SinaEmoticonManager
+(instancetype)shareManager
{
    static SinaEmoticonManager *manager=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager=[[SinaEmoticonManager alloc]init];
    });
    return manager;
}
-(instancetype)init
{
    self=[super init];
    if (self) {
        
        _allEmoticonDic=[[NSMutableDictionary alloc]init];
        
        NSString *bundlePath=[[NSBundle mainBundle]pathForResource:@"Emoticons" ofType:@"bundle"];
        _bundlePath = bundlePath;
        
        NSString *emoticonsPlistPath=[bundlePath stringByAppendingPathComponent:@"emoticons.plist"];
        NSDictionary *plistDic=[[NSDictionary alloc]initWithContentsOfFile:emoticonsPlistPath];
        NSArray *packagesArr=plistDic[@"packages"];
        
        _emoticonPackages=[[NSMutableArray alloc]init];
        for (NSDictionary *dic in packagesArr) {
            NSString *packageId=dic[@"id"];
            
            NSString *packagePath=[bundlePath stringByAppendingPathComponent:packageId];
            
            NSString *infoPlistPath=[packagePath stringByAppendingPathComponent:@"info.plist"];
            
            NSDictionary *infoDic=[[NSDictionary alloc]initWithContentsOfFile:infoPlistPath];
            NSArray *emoticons=infoDic[@"emoticons"];
            for (NSDictionary *emoticonDic in emoticons) {
                NSString *chs=emoticonDic[@"chs"];
                NSString *png=emoticonDic[@"png"];
                
                NSString *pngPath=[packagePath stringByAppendingPathComponent:png];
                if (chs!=nil) {
                    [_allEmoticonDic setObject:pngPath forKey:chs];
                }
            }
            SinaEmoticonPackage *package=[SinaEmoticonPackage modelWithDictionary:infoDic];
            [_emoticonPackages addObject:package];
        }
        
    }
    return self;
    
}

@end
