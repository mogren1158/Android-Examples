//
//  JinaudSwitchViewController.h
//  View Switcher
//
//  Created by Michael Ogren on 5/22/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BlueViewController;
@class YellowViewController;

@interface JinaudSwitchViewController : UIViewController

@property (strong, nonatomic) BlueViewController * blueViewController;
@property(strong, nonatomic) YellowViewController * yellowViewController;

-(IBAction)switchView:(id)sender;

@end
