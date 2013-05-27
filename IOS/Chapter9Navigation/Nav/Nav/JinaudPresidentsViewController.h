//
//  JinaudPresidentsViewController.h
//  Nav
//
//  Created by Michael Ogren on 5/24/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import "JinaudSecondLevelViewController.h"
#import "JinaudPresidentDetailViewController.h"

@interface JinaudPresidentsViewController : JinaudSecondLevelViewController
<JinaudPresidentDetailViewControllerDelegate>

@property(strong, nonatomic) NSMutableArray * presidents;

@end
