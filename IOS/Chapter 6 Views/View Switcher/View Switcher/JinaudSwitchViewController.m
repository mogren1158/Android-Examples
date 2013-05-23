//
//  JinaudSwitchViewController.m
//  View Switcher
//
//  Created by Michael Ogren on 5/22/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import "JinaudSwitchViewController.h"
#import "BlueViewController.h"
#import "YellowViewController.h"

@interface JinaudSwitchViewController ()

@end

@implementation JinaudSwitchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.blueViewController = [[BlueViewController alloc] initWithNibName:@"BlueView"
                                                                   bundle:nil];
    [self.view insertSubview: self.blueViewController.view atIndex:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    if(self.yellowViewController.view.superview == nil)
    {
        self.yellowViewController = nil;
    }
    else
    {
        self.blueViewController = nil;
    }
    // Dispose of any resources that can be recreated.
}


- (IBAction)switchView:(id)sender
{
    [UIView beginAnimations:@"View Flip" context:nil];
    [UIView setAnimationDuration:1.25];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    if(self.yellowViewController.view.superview == nil)
    {
        
        if(self.yellowViewController == nil)
        {
            self.yellowViewController = [[YellowViewController alloc] initWithNibName:@"YellowView"
                                                                               bundle:nil];
        }
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
                               forView:self.view
                                 cache:YES];
        
        [self.blueViewController.view removeFromSuperview];
        [self.view insertSubview:self.yellowViewController.view atIndex:0];
    }
    else
    {
        if(self.blueViewController == nil)
        {
            self.blueViewController = [[BlueViewController alloc] initWithNibName:@"BlueView"
                                                                           bundle:nil];
        }
        
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                               forView:self.view
                                 cache:YES];
        [self.yellowViewController.view removeFromSuperview];
        [self.view insertSubview:self.blueViewController.view atIndex:0];
    }
    
    [UIView commitAnimations];
}
@end
