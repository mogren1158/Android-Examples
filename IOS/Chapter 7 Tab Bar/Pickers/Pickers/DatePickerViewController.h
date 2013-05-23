//
//  DatePickerViewController.h
//  Pickers
//
//  Created by Michael Ogren on 5/23/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatePickerViewController : UIViewController

@property(strong, nonatomic) IBOutlet UIDatePicker * datePicker;
-(IBAction)buttonPressed:(id)sender;
@end
