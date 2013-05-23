//
//  JinaudViewController.m
//  Swap_noArc
//
//  Created by Michael Ogren on 5/22/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import "JinaudViewController.h"

#define degreesToRadians(x) (M_PI * (x) / 180.0)
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

- (void)dealloc {
    [_portrait release];
    [_landscape release];
    [_foos release];
    [_bars release];
    [super dealloc];
}

- (void) willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation) interfaceOrientation
                                          duration: (NSTimeInterval) Duration
{
    if(interfaceOrientation == UIInterfaceOrientationPortrait)
    {
        self.view = self.portrait;
        self.view.transform = CGAffineTransformIdentity;
        self.view.transform = CGAffineTransformMakeRotation(degreesToRadians(0));
        self.view.bounds = CGRectMake(0.0, 0.0, 320.0, 460.0);
    }
    else if(interfaceOrientation == UIInterfaceOrientationLandscapeLeft)
    {
        self.view = self.landscape;
        self.view.transform = CGAffineTransformIdentity;
        self.view.transform = CGAffineTransformMakeRotation(degreesToRadians(-90));
        self.view.bounds = CGRectMake(0.0, 0.0, 480.0, 320.0);
    }
    else if(interfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        self.view = self.landscape;
        self.view.transform = CGAffineTransformIdentity;
        self.view.transform = CGAffineTransformMakeRotation(degreesToRadians(90));
        self.view.bounds = CGRectMake(0.0, 0.0, 480.0, 320.0);
    }
}

- (IBAction)ButtonTapped:(UIButton *)sender
{
    NSString * msg = nil;
    if([self.foos containsObject:sender])
    {
        msg = @"foo button hit";
        for (UIButton * foo in self.foos)
        {
            foo.hidden = YES;
        }
    }
    else if([self.bars containsObject:sender])
    {
        msg = @"bar button hit";
        for(UIButton * bar in self.bars)
        {
            bar.hidden = YES;
        }
    }
    
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:msg
                                                         message:nil
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
    
    [alertView show];
    
    [alertView release];
}
@end
