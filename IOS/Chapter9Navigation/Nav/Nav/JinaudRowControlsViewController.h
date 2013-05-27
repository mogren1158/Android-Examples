//
//  JinaudRowControlsViewController.h
//  Nav
//
//  Created by Michael Ogren on 5/24/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import "JinaudSecondLevelViewController.h"

@interface JinaudRowControlsViewController : JinaudSecondLevelViewController

@property(copy, nonatomic) NSArray * characters;

-(IBAction)tappedButton:(UIButton * )sender;

@end
