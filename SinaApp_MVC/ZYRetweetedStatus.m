//
//  ZYRetweetedStatus.m
//
//  Created by 宇冬 李 on 16/5/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZYRetweetedStatus.h"
#import "ZYPicUrls.h"
#import "ZYUser.h"
#import "ZYVisible.h"


NSString *const kZYRetweetedStatusAttitudesCount = @"attitudes_count";
NSString *const kZYRetweetedStatusSource = @"source";
NSString *const kZYRetweetedStatusTextLength = @"textLength";
NSString *const kZYRetweetedStatusSourceType = @"source_type";
NSString *const kZYRetweetedStatusIdstr = @"idstr";
NSString *const kZYRetweetedStatusMid = @"mid";
NSString *const kZYRetweetedStatusTruncated = @"truncated";
NSString *const kZYRetweetedStatusHotWeiboTags = @"hot_weibo_tags";
NSString *const kZYRetweetedStatusSourceAllowclick = @"source_allowclick";
NSString *const kZYRetweetedStatusDarwinTags = @"darwin_tags";
NSString *const kZYRetweetedStatusInReplyToScreenName = @"in_reply_to_screen_name";
NSString *const kZYRetweetedStatusCommentsCount = @"comments_count";
NSString *const kZYRetweetedStatusOriginalPic = @"original_pic";
NSString *const kZYRetweetedStatusPicUrls = @"pic_urls";
NSString *const kZYRetweetedStatusIsLongText = @"isLongText";
NSString *const kZYRetweetedStatusRepostsCount = @"reposts_count";
NSString *const kZYRetweetedStatusThumbnailPic = @"thumbnail_pic";
NSString *const kZYRetweetedStatusFavorited = @"favorited";
NSString *const kZYRetweetedStatusTextTagTips = @"text_tag_tips";
NSString *const kZYRetweetedStatusBmiddlePic = @"bmiddle_pic";
NSString *const kZYRetweetedStatusGeo = @"geo";
NSString *const kZYRetweetedStatusId = @"id";
NSString *const kZYRetweetedStatusUser = @"user";
NSString *const kZYRetweetedStatusInReplyToUserId = @"in_reply_to_user_id";
NSString *const kZYRetweetedStatusUserType = @"userType";
NSString *const kZYRetweetedStatusText = @"text";
NSString *const kZYRetweetedStatusBizFeature = @"biz_feature";
NSString *const kZYRetweetedStatusMlevel = @"mlevel";
NSString *const kZYRetweetedStatusCreatedAt = @"created_at";
NSString *const kZYRetweetedStatusVisible = @"visible";
NSString *const kZYRetweetedStatusInReplyToStatusId = @"in_reply_to_status_id";


@interface ZYRetweetedStatus ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZYRetweetedStatus

