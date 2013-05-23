//
//  DatePickerViewController.m
//  Pickers
//
//  Created by Michael Ogren on 5/23/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@end

@implementation DatePickerViewController

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
    // Do any additional setup after loading the view from its nib.
    [self.datePicker setDate:[NSDate date] animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonPressed:(id)sender
{
    NSDate * select = [self.datePicker date];
    
    NSString * message = [NSString stringWithFormat:@"The date and time you selected is: %@", select];
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Date and Time Selected"
                                                     message:message
                                                    delegate:nil
                                           cancelButtonTitle:@"Yes, I did"
                                           otherButtonTitles: nil];
    
    [alert show];
}

@end
