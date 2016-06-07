//
//  SinaEmoticonPackage.h
//  SinaApp_MVC
//
//  Created by mac on 16/5/31.
//  Copyright © 2016年 SuperWang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum :NSUInteger{
    KEmoticonImageType=0,//图片类型
    KEmoticonEmojiType,//emoji
    KEmoticonDeleteType,//删除类型
    KEmoticonOtherType,//其他类型

}KEmoticonType;


@interface SinaEmoticon : NSObject//表情对象

//每个表情对应的文字
@property(nonatomic,copy)NSString *chs;
@property(nonatomic,copy)NSString *cht;

@property(nonatomic,copy)NSString *emoji;//emoji 表情 code

//表情的图片名字
@property(nonatomic,copy)NSString *png;
@property(nonatomic,copy)NSString *gif;
@property(nonatomic,copy)NSString *type;

+(SinaEmoticon*)modelWithDictionary:(NSDictionary*)dic;
@end



@interface SinaEmoticonPackage : NSObject

@property(nonatomic,copy)NSString *packageId;

@property(nonatomic,copy)NSString *packageName;

@property(nonatomic,strong)NSArray *emoticons;

+(SinaEmoticonPackage*)modelWithDictionary:(NSDictionary*)dic;

@end
