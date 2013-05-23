//
//  YellowViewController.m
//  View Switcher
//
//  Created by Michael Ogren on 5/22/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import "YellowViewController.h"

@interface YellowViewController ()

@end

@implementation YellowViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) yellowButtonPressed:(id)sender
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Yellow View Button Pressed"
                                                     message:@"You Pressed the yellow view's button"
                                                    delegate:nil
                                           cancelButtonTitle:@"Yes I did "
                                           otherButtonTitles:nil];
    
    [alert show];
}
@end
