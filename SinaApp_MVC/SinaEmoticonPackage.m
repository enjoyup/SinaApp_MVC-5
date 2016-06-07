//
//  SinaEmoticonPackage.m
//  SinaApp_MVC
//
//  Created by mac on 16/5/31.
//  Copyright © 2016年 SuperWang. All rights reserved.
//

#define EMOJI_CODE_TO_SYMBOL(x) ((((0x808080F0 | (x & 0x3F000) >> 4) | (x & 0xFC0) << 10) | (x & 0x1C0000) << 18) | (x & 0x3F) << 24);


#import "SinaEmoticonPackage.h"

@implementation SinaEmoticon

+(SinaEmoticon*)modelWithDictionary:(NSDictionary*)dic
{
    return [[self alloc]initWithDictionary:dic];
}
-(instancetype)initWithDictionary:(NSDictionary*)dic
{
    self=[super init];
    if (self) {
        
        _type=dic[@"type"];
        
        if (self.type.integerValue==KEmoticonImageType) {
            _chs=dic[@"chs"];
            _cht=dic[@"cht"];
            _png=dic[@"png"];
            _gif=dic[@"gif"];
        }else if (self.type.integerValue==KEmoticonEmojiType){
            NSString *codeStr=dic[@"code"];
            
            long sym=EMOJI_CODE_TO_SYMBOL(strtol(codeStr.UTF8String, NULL, 16));
            
            _emoji=[[NSString alloc]initWithBytes:&sym length:sizeof(sym) encoding:NSUTF8StringEncoding];
            
            
        }
        
    }
    return self;
}


@end


@implementation SinaEmoticonPackage

+(SinaEmoticonPackage*)modelWithDictionary:(NSDictionary*)dic
{
    return [[self alloc]initWithDictionary:dic];
}
-(instancetype)initWithDictionary:(NSDictionary*)dic
{
    self=[super init];
    if (self) {
        
        _packageName=dic[@"group_name_cn"];
        _packageId=dic[@"id"];
        
        NSArray *array=dic[@"emoticons"];
        NSMutableArray *emoticonsArr=[[NSMutableArray alloc]init];
        
        for (NSDictionary *emDic in array) {
            SinaEmoticon *emoticonModel=[SinaEmoticon modelWithDictionary:emDic];
            
            [emoticonsArr addObject:emoticonModel];
        }
        _emoticons=emoticonsArr;
        
    }
    return self;
}





@end
