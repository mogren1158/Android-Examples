//
//  JinaudPresident.h
//  Nav
//
//  Created by Michael Ogren on 5/24/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JinaudPresident : NSObject <NSCopying, NSCoding>

@property (assign, nonatomic) NSInteger number;
@property (copy, nonatomic) NSString * name;
@property (copy, nonatomic) NSString * fromYear;
@property (copy, nonatomic) NSString * toYear;
@property (copy, nonatomic) NSString * party;

@end
