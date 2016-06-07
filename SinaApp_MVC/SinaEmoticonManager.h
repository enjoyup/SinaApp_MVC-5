//
//  SinaEmoticonManager.h
//  SinaApp_MVC
//
//  Created by mac on 16/5/31.
//  Copyright © 2016年 SuperWang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SinaEmoticonManager : NSObject

@property(nonatomic,strong)NSMutableArray *emoticonPackages;

@property(nonatomic,strong)NSMutableDictionary *allEmoticonDic;

@property(nonatomic,copy)NSString *bundlePath;


+(instancetype)shareManager;
@end
