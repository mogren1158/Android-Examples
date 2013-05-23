//
//  JinaudViewController.h
//  Sections
//
//  Created by Michael Ogren on 5/23/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JinaudViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource, UISearchDisplayDelegate>

@property (copy, nonatomic) NSDictionary * names;
@property (copy, nonatomic) NSArray * keys;

@end
