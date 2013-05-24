//
//  JinaudDisclosureButtonViewController.h
//  Nav
//
//  Created by Michael Ogren on 5/24/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import "JinaudSecondLevelViewController.h"

@class JinaudDisclosureDetailViewController;

@interface JinaudDisclosureButtonViewController : JinaudSecondLevelViewController
@property(copy, nonatomic) NSArray * movies;
@property(strong, nonatomic) JinaudDisclosureDetailViewController * detailController;
@end
