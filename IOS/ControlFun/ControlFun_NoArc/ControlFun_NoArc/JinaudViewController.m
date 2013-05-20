//
//  JinaudViewController.m
//  ControlFun_NoArc
//
//  Created by Michael Ogren on 5/20/13.
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
    self.sliderLabel.text = [NSString stringWithFormat:@"%d", (int)lroundf(self.slider.value)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)textFieldDoneEditing:(id)sender
{
    [sender resignFirstResponder];
}

-(IBAction)backgroundTap:(id)sender
{
    [self.nameField resignFirstResponder];
    [self.numberField resignFirstResponder];
}

- (IBAction)sliderChanged:(UISlider *)sender
{
    int progress = lroundf(sender.value);
    self.sliderLabel.text = [NSString stringWithFormat:@"%d", progress];
}

- (IBAction)switchChanged:(UISwitch *)sender {
    BOOL setting = sender.isOn;
    if(self.leftSwitch == sender)
    {
        [self.leftSwitch setOn:setting animated:YES];
    }
    else if(self.rightSwitch == sender)
    {
        [self.rightSwitch setOn:setting animated:YES];
    }
}

- (IBAction)toggleControls:(UISegmentedControl *)sender {
    if(sender.selectedSegmentIndex == 0)
    {
        self.leftSwitch.hidden = NO;
        self.rightSwitch.hidden = NO;
        self.doSomethingButton.hidden = YES;
    }
    else if(sender.selectedSegmentIndex == 1)
    {
        self.leftSwitch.hidden = YES;
        self.rightSwitch.hidden = YES;
        self.doSomethingButton.hidden = NO;
    }
    
}

- (IBAction)buttonPressed:(UIButton *)sender {
    
    UIActionSheet * actionSheet = [[UIActionSheet alloc]
                                   initWithTitle:@"Are you sure?"
                                   delegate:self
                                   cancelButtonTitle:@"NoWay!"
                                   destructiveButtonTitle:@"Yes, I'm Sure!"
                                   otherButtonTitles:nil];
    
    [actionSheet showInView: self.view];
    [actionSheet release];
}

-(void) actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if(buttonIndex != [actionSheet cancelButtonIndex])
    {
        NSString *msg = nil;
        
        if(self.nameField.text.length > 0)
        {
            msg = [NSString stringWithFormat:@"You can rest easy, %@", self.nameField.text];
        }
        else
        {
            msg = [NSString stringWithFormat:@"You can rest easy, %@", self.nameField.text];
        }
        
        UIAlertView * alert =[[UIAlertView alloc]
                              initWithTitle:@"Something Was done"
                              message:msg
                              delegate:nil
                              cancelButtonTitle:@"Phew"
                              otherButtonTitles:nil];
        
        [alert show];
        
        [alert release];
    }
}

- (void)dealloc {
    [_nameField release];
    [_numberField release];
    [_sliderLabel release];
    [_slider release];
    [_rightSwitch release];
    [_leftSwitch release];
    [_doSomethingButton release];
    [super dealloc];
}
@end
