//
//  ZYStatuses.m
//
//  Created by 宇冬 李 on 16/5/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZYStatuses.h"
#import "ZYPicUrls.h"
#import "ZYRetweetedStatus.h"
#import "ZYUser.h"
#import "ZYAnnotations.h"
#import "ZYVisible.h"


NSString *const kZYStatusesFavorited = @"favorited";
NSString *const kZYStatusesTruncated = @"truncated";
NSString *const kZYStatusesId = @"id";
NSString *const kZYStatusesCreatedAt = @"created_at";
NSString *const kZYStatusesInReplyToScreenName = @"in_reply_to_screen_name";
NSString *const kZYStatusesIsLongText = @"isLongText";
NSString *const kZYStatusesPicUrls = @"pic_urls";
NSString *const kZYStatusesText = @"text";
NSString *const kZYStatusesIdstr = @"idstr";
NSString *const kZYStatusesTextLength = @"textLength";
NSString *const kZYStatusesSourceType = @"source_type";
NSString *const kZYStatusesHotWeiboTags = @"hot_weibo_tags";
NSString *const kZYStatusesPageType = @"page_type";
NSString *const kZYStatusesGeo = @"geo";
NSString *const kZYStatusesRetweetedStatus = @"retweeted_status";
NSString *const kZYStatusesUser = @"user";
NSString *const kZYStatusesTextTagTips = @"text_tag_tips";
NSString *const kZYStatusesCommentsCount = @"comments_count";
NSString *const kZYStatusesThumbnailPic = @"thumbnail_pic";
NSString *const kZYStatusesSource = @"source";
NSString *const kZYStatusesSourceAllowclick = @"source_allowclick";
NSString *const kZYStatusesBizFeature = @"biz_feature";
NSString *const kZYStatusesAnnotations = @"annotations";
NSString *const kZYStatusesBmiddlePic = @"bmiddle_pic";
NSString *const kZYStatusesVisible = @"visible";
NSString *const kZYStatusesInReplyToStatusId = @"in_reply_to_status_id";
NSString *const kZYStatusesMid = @"mid";
NSString *const kZYStatusesRepostsCount = @"reposts_count";
NSString *const kZYStatusesUserType = @"userType";
NSString *const kZYStatusesAttitudesCount = @"attitudes_count";
NSString *const kZYStatusesDarwinTags = @"darwin_tags";
NSString *const kZYStatusesMlevel = @"mlevel";
NSString *const kZYStatusesRid = @"rid";
NSString *const kZYStatusesInReplyToUserId = @"in_reply_to_user_id";
NSString *const kZYStatusesOriginalPic = @"original_pic";


@interface ZYStatuses ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZYStatuses

