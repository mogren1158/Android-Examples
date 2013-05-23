//
//  JinaudCustomViewController.h
//  Pickers
//
//  Created by Michael Ogren on 5/23/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JinaudCustomViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView * picker;
@property (strong, nonatomic) IBOutlet UILabel * winLabel;
@property (strong, nonatomic) NSArray * images;

- (IBAction)spin;
@end
