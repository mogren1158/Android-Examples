//
//  JinaudViewController.h
//  Simple Table
//
//  Created by Michael Ogren on 5/23/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JinaudViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>
@property(copy, nonatomic) NSArray * dwarves;

@end
