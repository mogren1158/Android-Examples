//
//  JinaudDoubleComponentViewController.m
//  Pickers
//
//  Created by Michael Ogren on 5/23/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import "JinaudDoubleComponentViewController.h"

@interface JinaudDoubleComponentViewController ()

@end

@implementation JinaudDoubleComponentViewController

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
    self.fillingTypes = @[@"Ham", @"Turkey", @"Peanut Butter",
                          @"Tuna Salad", @"Chicken Salad", @"Roast Beef", @"Vegemite"];
    self.breadTypes = @[@"White", @"Whole Wheat", @"Rye",
                        @"Sourdough", @"Seven Grain"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) buttonPressed
{
    NSInteger fillingRow = [self.doublePicker selectedRowInComponent:kFillingComponent];
    NSInteger breadRow = [self.doublePicker selectedRowInComponent:kBreadComponent];
    NSString * filling = self.fillingTypes[fillingRow];
    NSString * bread = self.breadTypes[breadRow];
    
    NSString * message = [NSString stringWithFormat:@"Your %@ on %@ bread will be right up.", filling, bread];
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Thank you for your order"
                                                     message:message
                                                    delegate:nil
                                           cancelButtonTitle:@"Great"
                                           otherButtonTitles: nil];
    [alert show];
}

#pragma mark - 
#pragma mark Picker Data Source Methods
-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component == kFillingComponent)
    {
        return [self.fillingTypes count];
    }
    else
    {
        return [self.breadTypes count];
    }
}

#pragma mark Picker Delegate Methods
-(NSString * ) pickerView:(UIPickerView *)pickerView
              titleForRow:(NSInteger)row
             forComponent:(NSInteger)component
{
    if(component == kBreadComponent)
    {
        return self.breadTypes[row];
    }
    else
    {
        return self.fillingTypes[row];
    }
}

@end
