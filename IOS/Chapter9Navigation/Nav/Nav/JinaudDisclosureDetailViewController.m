//
//  JinaudDisclosureDetailViewController.m
//  Nav
//
//  Created by Michael Ogren on 5/24/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import "JinaudDisclosureDetailViewController.h"

@implementation JinaudDisclosureDetailViewController

-(UILabel*) label
{
    return (id) self.view;
}

-(void) loadView
{
    UILabel *label = [[UILabel alloc]init];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    self.view = label;
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.label.text = self.message;
}

@end
