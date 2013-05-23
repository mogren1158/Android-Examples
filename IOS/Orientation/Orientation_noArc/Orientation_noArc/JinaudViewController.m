//
//  JinaudViewController.m
//  Orientation_noArc
//
//  Created by Michael Ogren on 5/22/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import "JinaudViewController.h"

@interface JinaudViewController ()

@end

@implementation JinaudViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSUInteger) supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape | UIInterfaceOrientationMaskPortrait;
}
@end
