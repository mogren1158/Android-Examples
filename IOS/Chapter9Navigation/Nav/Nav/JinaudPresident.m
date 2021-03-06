//
//  JinaudPresident.m
//  Nav
//
//  Created by Michael Ogren on 5/24/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import "JinaudPresident.h"

static NSString * const kPresidentNumberKey = @"President";
static NSString * const kPresidentNameKey = @"Name";
static NSString * const kPresidentFromKey = @"FromYear";
static NSString * const kPresidentToKey = @"ToYear";
static NSString * const kPresidentPartyKey = @"Party";

@implementation JinaudPresident

#pragma mark - NSCodeing
-(void) encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInt: self.number forKey:kPresidentNumberKey];
    [aCoder encodeObject:self.name forKey:kPresidentNumberKey];
    [aCoder encodeObject:self.fromYear forKey:kPresidentFromKey];
    [aCoder encodeObject:self.toYear forKey:kPresidentToKey];
    [aCoder encodeObject:self.party forKey:kPresidentPartyKey];
}

-(id) initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super init])
    {
        self.number = [aDecoder decodeIntForKey:kPresidentNumberKey];
        self.name = [aDecoder decodeObjectForKey:kPresidentNameKey];
        self.fromYear = [aDecoder decodeObjectForKey:kPresidentFromKey];
        self.toYear = [aDecoder decodeObjectForKey:kPresidentToKey];
        self.party = [aDecoder decodeObjectForKey:kPresidentPartyKey];
    }
    
    return self;
}

-(id)copyWithZone:(NSZone *)zone
{
    JinaudPresident * copy = [[JinaudPresident alloc] init];
    copy.number = self.number;
    copy.name = self.name;
    copy.fromYear = self.fromYear;
    copy.toYear = self.toYear;
    copy.party = self.party;
    
    return copy;
}

@end
