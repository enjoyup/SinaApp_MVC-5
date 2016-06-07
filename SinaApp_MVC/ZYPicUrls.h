//
//  ZYPicUrls.h
//
//  Created by 宇冬 李 on 16/5/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZYPicUrls : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *thumbnailPic;
@property (nonatomic, strong) NSString *largePic;
@property (nonatomic, strong) NSString *sendText;
+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