@synthesize favorited = _favorited;
@synthesize truncated = _truncated;
@synthesize statusesIdentifier = _statusesIdentifier;
@synthesize createdAt = _createdAt;
@synthesize inReplyToScreenName = _inReplyToScreenName;
@synthesize isLongText = _isLongText;
@synthesize picUrls = _picUrls;
@synthesize text = _text;
@synthesize idstr = _idstr;
@synthesize textLength = _textLength;
@synthesize sourceType = _sourceType;
@synthesize hotWeiboTags = _hotWeiboTags;
@synthesize pageType = _pageType;
@synthesize geo = _geo;
@synthesize retweetedStatus = _retweetedStatus;
@synthesize user = _user;
@synthesize textTagTips = _textTagTips;
@synthesize commentsCount = _commentsCount;
@synthesize thumbnailPic = _thumbnailPic;
@synthesize source = _source;
@synthesize sourceAllowclick = _sourceAllowclick;
@synthesize bizFeature = _bizFeature;
@synthesize annotations = _annotations;
@synthesize bmiddlePic = _bmiddlePic;
@synthesize visible = _visible;
@synthesize inReplyToStatusId = _inReplyToStatusId;
@synthesize mid = _mid;
@synthesize repostsCount = _repostsCount;
@synthesize userType = _userType;
@synthesize attitudesCount = _attitudesCount;
@synthesize darwinTags = _darwinTags;
@synthesize mlevel = _mlevel;
@synthesize rid = _rid;
@synthesize inReplyToUserId = _inReplyToUserId;
@synthesize originalPic = _originalPic;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.favorited = [[self objectOrNilForKey:kZYStatusesFavorited fromDictionary:dict] boolValue];
            self.truncated = [[self objectOrNilForKey:kZYStatusesTruncated fromDictionary:dict] boolValue];
            self.statusesIdentifier = [[self objectOrNilForKey:kZYStatusesId fromDictionary:dict] doubleValue];
            self.createdAt = [self objectOrNilForKey:kZYStatusesCreatedAt fromDictionary:dict];
            self.inReplyToScreenName = [self objectOrNilForKey:kZYStatusesInReplyToScreenName fromDictionary:dict];
            self.isLongText = [[self objectOrNilForKey:kZYStatusesIsLongText fromDictionary:dict] boolValue];
    NSObject *receivedZYPicUrls = [dict objectForKey:kZYStatusesPicUrls];
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
            self.text = [self objectOrNilForKey:kZYStatusesText fromDictionary:dict];
            self.idstr = [self objectOrNilForKey:kZYStatusesIdstr fromDictionary:dict];
            self.textLength = [[self objectOrNilForKey:kZYStatusesTextLength fromDictionary:dict] doubleValue];
            self.sourceType = [[self objectOrNilForKey:kZYStatusesSourceType fromDictionary:dict] doubleValue];
            self.hotWeiboTags = [self objectOrNilForKey:kZYStatusesHotWeiboTags fromDictionary:dict];
            self.pageType = [[self objectOrNilForKey:kZYStatusesPageType fromDictionary:dict] doubleValue];
            self.geo = [self objectOrNilForKey:kZYStatusesGeo fromDictionary:dict];
            self.retweetedStatus = [ZYRetweetedStatus modelObjectWithDictionary:[dict objectForKey:kZYStatusesRetweetedStatus]];
            self.user = [ZYUser modelObjectWithDictionary:[dict objectForKey:kZYStatusesUser]];
            self.textTagTips = [self objectOrNilForKey:kZYStatusesTextTagTips fromDictionary:dict];
            self.commentsCount = [[self objectOrNilForKey:kZYStatusesCommentsCount fromDictionary:dict] doubleValue];
            self.thumbnailPic = [self objectOrNilForKey:kZYStatusesThumbnailPic fromDictionary:dict];
            self.source = [self objectOrNilForKey:kZYStatusesSource fromDictionary:dict];
            self.sourceAllowclick = [[self objectOrNilForKey:kZYStatusesSourceAllowclick fromDictionary:dict] doubleValue];
            self.bizFeature = [[self objectOrNilForKey:kZYStatusesBizFeature fromDictionary:dict] doubleValue];
    NSObject *receivedZYAnnotations = [dict objectForKey:kZYStatusesAnnotations];
    NSMutableArray *parsedZYAnnotations = [NSMutableArray array];
    if ([receivedZYAnnotations isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZYAnnotations) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZYAnnotations addObject:[ZYAnnotations modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZYAnnotations isKindOfClass:[NSDictionary class]]) {
       [parsedZYAnnotations addObject:[ZYAnnotations modelObjectWithDictionary:(NSDictionary *)receivedZYAnnotations]];
    }

    self.annotations = [NSArray arrayWithArray:parsedZYAnnotations];
            self.bmiddlePic = [self objectOrNilForKey:kZYStatusesBmiddlePic fromDictionary:dict];
            self.visible = [ZYVisible modelObjectWithDictionary:[dict objectForKey:kZYStatusesVisible]];
            self.inReplyToStatusId = [self objectOrNilForKey:kZYStatusesInReplyToStatusId fromDictionary:dict];
            self.mid = [self objectOrNilForKey:kZYStatusesMid fromDictionary:dict];
            self.repostsCount = [[self objectOrNilForKey:kZYStatusesRepostsCount fromDictionary:dict] doubleValue];
            self.userType = [[self objectOrNilForKey:kZYStatusesUserType fromDictionary:dict] doubleValue];
            self.attitudesCount = [[self objectOrNilForKey:kZYStatusesAttitudesCount fromDictionary:dict] doubleValue];
            self.darwinTags = [self objectOrNilForKey:kZYStatusesDarwinTags fromDictionary:dict];
            self.mlevel = [[self objectOrNilForKey:kZYStatusesMlevel fromDictionary:dict] doubleValue];
            self.rid = [self objectOrNilForKey:kZYStatusesRid fromDictionary:dict];
            self.inReplyToUserId = [self objectOrNilForKey:kZYStatusesInReplyToUserId fromDictionary:dict];
            self.originalPic = [self objectOrNilForKey:kZYStatusesOriginalPic fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.favorited] forKey:kZYStatusesFavorited];
    [mutableDict setValue:[NSNumber numberWithBool:self.truncated] forKey:kZYStatusesTruncated];
    [mutableDict setValue:[NSNumber numberWithDouble:self.statusesIdentifier] forKey:kZYStatusesId];
    [mutableDict setValue:self.createdAt forKey:kZYStatusesCreatedAt];
    [mutableDict setValue:self.inReplyToScreenName forKey:kZYStatusesInReplyToScreenName];
    [mutableDict setValue:[NSNumber numberWithBool:self.isLongText] forKey:kZYStatusesIsLongText];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPicUrls] forKey:kZYStatusesPicUrls];
    [mutableDict setValue:self.text forKey:kZYStatusesText];
    [mutableDict setValue:self.idstr forKey:kZYStatusesIdstr];
    [mutableDict setValue:[NSNumber numberWithDouble:self.textLength] forKey:kZYStatusesTextLength];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sourceType] forKey:kZYStatusesSourceType];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHotWeiboTags] forKey:kZYStatusesHotWeiboTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageType] forKey:kZYStatusesPageType];
    [mutableDict setValue:self.geo forKey:kZYStatusesGeo];
    [mutableDict setValue:[self.retweetedStatus dictionaryRepresentation] forKey:kZYStatusesRetweetedStatus];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kZYStatusesUser];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTextTagTips] forKey:kZYStatusesTextTagTips];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsCount] forKey:kZYStatusesCommentsCount];
    [mutableDict setValue:self.thumbnailPic forKey:kZYStatusesThumbnailPic];
    [mutableDict setValue:self.source forKey:kZYStatusesSource];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sourceAllowclick] forKey:kZYStatusesSourceAllowclick];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bizFeature] forKey:kZYStatusesBizFeature];
    NSMutableArray *tempArrayForAnnotations = [NSMutableArray array];
    for (NSObject *subArrayObject in self.annotations) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAnnotations addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAnnotations addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAnnotations] forKey:kZYStatusesAnnotations];
    [mutableDict setValue:self.bmiddlePic forKey:kZYStatusesBmiddlePic];
    [mutableDict setValue:[self.visible dictionaryRepresentation] forKey:kZYStatusesVisible];
    [mutableDict setValue:self.inReplyToStatusId forKey:kZYStatusesInReplyToStatusId];
    [mutableDict setValue:self.mid forKey:kZYStatusesMid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.repostsCount] forKey:kZYStatusesRepostsCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userType] forKey:kZYStatusesUserType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.attitudesCount] forKey:kZYStatusesAttitudesCount];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDarwinTags] forKey:kZYStatusesDarwinTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mlevel] forKey:kZYStatusesMlevel];
    [mutableDict setValue:self.rid forKey:kZYStatusesRid];
    [mutableDict setValue:self.inReplyToUserId forKey:kZYStatusesInReplyToUserId];
    [mutableDict setValue:self.originalPic forKey:kZYStatusesOriginalPic];

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

    self.favorited = [aDecoder decodeBoolForKey:kZYStatusesFavorited];
    self.truncated = [aDecoder decodeBoolForKey:kZYStatusesTruncated];
    self.statusesIdentifier = [aDecoder decodeDoubleForKey:kZYStatusesId];
    self.createdAt = [aDecoder decodeObjectForKey:kZYStatusesCreatedAt];
    self.inReplyToScreenName = [aDecoder decodeObjectForKey:kZYStatusesInReplyToScreenName];
    self.isLongText = [aDecoder decodeBoolForKey:kZYStatusesIsLongText];
    self.picUrls = [aDecoder decodeObjectForKey:kZYStatusesPicUrls];
    
    
    
    
    
    self.text = [aDecoder decodeObjectForKey:kZYStatusesText];
    self.idstr = [aDecoder decodeObjectForKey:kZYStatusesIdstr];
    self.textLength = [aDecoder decodeDoubleForKey:kZYStatusesTextLength];
    self.sourceType = [aDecoder decodeDoubleForKey:kZYStatusesSourceType];
    self.hotWeiboTags = [aDecoder decodeObjectForKey:kZYStatusesHotWeiboTags];
    self.pageType = [aDecoder decodeDoubleForKey:kZYStatusesPageType];
    self.geo = [aDecoder decodeObjectForKey:kZYStatusesGeo];
    self.retweetedStatus = [aDecoder decodeObjectForKey:kZYStatusesRetweetedStatus];
    self.user = [aDecoder decodeObjectForKey:kZYStatusesUser];
    self.textTagTips = [aDecoder decodeObjectForKey:kZYStatusesTextTagTips];
    self.commentsCount = [aDecoder decodeDoubleForKey:kZYStatusesCommentsCount];
    self.thumbnailPic = [aDecoder decodeObjectForKey:kZYStatusesThumbnailPic];
    self.source = [aDecoder decodeObjectForKey:kZYStatusesSource];
    self.sourceAllowclick = [aDecoder decodeDoubleForKey:kZYStatusesSourceAllowclick];
    self.bizFeature = [aDecoder decodeDoubleForKey:kZYStatusesBizFeature];
    self.annotations = [aDecoder decodeObjectForKey:kZYStatusesAnnotations];
    self.bmiddlePic = [aDecoder decodeObjectForKey:kZYStatusesBmiddlePic];
    self.visible = [aDecoder decodeObjectForKey:kZYStatusesVisible];
    self.inReplyToStatusId = [aDecoder decodeObjectForKey:kZYStatusesInReplyToStatusId];
    self.mid = [aDecoder decodeObjectForKey:kZYStatusesMid];
    self.repostsCount = [aDecoder decodeDoubleForKey:kZYStatusesRepostsCount];
    self.userType = [aDecoder decodeDoubleForKey:kZYStatusesUserType];
    self.attitudesCount = [aDecoder decodeDoubleForKey:kZYStatusesAttitudesCount];
    self.darwinTags = [aDecoder decodeObjectForKey:kZYStatusesDarwinTags];
    self.mlevel = [aDecoder decodeDoubleForKey:kZYStatusesMlevel];
    self.rid = [aDecoder decodeObjectForKey:kZYStatusesRid];
    self.inReplyToUserId = [aDecoder decodeObjectForKey:kZYStatusesInReplyToUserId];
    self.originalPic = [aDecoder decodeObjectForKey:kZYStatusesOriginalPic];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_favorited forKey:kZYStatusesFavorited];
    [aCoder encodeBool:_truncated forKey:kZYStatusesTruncated];
    [aCoder encodeDouble:_statusesIdentifier forKey:kZYStatusesId];
    [aCoder encodeObject:_createdAt forKey:kZYStatusesCreatedAt];
    [aCoder encodeObject:_inReplyToScreenName forKey:kZYStatusesInReplyToScreenName];
    [aCoder encodeBool:_isLongText forKey:kZYStatusesIsLongText];
    [aCoder encodeObject:_picUrls forKey:kZYStatusesPicUrls];
    [aCoder encodeObject:_text forKey:kZYStatusesText];
    [aCoder encodeObject:_idstr forKey:kZYStatusesIdstr];
    [aCoder encodeDouble:_textLength forKey:kZYStatusesTextLength];
    [aCoder encodeDouble:_sourceType forKey:kZYStatusesSourceType];
    [aCoder encodeObject:_hotWeiboTags forKey:kZYStatusesHotWeiboTags];
    [aCoder encodeDouble:_pageType forKey:kZYStatusesPageType];
    [aCoder encodeObject:_geo forKey:kZYStatusesGeo];
    [aCoder encodeObject:_retweetedStatus forKey:kZYStatusesRetweetedStatus];
    [aCoder encodeObject:_user forKey:kZYStatusesUser];
    [aCoder encodeObject:_textTagTips forKey:kZYStatusesTextTagTips];
    [aCoder encodeDouble:_commentsCount forKey:kZYStatusesCommentsCount];
    [aCoder encodeObject:_thumbnailPic forKey:kZYStatusesThumbnailPic];
    [aCoder encodeObject:_source forKey:kZYStatusesSource];
    [aCoder encodeDouble:_sourceAllowclick forKey:kZYStatusesSourceAllowclick];
    [aCoder encodeDouble:_bizFeature forKey:kZYStatusesBizFeature];
    [aCoder encodeObject:_annotations forKey:kZYStatusesAnnotations];
    [aCoder encodeObject:_bmiddlePic forKey:kZYStatusesBmiddlePic];
    [aCoder encodeObject:_visible forKey:kZYStatusesVisible];
    [aCoder encodeObject:_inReplyToStatusId forKey:kZYStatusesInReplyToStatusId];
    [aCoder encodeObject:_mid forKey:kZYStatusesMid];
    [aCoder encodeDouble:_repostsCount forKey:kZYStatusesRepostsCount];
    [aCoder encodeDouble:_userType forKey:kZYStatusesUserType];
    [aCoder encodeDouble:_attitudesCount forKey:kZYStatusesAttitudesCount];
    [aCoder encodeObject:_darwinTags forKey:kZYStatusesDarwinTags];
    [aCoder encodeDouble:_mlevel forKey:kZYStatusesMlevel];
    [aCoder encodeObject:_rid forKey:kZYStatusesRid];
    [aCoder encodeObject:_inReplyToUserId forKey:kZYStatusesInReplyToUserId];
    [aCoder encodeObject:_originalPic forKey:kZYStatusesOriginalPic];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZYStatuses *copy = [[ZYStatuses alloc] init];
    
    if (copy) {

        copy.favorited = self.favorited;
        copy.truncated = self.truncated;
        copy.statusesIdentifier = self.statusesIdentifier;
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.inReplyToScreenName = [self.inReplyToScreenName copyWithZone:zone];
        copy.isLongText = self.isLongText;
        copy.picUrls = [self.picUrls copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
        copy.idstr = [self.idstr copyWithZone:zone];
        copy.textLength = self.textLength;
        copy.sourceType = self.sourceType;
        copy.hotWeiboTags = [self.hotWeiboTags copyWithZone:zone];
        copy.pageType = self.pageType;
        copy.geo = [self.geo copyWithZone:zone];
        copy.retweetedStatus = [self.retweetedStatus copyWithZone:zone];
        copy.user = [self.user copyWithZone:zone];
        copy.textTagTips = [self.textTagTips copyWithZone:zone];
        copy.commentsCount = self.commentsCount;
        copy.thumbnailPic = [self.thumbnailPic copyWithZone:zone];
        copy.source = [self.source copyWithZone:zone];
        copy.sourceAllowclick = self.sourceAllowclick;
        copy.bizFeature = self.bizFeature;
        copy.annotations = [self.annotations copyWithZone:zone];
        copy.bmiddlePic = [self.bmiddlePic copyWithZone:zone];
        copy.visible = [self.visible copyWithZone:zone];
        copy.inReplyToStatusId = [self.inReplyToStatusId copyWithZone:zone];
        copy.mid = [self.mid copyWithZone:zone];
        copy.repostsCount = self.repostsCount;
        copy.userType = self.userType;
        copy.attitudesCount = self.attitudesCount;
        copy.darwinTags = [self.darwinTags copyWithZone:zone];
        copy.mlevel = self.mlevel;
        copy.rid = [self.rid copyWithZone:zone];
        copy.inReplyToUserId = [self.inReplyToUserId copyWithZone:zone];
        copy.originalPic = [self.originalPic copyWithZone:zone];
    }
    
    return copy;
}


@end
