//
//  JinaudTaskListViewController.h
//  Simple Storyboard
//
//  Created by Michael Ogren on 5/27/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JinaudTaskListViewController : UITableViewController
@property(strong, nonatomic) NSMutableArray * tasks;
@property(copy, nonatomic) NSDictionary * editedSelection;
@end