@synthesize attitudesCount = _attitudesCount;
@synthesize source = _source;
@synthesize textLength = _textLength;
@synthesize sourceType = _sourceType;
@synthesize idstr = _idstr;
@synthesize mid = _mid;
@synthesize truncated = _truncated;
@synthesize hotWeiboTags = _hotWeiboTags;
@synthesize sourceAllowclick = _sourceAllowclick;
@synthesize darwinTags = _darwinTags;
@synthesize inReplyToScreenName = _inReplyToScreenName;
@synthesize commentsCount = _commentsCount;
@synthesize originalPic = _originalPic;
@synthesize picUrls = _picUrls;
@synthesize isLongText = _isLongText;
@synthesize repostsCount = _repostsCount;
@synthesize thumbnailPic = _thumbnailPic;
@synthesize favorited = _favorited;
@synthesize textTagTips = _textTagTips;
@synthesize bmiddlePic = _bmiddlePic;
@synthesize geo = _geo;
@synthesize retweetedStatusIdentifier = _retweetedStatusIdentifier;
@synthesize user = _user;
@synthesize inReplyToUserId = _inReplyToUserId;
@synthesize userType = _userType;
@synthesize text = _text;
@synthesize bizFeature = _bizFeature;
@synthesize mlevel = _mlevel;
@synthesize createdAt = _createdAt;
@synthesize visible = _visible;
@synthesize inReplyToStatusId = _inReplyToStatusId;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (!dict) {
        return nil;
    }
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.attitudesCount = [[self objectOrNilForKey:kZYRetweetedStatusAttitudesCount fromDictionary:dict] doubleValue];
            self.source = [self objectOrNilForKey:kZYRetweetedStatusSource fromDictionary:dict];
            self.textLength = [[self objectOrNilForKey:kZYRetweetedStatusTextLength fromDictionary:dict] doubleValue];
            self.sourceType = [[self objectOrNilForKey:kZYRetweetedStatusSourceType fromDictionary:dict] doubleValue];
            self.idstr = [self objectOrNilForKey:kZYRetweetedStatusIdstr fromDictionary:dict];
            self.mid = [self objectOrNilForKey:kZYRetweetedStatusMid fromDictionary:dict];
            self.truncated = [[self objectOrNilForKey:kZYRetweetedStatusTruncated fromDictionary:dict] boolValue];
            self.hotWeiboTags = [self objectOrNilForKey:kZYRetweetedStatusHotWeiboTags fromDictionary:dict];
            self.sourceAllowclick = [[self objectOrNilForKey:kZYRetweetedStatusSourceAllowclick fromDictionary:dict] doubleValue];
            self.darwinTags = [self objectOrNilForKey:kZYRetweetedStatusDarwinTags fromDictionary:dict];
            self.inReplyToScreenName = [self objectOrNilForKey:kZYRetweetedStatusInReplyToScreenName fromDictionary:dict];
            self.commentsCount = [[self objectOrNilForKey:kZYRetweetedStatusCommentsCount fromDictionary:dict] doubleValue];
            self.originalPic = [self objectOrNilForKey:kZYRetweetedStatusOriginalPic fromDictionary:dict];
    NSObject *receivedZYPicUrls = [dict objectForKey:kZYRetweetedStatusPicUrls];
    NSMutableArray *parsedZYPicUrls = [NSMutableArray array];
    if ([receivedZYPicUrls isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZYPicUrls) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZYPicUrls addObject:[ZYPicUrls modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZYPicUrls isKindOfClass:[NSDictionary class]]) {
       [parsedZYPicUrls addObject:[ZYPicUrls modelObjectWithDictionary:(NSDictionary *)receivedZYPicUrls]];
    }

    self.picUrls = [NSArray arrayWithArray:parsedZYPicUrls];
            self.isLongText = [[self objectOrNilForKey:kZYRetweetedStatusIsLongText fromDictionary:dict] boolValue];
            self.repostsCount = [[self objectOrNilForKey:kZYRetweetedStatusRepostsCount fromDictionary:dict] doubleValue];
            self.thumbnailPic = [self objectOrNilForKey:kZYRetweetedStatusThumbnailPic fromDictionary:dict];
            self.favorited = [[self objectOrNilForKey:kZYRetweetedStatusFavorited fromDictionary:dict] boolValue];
            self.textTagTips = [self objectOrNilForKey:kZYRetweetedStatusTextTagTips fromDictionary:dict];
            self.bmiddlePic = [self objectOrNilForKey:kZYRetweetedStatusBmiddlePic fromDictionary:dict];
            self.geo = [self objectOrNilForKey:kZYRetweetedStatusGeo fromDictionary:dict];
            self.retweetedStatusIdentifier = [[self objectOrNilForKey:kZYRetweetedStatusId fromDictionary:dict] doubleValue];
            self.user = [ZYUser modelObjectWithDictionary:[dict objectForKey:kZYRetweetedStatusUser]];
            self.inReplyToUserId = [self objectOrNilForKey:kZYRetweetedStatusInReplyToUserId fromDictionary:dict];
            self.userType = [[self objectOrNilForKey:kZYRetweetedStatusUserType fromDictionary:dict] doubleValue];
            self.text = [self objectOrNilForKey:kZYRetweetedStatusText fromDictionary:dict];
            self.bizFeature = [[self objectOrNilForKey:kZYRetweetedStatusBizFeature fromDictionary:dict] doubleValue];
            self.mlevel = [[self objectOrNilForKey:kZYRetweetedStatusMlevel fromDictionary:dict] doubleValue];
            self.createdAt = [self objectOrNilForKey:kZYRetweetedStatusCreatedAt fromDictionary:dict];
            self.visible = [ZYVisible modelObjectWithDictionary:[dict objectForKey:kZYRetweetedStatusVisible]];
            self.inReplyToStatusId = [self objectOrNilForKey:kZYRetweetedStatusInReplyToStatusId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.attitudesCount] forKey:kZYRetweetedStatusAttitudesCount];
    [mutableDict setValue:self.source forKey:kZYRetweetedStatusSource];
    [mutableDict setValue:[NSNumber numberWithDouble:self.textLength] forKey:kZYRetweetedStatusTextLength];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sourceType] forKey:kZYRetweetedStatusSourceType];
    [mutableDict setValue:self.idstr forKey:kZYRetweetedStatusIdstr];
    [mutableDict setValue:self.mid forKey:kZYRetweetedStatusMid];
    [mutableDict setValue:[NSNumber numberWithBool:self.truncated] forKey:kZYRetweetedStatusTruncated];
    NSMutableArray *tempArrayForHotWeiboTags = [NSMutableArray array];
    for (NSObject *subArrayObject in self.hotWeiboTags) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForHotWeiboTags addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForHotWeiboTags addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHotWeiboTags] forKey:kZYRetweetedStatusHotWeiboTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sourceAllowclick] forKey:kZYRetweetedStatusSourceAllowclick];
    NSMutableArray *tempArrayForDarwinTags = [NSMutableArray array];
    for (NSObject *subArrayObject in self.darwinTags) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDarwinTags addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDarwinTags addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDarwinTags] forKey:kZYRetweetedStatusDarwinTags];
    [mutableDict setValue:self.inReplyToScreenName forKey:kZYRetweetedStatusInReplyToScreenName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsCount] forKey:kZYRetweetedStatusCommentsCount];
    [mutableDict setValue:self.originalPic forKey:kZYRetweetedStatusOriginalPic];
    NSMutableArray *tempArrayForPicUrls = [NSMutableArray array];
    for (NSObject *subArrayObject in self.picUrls) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPicUrls addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPicUrls addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPicUrls] forKey:kZYRetweetedStatusPicUrls];
    [mutableDict setValue:[NSNumber numberWithBool:self.isLongText] forKey:kZYRetweetedStatusIsLongText];
    [mutableDict setValue:[NSNumber numberWithDouble:self.repostsCount] forKey:kZYRetweetedStatusRepostsCount];
    [mutableDict setValue:self.thumbnailPic forKey:kZYRetweetedStatusThumbnailPic];
    [mutableDict setValue:[NSNumber numberWithBool:self.favorited] forKey:kZYRetweetedStatusFavorited];
    NSMutableArray *tempArrayForTextTagTips = [NSMutableArray array];
    for (NSObject *subArrayObject in self.textTagTips) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTextTagTips addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTextTagTips addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTextTagTips] forKey:kZYRetweetedStatusTextTagTips];
    [mutableDict setValue:self.bmiddlePic forKey:kZYRetweetedStatusBmiddlePic];
    [mutableDict setValue:self.geo forKey:kZYRetweetedStatusGeo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.retweetedStatusIdentifier] forKey:kZYRetweetedStatusId];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kZYRetweetedStatusUser];
    [mutableDict setValue:self.inReplyToUserId forKey:kZYRetweetedStatusInReplyToUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userType] forKey:kZYRetweetedStatusUserType];
    [mutableDict setValue:self.text forKey:kZYRetweetedStatusText];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bizFeature] forKey:kZYRetweetedStatusBizFeature];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mlevel] forKey:kZYRetweetedStatusMlevel];
    [mutableDict setValue:self.createdAt forKey:kZYRetweetedStatusCreatedAt];
    [mutableDict setValue:[self.visible dictionaryRepresentation] forKey:kZYRetweetedStatusVisible];
    [mutableDict setValue:self.inReplyToStatusId forKey:kZYRetweetedStatusInReplyToStatusId];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.attitudesCount = [aDecoder decodeDoubleForKey:kZYRetweetedStatusAttitudesCount];
    self.source = [aDecoder decodeObjectForKey:kZYRetweetedStatusSource];
    self.textLength = [aDecoder decodeDoubleForKey:kZYRetweetedStatusTextLength];
    self.sourceType = [aDecoder decodeDoubleForKey:kZYRetweetedStatusSourceType];
    self.idstr = [aDecoder decodeObjectForKey:kZYRetweetedStatusIdstr];
    self.mid = [aDecoder decodeObjectForKey:kZYRetweetedStatusMid];
    self.truncated = [aDecoder decodeBoolForKey:kZYRetweetedStatusTruncated];
    self.hotWeiboTags = [aDecoder decodeObjectForKey:kZYRetweetedStatusHotWeiboTags];
    self.sourceAllowclick = [aDecoder decodeDoubleForKey:kZYRetweetedStatusSourceAllowclick];
    self.darwinTags = [aDecoder decodeObjectForKey:kZYRetweetedStatusDarwinTags];
    self.inReplyToScreenName = [aDecoder decodeObjectForKey:kZYRetweetedStatusInReplyToScreenName];
    self.commentsCount = [aDecoder decodeDoubleForKey:kZYRetweetedStatusCommentsCount];
    self.originalPic = [aDecoder decodeObjectForKey:kZYRetweetedStatusOriginalPic];
    self.picUrls = [aDecoder decodeObjectForKey:kZYRetweetedStatusPicUrls];
    self.isLongText = [aDecoder decodeBoolForKey:kZYRetweetedStatusIsLongText];
    self.repostsCount = [aDecoder decodeDoubleForKey:kZYRetweetedStatusRepostsCount];
    self.thumbnailPic = [aDecoder decodeObjectForKey:kZYRetweetedStatusThumbnailPic];
    self.favorited = [aDecoder decodeBoolForKey:kZYRetweetedStatusFavorited];
    self.textTagTips = [aDecoder decodeObjectForKey:kZYRetweetedStatusTextTagTips];
    self.bmiddlePic = [aDecoder decodeObjectForKey:kZYRetweetedStatusBmiddlePic];
    self.geo = [aDecoder decodeObjectForKey:kZYRetweetedStatusGeo];
    self.retweetedStatusIdentifier = [aDecoder decodeDoubleForKey:kZYRetweetedStatusId];
    self.user = [aDecoder decodeObjectForKey:kZYRetweetedStatusUser];
    self.inReplyToUserId = [aDecoder decodeObjectForKey:kZYRetweetedStatusInReplyToUserId];
    self.userType = [aDecoder decodeDoubleForKey:kZYRetweetedStatusUserType];
    self.text = [aDecoder decodeObjectForKey:kZYRetweetedStatusText];
    self.bizFeature = [aDecoder decodeDoubleForKey:kZYRetweetedStatusBizFeature];
    self.mlevel = [aDecoder decodeDoubleForKey:kZYRetweetedStatusMlevel];
    self.createdAt = [aDecoder decodeObjectForKey:kZYRetweetedStatusCreatedAt];
    self.visible = [aDecoder decodeObjectForKey:kZYRetweetedStatusVisible];
    self.inReplyToStatusId = [aDecoder decodeObjectForKey:kZYRetweetedStatusInReplyToStatusId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_attitudesCount forKey:kZYRetweetedStatusAttitudesCount];
    [aCoder encodeObject:_source forKey:kZYRetweetedStatusSource];
    [aCoder encodeDouble:_textLength forKey:kZYRetweetedStatusTextLength];
    [aCoder encodeDouble:_sourceType forKey:kZYRetweetedStatusSourceType];
    [aCoder encodeObject:_idstr forKey:kZYRetweetedStatusIdstr];
    [aCoder encodeObject:_mid forKey:kZYRetweetedStatusMid];
    [aCoder encodeBool:_truncated forKey:kZYRetweetedStatusTruncated];
    [aCoder encodeObject:_hotWeiboTags forKey:kZYRetweetedStatusHotWeiboTags];
    [aCoder encodeDouble:_sourceAllowclick forKey:kZYRetweetedStatusSourceAllowclick];
    [aCoder encodeObject:_darwinTags forKey:kZYRetweetedStatusDarwinTags];
    [aCoder encodeObject:_inReplyToScreenName forKey:kZYRetweetedStatusInReplyToScreenName];
    [aCoder encodeDouble:_commentsCount forKey:kZYRetweetedStatusCommentsCount];
    [aCoder encodeObject:_originalPic forKey:kZYRetweetedStatusOriginalPic];
    [aCoder encodeObject:_picUrls forKey:kZYRetweetedStatusPicUrls];
    [aCoder encodeBool:_isLongText forKey:kZYRetweetedStatusIsLongText];
    [aCoder encodeDouble:_repostsCount forKey:kZYRetweetedStatusRepostsCount];
    [aCoder encodeObject:_thumbnailPic forKey:kZYRetweetedStatusThumbnailPic];
    [aCoder encodeBool:_favorited forKey:kZYRetweetedStatusFavorited];
    [aCoder encodeObject:_textTagTips forKey:kZYRetweetedStatusTextTagTips];
    [aCoder encodeObject:_bmiddlePic forKey:kZYRetweetedStatusBmiddlePic];
    [aCoder encodeObject:_geo forKey:kZYRetweetedStatusGeo];
    [aCoder encodeDouble:_retweetedStatusIdentifier forKey:kZYRetweetedStatusId];
    [aCoder encodeObject:_user forKey:kZYRetweetedStatusUser];
    [aCoder encodeObject:_inReplyToUserId forKey:kZYRetweetedStatusInReplyToUserId];
    [aCoder encodeDouble:_userType forKey:kZYRetweetedStatusUserType];
    [aCoder encodeObject:_text forKey:kZYRetweetedStatusText];
    [aCoder encodeDouble:_bizFeature forKey:kZYRetweetedStatusBizFeature];
    [aCoder encodeDouble:_mlevel forKey:kZYRetweetedStatusMlevel];
    [aCoder encodeObject:_createdAt forKey:kZYRetweetedStatusCreatedAt];
    [aCoder encodeObject:_visible forKey:kZYRetweetedStatusVisible];
    [aCoder encodeObject:_inReplyToStatusId forKey:kZYRetweetedStatusInReplyToStatusId];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZYRetweetedStatus *copy = [[ZYRetweetedStatus alloc] init];
    
    if (copy) {

        copy.attitudesCount = self.attitudesCount;
        copy.source = [self.source copyWithZone:zone];
        copy.textLength = self.textLength;
        copy.sourceType = self.sourceType;
        copy.idstr = [self.idstr copyWithZone:zone];
        copy.mid = [self.mid copyWithZone:zone];
        copy.truncated = self.truncated;
        copy.hotWeiboTags = [self.hotWeiboTags copyWithZone:zone];
        copy.sourceAllowclick = self.sourceAllowclick;
        copy.darwinTags = [self.darwinTags copyWithZone:zone];
        copy.inReplyToScreenName = [self.inReplyToScreenName copyWithZone:zone];
        copy.commentsCount = self.commentsCount;
        copy.originalPic = [self.originalPic copyWithZone:zone];
        copy.picUrls = [self.picUrls copyWithZone:zone];
        copy.isLongText = self.isLongText;
        copy.repostsCount = self.repostsCount;
        copy.thumbnailPic = [self.thumbnailPic copyWithZone:zone];
        copy.favorited = self.favorited;
        copy.textTagTips = [self.textTagTips copyWithZone:zone];
        copy.bmiddlePic = [self.bmiddlePic copyWithZone:zone];
        copy.geo = [self.geo copyWithZone:zone];
        copy.retweetedStatusIdentifier = self.retweetedStatusIdentifier;
        copy.user = [self.user copyWithZone:zone];
        copy.inReplyToUserId = [self.inReplyToUserId copyWithZone:zone];
        copy.userType = self.userType;
        copy.text = [self.text copyWithZone:zone];
        copy.bizFeature = self.bizFeature;
        copy.mlevel = self.mlevel;
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.visible = [self.visible copyWithZone:zone];
        copy.inReplyToStatusId = [self.inReplyToStatusId copyWithZone:zone];
    }
    
    return copy;
}


@end
