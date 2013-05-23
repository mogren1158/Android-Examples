//
//  JinaudDependentComponentViewController.h
//  Pickers
//
//  Created by Michael Ogren on 5/23/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kStateComponent 0
#define kZipComponent 1

@interface JinaudDependentComponentViewController : UIViewController
<UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UIPickerView * dependentPicker;
@property (strong, nonatomic) NSDictionary * stateZips;
@property (strong, nonatomic) NSArray * states;
@property (strong, nonatomic) NSArray * zips;

-(IBAction)buttonPressed;

@end
