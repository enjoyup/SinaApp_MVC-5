//
//  ZYweibo.m
//
//  Created by 宇冬 李 on 16/5/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZYweibo.h"
#import "ZYStatuses.h"


NSString *const kZYweiboAd = @"ad";
NSString *const kZYweiboHasvisible = @"hasvisible";
NSString *const kZYweiboHasUnread = @"has_unread";
NSString *const kZYweiboAdvertises = @"advertises";
NSString *const kZYweiboPreviousCursor = @"previous_cursor";
NSString *const kZYweiboUveBlank = @"uve_blank";
NSString *const kZYweiboTotalNumber = @"total_number";
NSString *const kZYweiboInterval = @"interval";
NSString *const kZYweiboMaxId = @"max_id";
NSString *const kZYweiboStatuses = @"statuses";
NSString *const kZYweiboNextCursor = @"next_cursor";
NSString *const kZYweiboSinceId = @"since_id";


@interface ZYweibo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZYweibo

@synthesize ad = _ad;
@synthesize hasvisible = _hasvisible;
@synthesize hasUnread = _hasUnread;
@synthesize advertises = _advertises;
@synthesize previousCursor = _previousCursor;
@synthesize uveBlank = _uveBlank;
@synthesize totalNumber = _totalNumber;
@synthesize interval = _interval;
@synthesize maxId = _maxId;
@synthesize statuses = _statuses;
@synthesize nextCursor = _nextCursor;
@synthesize sinceId = _sinceId;


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
            self.ad = [self objectOrNilForKey:kZYweiboAd fromDictionary:dict];
            self.hasvisible = [[self objectOrNilForKey:kZYweiboHasvisible fromDictionary:dict] boolValue];
            self.hasUnread = [[self objectOrNilForKey:kZYweiboHasUnread fromDictionary:dict] doubleValue];
            self.advertises = [self objectOrNilForKey:kZYweiboAdvertises fromDictionary:dict];
            self.previousCursor = [[self objectOrNilForKey:kZYweiboPreviousCursor fromDictionary:dict] doubleValue];
            self.uveBlank = [[self objectOrNilForKey:kZYweiboUveBlank fromDictionary:dict] doubleValue];
            self.totalNumber = [[self objectOrNilForKey:kZYweiboTotalNumber fromDictionary:dict] doubleValue];
            self.interval = [[self objectOrNilForKey:kZYweiboInterval fromDictionary:dict] doubleValue];
            self.maxId = [[self objectOrNilForKey:kZYweiboMaxId fromDictionary:dict] doubleValue];
    NSObject *receivedZYStatuses = [dict objectForKey:kZYweiboStatuses];
    NSMutableArray *parsedZYStatuses = [NSMutableArray array];
    if ([receivedZYStatuses isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZYStatuses) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZYStatuses addObject:[ZYStatuses modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZYStatuses isKindOfClass:[NSDictionary class]]) {
       [parsedZYStatuses addObject:[ZYStatuses modelObjectWithDictionary:(NSDictionary *)receivedZYStatuses]];
    }

    self.statuses = [NSArray arrayWithArray:parsedZYStatuses];
            self.nextCursor = [[self objectOrNilForKey:kZYweiboNextCursor fromDictionary:dict] doubleValue];
            self.sinceId = [[self objectOrNilForKey:kZYweiboSinceId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForAd = [NSMutableArray array];
    for (NSObject *subArrayObject in self.ad) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAd addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAd addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAd] forKey:kZYweiboAd];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasvisible] forKey:kZYweiboHasvisible];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasUnread] forKey:kZYweiboHasUnread];
    NSMutableArray *tempArrayForAdvertises = [NSMutableArray array];
    for (NSObject *subArrayObject in self.advertises) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAdvertises addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAdvertises addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAdvertises] forKey:kZYweiboAdvertises];
    [mutableDict setValue:[NSNumber numberWithDouble:self.previousCursor] forKey:kZYweiboPreviousCursor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uveBlank] forKey:kZYweiboUveBlank];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalNumber] forKey:kZYweiboTotalNumber];
    [mutableDict setValue:[NSNumber numberWithDouble:self.interval] forKey:kZYweiboInterval];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maxId] forKey:kZYweiboMaxId];
    NSMutableArray *tempArrayForStatuses = [NSMutableArray array];
    for (NSObject *subArrayObject in self.statuses) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForStatuses addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForStatuses addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForStatuses] forKey:kZYweiboStatuses];
    [mutableDict setValue:[NSNumber numberWithDouble:self.nextCursor] forKey:kZYweiboNextCursor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sinceId] forKey:kZYweiboSinceId];

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

    self.ad = [aDecoder decodeObjectForKey:kZYweiboAd];
    self.hasvisible = [aDecoder decodeBoolForKey:kZYweiboHasvisible];
    self.hasUnread = [aDecoder decodeDoubleForKey:kZYweiboHasUnread];
    self.advertises = [aDecoder decodeObjectForKey:kZYweiboAdvertises];
    self.previousCursor = [aDecoder decodeDoubleForKey:kZYweiboPreviousCursor];
    self.uveBlank = [aDecoder decodeDoubleForKey:kZYweiboUveBlank];
    self.totalNumber = [aDecoder decodeDoubleForKey:kZYweiboTotalNumber];
    self.interval = [aDecoder decodeDoubleForKey:kZYweiboInterval];
    self.maxId = [aDecoder decodeDoubleForKey:kZYweiboMaxId];
    self.statuses = [aDecoder decodeObjectForKey:kZYweiboStatuses];
    self.nextCursor = [aDecoder decodeDoubleForKey:kZYweiboNextCursor];
    self.sinceId = [aDecoder decodeDoubleForKey:kZYweiboSinceId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_ad forKey:kZYweiboAd];
    [aCoder encodeBool:_hasvisible forKey:kZYweiboHasvisible];
    [aCoder encodeDouble:_hasUnread forKey:kZYweiboHasUnread];
    [aCoder encodeObject:_advertises forKey:kZYweiboAdvertises];
    [aCoder encodeDouble:_previousCursor forKey:kZYweiboPreviousCursor];
    [aCoder encodeDouble:_uveBlank forKey:kZYweiboUveBlank];
    [aCoder encodeDouble:_totalNumber forKey:kZYweiboTotalNumber];
    [aCoder encodeDouble:_interval forKey:kZYweiboInterval];
    [aCoder encodeDouble:_maxId forKey:kZYweiboMaxId];
    [aCoder encodeObject:_statuses forKey:kZYweiboStatuses];
    [aCoder encodeDouble:_nextCursor forKey:kZYweiboNextCursor];
    [aCoder encodeDouble:_sinceId forKey:kZYweiboSinceId];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZYweibo *copy = [[ZYweibo alloc] init];
    
    if (copy) {

        copy.ad = [self.ad copyWithZone:zone];
        copy.hasvisible = self.hasvisible;
        copy.hasUnread = self.hasUnread;
        copy.advertises = [self.advertises copyWithZone:zone];
        copy.previousCursor = self.previousCursor;
        copy.uveBlank = self.uveBlank;
        copy.totalNumber = self.totalNumber;
        copy.interval = self.interval;
        copy.maxId = self.maxId;
        copy.statuses = [self.statuses copyWithZone:zone];
        copy.nextCursor = self.nextCursor;
        copy.sinceId = self.sinceId;
    }
    
    return copy;
}


@end
