//
//  ZYUser.m
//
//  Created by 宇冬 李 on 16/5/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZYUser.h"


NSString *const kZYUserCoverImagePhone = @"cover_image_phone";
NSString *const kZYUserId = @"id";
NSString *const kZYUserBiFollowersCount = @"bi_followers_count";
NSString *const kZYUserUrank = @"urank";
NSString *const kZYUserProfileImageUrl = @"profile_image_url";
NSString *const kZYUserClass = @"class";
NSString *const kZYUserVerifiedContactEmail = @"verified_contact_email";
NSString *const kZYUserProvince = @"province";
NSString *const kZYUserVerified = @"verified";
NSString *const kZYUserUrl = @"url";
NSString *const kZYUserFollowMe = @"follow_me";
NSString *const kZYUserGeoEnabled = @"geo_enabled";
NSString *const kZYUserStatusesCount = @"statuses_count";
NSString *const kZYUserDescription = @"description";
NSString *const kZYUserFollowersCount = @"followers_count";
NSString *const kZYUserVerifiedContactMobile = @"verified_contact_mobile";
NSString *const kZYUserLocation = @"location";
NSString *const kZYUserMbrank = @"mbrank";
NSString *const kZYUserAvatarLarge = @"avatar_large";
NSString *const kZYUserStar = @"star";
NSString *const kZYUserVerifiedTrade = @"verified_trade";
NSString *const kZYUserWeihao = @"weihao";
NSString *const kZYUserCoverImage = @"cover_image";
NSString *const kZYUserOnlineStatus = @"online_status";
NSString *const kZYUserProfileUrl = @"profile_url";
NSString *const kZYUserVerifiedContactName = @"verified_contact_name";
NSString *const kZYUserVerifiedSourceUrl = @"verified_source_url";
NSString *const kZYUserScreenName = @"screen_name";
NSString *const kZYUserPagefriendsCount = @"pagefriends_count";
NSString *const kZYUserVerifiedReason = @"verified_reason";
NSString *const kZYUserName = @"name";
NSString *const kZYUserFriendsCount = @"friends_count";
NSString *const kZYUserMbtype = @"mbtype";
NSString *const kZYUserBlockApp = @"block_app";
NSString *const kZYUserAvatarHd = @"avatar_hd";
NSString *const kZYUserCreditScore = @"credit_score";
NSString *const kZYUserRemark = @"remark";
NSString *const kZYUserCreatedAt = @"created_at";
NSString *const kZYUserBlockWord = @"block_word";
NSString *const kZYUserAllowAllActMsg = @"allow_all_act_msg";
NSString *const kZYUserVerifiedState = @"verified_state";
NSString *const kZYUserDomain = @"domain";
NSString *const kZYUserVerifiedReasonModified = @"verified_reason_modified";
NSString *const kZYUserAllowAllComment = @"allow_all_comment";
NSString *const kZYUserVerifiedLevel = @"verified_level";
NSString *const kZYUserVerifiedReasonUrl = @"verified_reason_url";
NSString *const kZYUserGender = @"gender";
NSString *const kZYUserFavouritesCount = @"favourites_count";
NSString *const kZYUserIdstr = @"idstr";
NSString *const kZYUserVerifiedType = @"verified_type";
NSString *const kZYUserCity = @"city";
NSString *const kZYUserVerifiedSource = @"verified_source";
NSString *const kZYUserUserAbility = @"user_ability";
NSString *const kZYUserLang = @"lang";
NSString *const kZYUserPtype = @"ptype";
NSString *const kZYUserFollowing = @"following";


@interface ZYUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZYUser

