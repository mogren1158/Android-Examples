//
//  JinaudViewController.m
//  Restructure_noarc
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
    
    UIApplication * app =[UIApplication sharedApplication];
    UIInterfaceOrientation currentOrientation = app.statusBarOrientation;
    [self doLayoutForOrientation:currentOrientation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_bigButton release];
    [_actionButton1 release];
    [_actionButton2 release];
    [_actionButton3 release];
    [_actionButton4 release];
    [super dealloc];
}

-(void) willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self doLayoutForOrientation:toInterfaceOrientation];
}

-(void) doLayoutForOrientation:(UIInterfaceOrientation) orientation
{
    if(UIInterfaceOrientationIsPortrait(orientation))
    {
        self.bigButton.frame = CGRectMake(20, 20, 280, 280);
        self.actionButton1.frame = CGRectMake(20, 320, 120, 40);
        self.actionButton2.frame = CGRectMake(20, 400, 120, 40);
        self.actionButton3.frame = CGRectMake(180, 320, 120, 40);
        self.actionButton4.frame = CGRectMake(180, 400, 120, 40);
    }
    else
    {
        self.bigButton.frame = CGRectMake(20, 20, 260, 260);
        self.actionButton1.frame = CGRectMake(320, 20, 120, 40);
        self.actionButton2.frame = CGRectMake(320, 90, 120, 40);
        self.actionButton3.frame = CGRectMake(320, 160, 120, 40);
        self.actionButton4.frame = CGRectMake(320, 230, 120, 40);
    }
}
@end
