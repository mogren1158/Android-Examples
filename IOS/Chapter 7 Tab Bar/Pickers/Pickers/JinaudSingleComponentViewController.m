//
//  JinaudSingleComponentViewController.m
//  Pickers
//
//  Created by Michael Ogren on 5/23/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import "JinaudSingleComponentViewController.h"

@interface JinaudSingleComponentViewController ()

@end

@implementation JinaudSingleComponentViewController

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
    
    self.characterNames = @[@"Luke", @"Leia", @"Han", @"Chewbacca", @"Artoo", @"Threepio", @"Lando"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonPressed
{
    NSInteger row = [self.singlePicker selectedRowInComponent:0];
    NSString * selected = self.characterNames[row];
    NSString * title = [NSString stringWithFormat:@"YouSelected %@", selected];
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:title
                                                     message:@"Thank you for chooseing"
                                                    delegate:nil
                                           cancelButtonTitle:@"You're Welcome"
                                           otherButtonTitles: nil];
    
    [alert show];
}

#pragma mark - 
#pragma mark Picker Data Source Methods
-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.characterNames count];
}

#pragma mark Picker Delegate Methods
-(NSString * ) pickerView:(UIPickerView *)pickerView
              titleForRow:(NSInteger)row
             forComponent:(NSInteger)component
{
    return self.characterNames[row];
}

@end
