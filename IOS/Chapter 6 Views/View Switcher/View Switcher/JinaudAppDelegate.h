//
//  JinaudAppDelegate.h
//  View Switcher
//
//  Created by Michael Ogren on 5/22/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JinaudSwitchViewController;

@interface JinaudAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) JinaudSwitchViewController * switchViewController;
@end
