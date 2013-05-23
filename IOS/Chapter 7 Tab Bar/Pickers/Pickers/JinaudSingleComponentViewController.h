//
//  JinaudSingleComponentViewController.h
//  Pickers
//
//  Created by Michael Ogren on 5/23/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JinaudSingleComponentViewController : UIViewController
<UIPickerViewDelegate, UIPickerViewDataSource>

@property(strong, nonatomic) IBOutlet UIPickerView * singlePicker;
@property(strong, nonatomic) NSArray *characterNames;
- (IBAction)buttonPressed;

@end
