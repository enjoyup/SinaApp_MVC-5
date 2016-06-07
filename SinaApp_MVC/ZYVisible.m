//
//  ZYVisible.m
//
//  Created by 宇冬 李 on 16/5/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZYVisible.h"


NSString *const kZYVisibleType = @"type";
NSString *const kZYVisibleListId = @"list_id";


@interface ZYVisible ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZYVisible

@synthesize type = _type;
@synthesize listId = _listId;


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
            self.type = [[self objectOrNilForKey:kZYVisibleType fromDictionary:dict] doubleValue];
            self.listId = [[self objectOrNilForKey:kZYVisibleListId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kZYVisibleType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listId] forKey:kZYVisibleListId];

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

    self.type = [aDecoder decodeDoubleForKey:kZYVisibleType];
    self.listId = [aDecoder decodeDoubleForKey:kZYVisibleListId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_type forKey:kZYVisibleType];
    [aCoder encodeDouble:_listId forKey:kZYVisibleListId];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZYVisible *copy = [[ZYVisible alloc] init];
    
    if (copy) {

        copy.type = self.type;
        copy.listId = self.listId;
    }
    
    return copy;
}


@end
