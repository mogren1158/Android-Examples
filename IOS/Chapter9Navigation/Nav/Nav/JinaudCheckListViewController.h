//
//  JinaudCheckListViewController.h
//  Nav
//
//  Created by Michael Ogren on 5/24/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import "JinaudSecondLevelViewController.h"

@interface JinaudCheckListViewController : JinaudSecondLevelViewController
@property(copy, nonatomic) NSArray * snacks;
@property (assign, nonatomic) NSUInteger selectedSnack;

@end
