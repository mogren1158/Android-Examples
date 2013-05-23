//
//  JinaudDoubleComponentViewController.h
//  Pickers
//
//  Created by Michael Ogren on 5/23/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kFillingComponent 0
#define kBreadComponent 1

@interface JinaudDoubleComponentViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *doublePicker;
@property (strong, nonatomic) NSArray * fillingTypes;
@property (strong, nonatomic) NSArray * breadTypes;

-(IBAction)buttonPressed;

@end
