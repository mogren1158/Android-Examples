//
//  JinaudDisclosureDetailViewController.h
//  Nav
//
//  Created by Michael Ogren on 5/24/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import "JinaudSecondLevelViewController.h"

@interface JinaudDisclosureDetailViewController : JinaudSecondLevelViewController

@property(weak, readonly, nonatomic) UILabel * label;
@property(copy, nonatomic) NSString * message;


@end