@synthesize coverImagePhone = _coverImagePhone;
@synthesize userIdentifier = _userIdentifier;
@synthesize biFollowersCount = _biFollowersCount;
@synthesize urank = _urank;
@synthesize profileImageUrl = _profileImageUrl;
@synthesize classProperty = _classProperty;
@synthesize verifiedContactEmail = _verifiedContactEmail;
@synthesize province = _province;
@synthesize verified = _verified;
@synthesize url = _url;
@synthesize followMe = _followMe;
@synthesize geoEnabled = _geoEnabled;
@synthesize statusesCount = _statusesCount;
@synthesize userDescription = _userDescription;
@synthesize followersCount = _followersCount;
@synthesize verifiedContactMobile = _verifiedContactMobile;
@synthesize location = _location;
@synthesize mbrank = _mbrank;
@synthesize avatarLarge = _avatarLarge;
@synthesize star = _star;
@synthesize verifiedTrade = _verifiedTrade;
@synthesize weihao = _weihao;
@synthesize coverImage = _coverImage;
@synthesize onlineStatus = _onlineStatus;
@synthesize profileUrl = _profileUrl;
@synthesize verifiedContactName = _verifiedContactName;
@synthesize verifiedSourceUrl = _verifiedSourceUrl;
@synthesize screenName = _screenName;
@synthesize pagefriendsCount = _pagefriendsCount;
@synthesize verifiedReason = _verifiedReason;
@synthesize name = _name;
@synthesize friendsCount = _friendsCount;
@synthesize mbtype = _mbtype;
@synthesize blockApp = _blockApp;
@synthesize avatarHd = _avatarHd;
@synthesize creditScore = _creditScore;
@synthesize remark = _remark;
@synthesize createdAt = _createdAt;
@synthesize blockWord = _blockWord;
@synthesize allowAllActMsg = _allowAllActMsg;
@synthesize verifiedState = _verifiedState;
@synthesize domain = _domain;
@synthesize verifiedReasonModified = _verifiedReasonModified;
@synthesize allowAllComment = _allowAllComment;
@synthesize verifiedLevel = _verifiedLevel;
@synthesize verifiedReasonUrl = _verifiedReasonUrl;
@synthesize gender = _gender;
@synthesize favouritesCount = _favouritesCount;
@synthesize idstr = _idstr;
@synthesize verifiedType = _verifiedType;
@synthesize city = _city;
@synthesize verifiedSource = _verifiedSource;
@synthesize userAbility = _userAbility;
@synthesize lang = _lang;
@synthesize ptype = _ptype;
@synthesize following = _following;


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
            self.coverImagePhone = [self objectOrNilForKey:kZYUserCoverImagePhone fromDictionary:dict];
            self.userIdentifier = [[self objectOrNilForKey:kZYUserId fromDictionary:dict] doubleValue];
            self.biFollowersCount = [[self objectOrNilForKey:kZYUserBiFollowersCount fromDictionary:dict] doubleValue];
            self.urank = [[self objectOrNilForKey:kZYUserUrank fromDictionary:dict] doubleValue];
            self.profileImageUrl = [self objectOrNilForKey:kZYUserProfileImageUrl fromDictionary:dict];
            self.classProperty = [[self objectOrNilForKey:kZYUserClass fromDictionary:dict] doubleValue];
            self.verifiedContactEmail = [self objectOrNilForKey:kZYUserVerifiedContactEmail fromDictionary:dict];
            self.province = [self objectOrNilForKey:kZYUserProvince fromDictionary:dict];
            self.verified = [[self objectOrNilForKey:kZYUserVerified fromDictionary:dict] boolValue];
            self.url = [self objectOrNilForKey:kZYUserUrl fromDictionary:dict];
            self.followMe = [[self objectOrNilForKey:kZYUserFollowMe fromDictionary:dict] boolValue];
            self.geoEnabled = [[self objectOrNilForKey:kZYUserGeoEnabled fromDictionary:dict] boolValue];
            self.statusesCount = [[self objectOrNilForKey:kZYUserStatusesCount fromDictionary:dict] doubleValue];
            self.userDescription = [self objectOrNilForKey:kZYUserDescription fromDictionary:dict];
            self.followersCount = [[self objectOrNilForKey:kZYUserFollowersCount fromDictionary:dict] doubleValue];
            self.verifiedContactMobile = [self objectOrNilForKey:kZYUserVerifiedContactMobile fromDictionary:dict];
            self.location = [self objectOrNilForKey:kZYUserLocation fromDictionary:dict];
            self.mbrank = [[self objectOrNilForKey:kZYUserMbrank fromDictionary:dict] doubleValue];
            self.avatarLarge = [self objectOrNilForKey:kZYUserAvatarLarge fromDictionary:dict];
            self.star = [[self objectOrNilForKey:kZYUserStar fromDictionary:dict] doubleValue];
            self.verifiedTrade = [self objectOrNilForKey:kZYUserVerifiedTrade fromDictionary:dict];
            self.weihao = [self objectOrNilForKey:kZYUserWeihao fromDictionary:dict];
            self.coverImage = [self objectOrNilForKey:kZYUserCoverImage fromDictionary:dict];
            self.onlineStatus = [[self objectOrNilForKey:kZYUserOnlineStatus fromDictionary:dict] doubleValue];
            self.profileUrl = [self objectOrNilForKey:kZYUserProfileUrl fromDictionary:dict];
            self.verifiedContactName = [self objectOrNilForKey:kZYUserVerifiedContactName fromDictionary:dict];
            self.verifiedSourceUrl = [self objectOrNilForKey:kZYUserVerifiedSourceUrl fromDictionary:dict];
            self.screenName = [self objectOrNilForKey:kZYUserScreenName fromDictionary:dict];
            self.pagefriendsCount = [[self objectOrNilForKey:kZYUserPagefriendsCount fromDictionary:dict] doubleValue];
            self.verifiedReason = [self objectOrNilForKey:kZYUserVerifiedReason fromDictionary:dict];
            self.name = [self objectOrNilForKey:kZYUserName fromDictionary:dict];
            self.friendsCount = [[self objectOrNilForKey:kZYUserFriendsCount fromDictionary:dict] doubleValue];
            self.mbtype = [[self objectOrNilForKey:kZYUserMbtype fromDictionary:dict] doubleValue];
            self.blockApp = [[self objectOrNilForKey:kZYUserBlockApp fromDictionary:dict] doubleValue];
            self.avatarHd = [self objectOrNilForKey:kZYUserAvatarHd fromDictionary:dict];
            self.creditScore = [[self objectOrNilForKey:kZYUserCreditScore fromDictionary:dict] doubleValue];
            self.remark = [self objectOrNilForKey:kZYUserRemark fromDictionary:dict];
            self.createdAt = [self objectOrNilForKey:kZYUserCreatedAt fromDictionary:dict];
            self.blockWord = [[self objectOrNilForKey:kZYUserBlockWord fromDictionary:dict] doubleValue];
            self.allowAllActMsg = [[self objectOrNilForKey:kZYUserAllowAllActMsg fromDictionary:dict] boolValue];
            self.verifiedState = [[self objectOrNilForKey:kZYUserVerifiedState fromDictionary:dict] doubleValue];
            self.domain = [self objectOrNilForKey:kZYUserDomain fromDictionary:dict];
            self.verifiedReasonModified = [self objectOrNilForKey:kZYUserVerifiedReasonModified fromDictionary:dict];
            self.allowAllComment = [[self objectOrNilForKey:kZYUserAllowAllComment fromDictionary:dict] boolValue];
            self.verifiedLevel = [[self objectOrNilForKey:kZYUserVerifiedLevel fromDictionary:dict] doubleValue];
            self.verifiedReasonUrl = [self objectOrNilForKey:kZYUserVerifiedReasonUrl fromDictionary:dict];
            self.gender = [self objectOrNilForKey:kZYUserGender fromDictionary:dict];
            self.favouritesCount = [[self objectOrNilForKey:kZYUserFavouritesCount fromDictionary:dict] doubleValue];
            self.idstr = [self objectOrNilForKey:kZYUserIdstr fromDictionary:dict];
            self.verifiedType = [[self objectOrNilForKey:kZYUserVerifiedType fromDictionary:dict] doubleValue];
            self.city = [self objectOrNilForKey:kZYUserCity fromDictionary:dict];
            self.verifiedSource = [self objectOrNilForKey:kZYUserVerifiedSource fromDictionary:dict];
            self.userAbility = [[self objectOrNilForKey:kZYUserUserAbility fromDictionary:dict] doubleValue];
            self.lang = [self objectOrNilForKey:kZYUserLang fromDictionary:dict];
            self.ptype = [[self objectOrNilForKey:kZYUserPtype fromDictionary:dict] doubleValue];
            self.following = [[self objectOrNilForKey:kZYUserFollowing fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.coverImagePhone forKey:kZYUserCoverImagePhone];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userIdentifier] forKey:kZYUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.biFollowersCount] forKey:kZYUserBiFollowersCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.urank] forKey:kZYUserUrank];
    [mutableDict setValue:self.profileImageUrl forKey:kZYUserProfileImageUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.classProperty] forKey:kZYUserClass];
    [mutableDict setValue:self.verifiedContactEmail forKey:kZYUserVerifiedContactEmail];
    [mutableDict setValue:self.province forKey:kZYUserProvince];
    [mutableDict setValue:[NSNumber numberWithBool:self.verified] forKey:kZYUserVerified];
    [mutableDict setValue:self.url forKey:kZYUserUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.followMe] forKey:kZYUserFollowMe];
    [mutableDict setValue:[NSNumber numberWithBool:self.geoEnabled] forKey:kZYUserGeoEnabled];
    [mutableDict setValue:[NSNumber numberWithDouble:self.statusesCount] forKey:kZYUserStatusesCount];
    [mutableDict setValue:self.userDescription forKey:kZYUserDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.followersCount] forKey:kZYUserFollowersCount];
    [mutableDict setValue:self.verifiedContactMobile forKey:kZYUserVerifiedContactMobile];
    [mutableDict setValue:self.location forKey:kZYUserLocation];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mbrank] forKey:kZYUserMbrank];
    [mutableDict setValue:self.avatarLarge forKey:kZYUserAvatarLarge];
    [mutableDict setValue:[NSNumber numberWithDouble:self.star] forKey:kZYUserStar];
    [mutableDict setValue:self.verifiedTrade forKey:kZYUserVerifiedTrade];
    [mutableDict setValue:self.weihao forKey:kZYUserWeihao];
    [mutableDict setValue:self.coverImage forKey:kZYUserCoverImage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.onlineStatus] forKey:kZYUserOnlineStatus];
    [mutableDict setValue:self.profileUrl forKey:kZYUserProfileUrl];
    [mutableDict setValue:self.verifiedContactName forKey:kZYUserVerifiedContactName];
    [mutableDict setValue:self.verifiedSourceUrl forKey:kZYUserVerifiedSourceUrl];
    [mutableDict setValue:self.screenName forKey:kZYUserScreenName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pagefriendsCount] forKey:kZYUserPagefriendsCount];
    [mutableDict setValue:self.verifiedReason forKey:kZYUserVerifiedReason];
    [mutableDict setValue:self.name forKey:kZYUserName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.friendsCount] forKey:kZYUserFriendsCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mbtype] forKey:kZYUserMbtype];
    [mutableDict setValue:[NSNumber numberWithDouble:self.blockApp] forKey:kZYUserBlockApp];
    [mutableDict setValue:self.avatarHd forKey:kZYUserAvatarHd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.creditScore] forKey:kZYUserCreditScore];
    [mutableDict setValue:self.remark forKey:kZYUserRemark];
    [mutableDict setValue:self.createdAt forKey:kZYUserCreatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.blockWord] forKey:kZYUserBlockWord];
    [mutableDict setValue:[NSNumber numberWithBool:self.allowAllActMsg] forKey:kZYUserAllowAllActMsg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.verifiedState] forKey:kZYUserVerifiedState];
    [mutableDict setValue:self.domain forKey:kZYUserDomain];
    [mutableDict setValue:self.verifiedReasonModified forKey:kZYUserVerifiedReasonModified];
    [mutableDict setValue:[NSNumber numberWithBool:self.allowAllComment] forKey:kZYUserAllowAllComment];
    [mutableDict setValue:[NSNumber numberWithDouble:self.verifiedLevel] forKey:kZYUserVerifiedLevel];
    [mutableDict setValue:self.verifiedReasonUrl forKey:kZYUserVerifiedReasonUrl];
    [mutableDict setValue:self.gender forKey:kZYUserGender];
    [mutableDict setValue:[NSNumber numberWithDouble:self.favouritesCount] forKey:kZYUserFavouritesCount];
    [mutableDict setValue:self.idstr forKey:kZYUserIdstr];
    [mutableDict setValue:[NSNumber numberWithDouble:self.verifiedType] forKey:kZYUserVerifiedType];
    [mutableDict setValue:self.city forKey:kZYUserCity];
    [mutableDict setValue:self.verifiedSource forKey:kZYUserVerifiedSource];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userAbility] forKey:kZYUserUserAbility];
    [mutableDict setValue:self.lang forKey:kZYUserLang];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ptype] forKey:kZYUserPtype];
    [mutableDict setValue:[NSNumber numberWithBool:self.following] forKey:kZYUserFollowing];

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

    self.coverImagePhone = [aDecoder decodeObjectForKey:kZYUserCoverImagePhone];
    self.userIdentifier = [aDecoder decodeDoubleForKey:kZYUserId];
    self.biFollowersCount = [aDecoder decodeDoubleForKey:kZYUserBiFollowersCount];
    self.urank = [aDecoder decodeDoubleForKey:kZYUserUrank];
    self.profileImageUrl = [aDecoder decodeObjectForKey:kZYUserProfileImageUrl];
    self.classProperty = [aDecoder decodeDoubleForKey:kZYUserClass];
    self.verifiedContactEmail = [aDecoder decodeObjectForKey:kZYUserVerifiedContactEmail];
    self.province = [aDecoder decodeObjectForKey:kZYUserProvince];
    self.verified = [aDecoder decodeBoolForKey:kZYUserVerified];
    self.url = [aDecoder decodeObjectForKey:kZYUserUrl];
    self.followMe = [aDecoder decodeBoolForKey:kZYUserFollowMe];
    self.geoEnabled = [aDecoder decodeBoolForKey:kZYUserGeoEnabled];
    self.statusesCount = [aDecoder decodeDoubleForKey:kZYUserStatusesCount];
    self.userDescription = [aDecoder decodeObjectForKey:kZYUserDescription];
    self.followersCount = [aDecoder decodeDoubleForKey:kZYUserFollowersCount];
    self.verifiedContactMobile = [aDecoder decodeObjectForKey:kZYUserVerifiedContactMobile];
    self.location = [aDecoder decodeObjectForKey:kZYUserLocation];
    self.mbrank = [aDecoder decodeDoubleForKey:kZYUserMbrank];
    self.avatarLarge = [aDecoder decodeObjectForKey:kZYUserAvatarLarge];
    self.star = [aDecoder decodeDoubleForKey:kZYUserStar];
    self.verifiedTrade = [aDecoder decodeObjectForKey:kZYUserVerifiedTrade];
    self.weihao = [aDecoder decodeObjectForKey:kZYUserWeihao];
    self.coverImage = [aDecoder decodeObjectForKey:kZYUserCoverImage];
    self.onlineStatus = [aDecoder decodeDoubleForKey:kZYUserOnlineStatus];
    self.profileUrl = [aDecoder decodeObjectForKey:kZYUserProfileUrl];
    self.verifiedContactName = [aDecoder decodeObjectForKey:kZYUserVerifiedContactName];
    self.verifiedSourceUrl = [aDecoder decodeObjectForKey:kZYUserVerifiedSourceUrl];
    self.screenName = [aDecoder decodeObjectForKey:kZYUserScreenName];
    self.pagefriendsCount = [aDecoder decodeDoubleForKey:kZYUserPagefriendsCount];
    self.verifiedReason = [aDecoder decodeObjectForKey:kZYUserVerifiedReason];
    self.name = [aDecoder decodeObjectForKey:kZYUserName];
    self.friendsCount = [aDecoder decodeDoubleForKey:kZYUserFriendsCount];
    self.mbtype = [aDecoder decodeDoubleForKey:kZYUserMbtype];
    self.blockApp = [aDecoder decodeDoubleForKey:kZYUserBlockApp];
    self.avatarHd = [aDecoder decodeObjectForKey:kZYUserAvatarHd];
    self.creditScore = [aDecoder decodeDoubleForKey:kZYUserCreditScore];
    self.remark = [aDecoder decodeObjectForKey:kZYUserRemark];
    self.createdAt = [aDecoder decodeObjectForKey:kZYUserCreatedAt];
    self.blockWord = [aDecoder decodeDoubleForKey:kZYUserBlockWord];
    self.allowAllActMsg = [aDecoder decodeBoolForKey:kZYUserAllowAllActMsg];
    self.verifiedState = [aDecoder decodeDoubleForKey:kZYUserVerifiedState];
    self.domain = [aDecoder decodeObjectForKey:kZYUserDomain];
    self.verifiedReasonModified = [aDecoder decodeObjectForKey:kZYUserVerifiedReasonModified];
    self.allowAllComment = [aDecoder decodeBoolForKey:kZYUserAllowAllComment];
    self.verifiedLevel = [aDecoder decodeDoubleForKey:kZYUserVerifiedLevel];
    self.verifiedReasonUrl = [aDecoder decodeObjectForKey:kZYUserVerifiedReasonUrl];
    self.gender = [aDecoder decodeObjectForKey:kZYUserGender];
    self.favouritesCount = [aDecoder decodeDoubleForKey:kZYUserFavouritesCount];
    self.idstr = [aDecoder decodeObjectForKey:kZYUserIdstr];
    self.verifiedType = [aDecoder decodeDoubleForKey:kZYUserVerifiedType];
    self.city = [aDecoder decodeObjectForKey:kZYUserCity];
    self.verifiedSource = [aDecoder decodeObjectForKey:kZYUserVerifiedSource];
    self.userAbility = [aDecoder decodeDoubleForKey:kZYUserUserAbility];
    self.lang = [aDecoder decodeObjectForKey:kZYUserLang];
    self.ptype = [aDecoder decodeDoubleForKey:kZYUserPtype];
    self.following = [aDecoder decodeBoolForKey:kZYUserFollowing];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_coverImagePhone forKey:kZYUserCoverImagePhone];
    [aCoder encodeDouble:_userIdentifier forKey:kZYUserId];
    [aCoder encodeDouble:_biFollowersCount forKey:kZYUserBiFollowersCount];
    [aCoder encodeDouble:_urank forKey:kZYUserUrank];
    [aCoder encodeObject:_profileImageUrl forKey:kZYUserProfileImageUrl];
    [aCoder encodeDouble:_classProperty forKey:kZYUserClass];
    [aCoder encodeObject:_verifiedContactEmail forKey:kZYUserVerifiedContactEmail];
    [aCoder encodeObject:_province forKey:kZYUserProvince];
    [aCoder encodeBool:_verified forKey:kZYUserVerified];
    [aCoder encodeObject:_url forKey:kZYUserUrl];
    [aCoder encodeBool:_followMe forKey:kZYUserFollowMe];
    [aCoder encodeBool:_geoEnabled forKey:kZYUserGeoEnabled];
    [aCoder encodeDouble:_statusesCount forKey:kZYUserStatusesCount];
    [aCoder encodeObject:_userDescription forKey:kZYUserDescription];
    [aCoder encodeDouble:_followersCount forKey:kZYUserFollowersCount];
    [aCoder encodeObject:_verifiedContactMobile forKey:kZYUserVerifiedContactMobile];
    [aCoder encodeObject:_location forKey:kZYUserLocation];
    [aCoder encodeDouble:_mbrank forKey:kZYUserMbrank];
    [aCoder encodeObject:_avatarLarge forKey:kZYUserAvatarLarge];
    [aCoder encodeDouble:_star forKey:kZYUserStar];
    [aCoder encodeObject:_verifiedTrade forKey:kZYUserVerifiedTrade];
    [aCoder encodeObject:_weihao forKey:kZYUserWeihao];
    [aCoder encodeObject:_coverImage forKey:kZYUserCoverImage];
    [aCoder encodeDouble:_onlineStatus forKey:kZYUserOnlineStatus];
    [aCoder encodeObject:_profileUrl forKey:kZYUserProfileUrl];
    [aCoder encodeObject:_verifiedContactName forKey:kZYUserVerifiedContactName];
    [aCoder encodeObject:_verifiedSourceUrl forKey:kZYUserVerifiedSourceUrl];
    [aCoder encodeObject:_screenName forKey:kZYUserScreenName];
    [aCoder encodeDouble:_pagefriendsCount forKey:kZYUserPagefriendsCount];
    [aCoder encodeObject:_verifiedReason forKey:kZYUserVerifiedReason];
    [aCoder encodeObject:_name forKey:kZYUserName];
    [aCoder encodeDouble:_friendsCount forKey:kZYUserFriendsCount];
    [aCoder encodeDouble:_mbtype forKey:kZYUserMbtype];
    [aCoder encodeDouble:_blockApp forKey:kZYUserBlockApp];
    [aCoder encodeObject:_avatarHd forKey:kZYUserAvatarHd];
    [aCoder encodeDouble:_creditScore forKey:kZYUserCreditScore];
    [aCoder encodeObject:_remark forKey:kZYUserRemark];
    [aCoder encodeObject:_createdAt forKey:kZYUserCreatedAt];
    [aCoder encodeDouble:_blockWord forKey:kZYUserBlockWord];
    [aCoder encodeBool:_allowAllActMsg forKey:kZYUserAllowAllActMsg];
    [aCoder encodeDouble:_verifiedState forKey:kZYUserVerifiedState];
    [aCoder encodeObject:_domain forKey:kZYUserDomain];
    [aCoder encodeObject:_verifiedReasonModified forKey:kZYUserVerifiedReasonModified];
    [aCoder encodeBool:_allowAllComment forKey:kZYUserAllowAllComment];
    [aCoder encodeDouble:_verifiedLevel forKey:kZYUserVerifiedLevel];
    [aCoder encodeObject:_verifiedReasonUrl forKey:kZYUserVerifiedReasonUrl];
    [aCoder encodeObject:_gender forKey:kZYUserGender];
    [aCoder encodeDouble:_favouritesCount forKey:kZYUserFavouritesCount];
    [aCoder encodeObject:_idstr forKey:kZYUserIdstr];
    [aCoder encodeDouble:_verifiedType forKey:kZYUserVerifiedType];
    [aCoder encodeObject:_city forKey:kZYUserCity];
    [aCoder encodeObject:_verifiedSource forKey:kZYUserVerifiedSource];
    [aCoder encodeDouble:_userAbility forKey:kZYUserUserAbility];
    [aCoder encodeObject:_lang forKey:kZYUserLang];
    [aCoder encodeDouble:_ptype forKey:kZYUserPtype];
    [aCoder encodeBool:_following forKey:kZYUserFollowing];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZYUser *copy = [[ZYUser alloc] init];
    
    if (copy) {

        copy.coverImagePhone = [self.coverImagePhone copyWithZone:zone];
        copy.userIdentifier = self.userIdentifier;
        copy.biFollowersCount = self.biFollowersCount;
        copy.urank = self.urank;
        copy.profileImageUrl = [self.profileImageUrl copyWithZone:zone];
        copy.classProperty = self.classProperty;
        copy.verifiedContactEmail = [self.verifiedContactEmail copyWithZone:zone];
        copy.province = [self.province copyWithZone:zone];
        copy.verified = self.verified;
        copy.url = [self.url copyWithZone:zone];
        copy.followMe = self.followMe;
        copy.geoEnabled = self.geoEnabled;
        copy.statusesCount = self.statusesCount;
        copy.userDescription = [self.userDescription copyWithZone:zone];
        copy.followersCount = self.followersCount;
        copy.verifiedContactMobile = [self.verifiedContactMobile copyWithZone:zone];
        copy.location = [self.location copyWithZone:zone];
        copy.mbrank = self.mbrank;
        copy.avatarLarge = [self.avatarLarge copyWithZone:zone];
        copy.star = self.star;
        copy.verifiedTrade = [self.verifiedTrade copyWithZone:zone];
        copy.weihao = [self.weihao copyWithZone:zone];
        copy.coverImage = [self.coverImage copyWithZone:zone];
        copy.onlineStatus = self.onlineStatus;
        copy.profileUrl = [self.profileUrl copyWithZone:zone];
        copy.verifiedContactName = [self.verifiedContactName copyWithZone:zone];
        copy.verifiedSourceUrl = [self.verifiedSourceUrl copyWithZone:zone];
        copy.screenName = [self.screenName copyWithZone:zone];
        copy.pagefriendsCount = self.pagefriendsCount;
        copy.verifiedReason = [self.verifiedReason copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.friendsCount = self.friendsCount;
        copy.mbtype = self.mbtype;
        copy.blockApp = self.blockApp;
        copy.avatarHd = [self.avatarHd copyWithZone:zone];
        copy.creditScore = self.creditScore;
        copy.remark = [self.remark copyWithZone:zone];
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.blockWord = self.blockWord;
        copy.allowAllActMsg = self.allowAllActMsg;
        copy.verifiedState = self.verifiedState;
        copy.domain = [self.domain copyWithZone:zone];
        copy.verifiedReasonModified = [self.verifiedReasonModified copyWithZone:zone];
        copy.allowAllComment = self.allowAllComment;
        copy.verifiedLevel = self.verifiedLevel;
        copy.verifiedReasonUrl = [self.verifiedReasonUrl copyWithZone:zone];
        copy.gender = [self.gender copyWithZone:zone];
        copy.favouritesCount = self.favouritesCount;
        copy.idstr = [self.idstr copyWithZone:zone];
        copy.verifiedType = self.verifiedType;
        copy.city = [self.city copyWithZone:zone];
        copy.verifiedSource = [self.verifiedSource copyWithZone:zone];
        copy.userAbility = self.userAbility;
        copy.lang = [self.lang copyWithZone:zone];
        copy.ptype = self.ptype;
        copy.following = self.following;
    }
    
    return copy;
}


@end
