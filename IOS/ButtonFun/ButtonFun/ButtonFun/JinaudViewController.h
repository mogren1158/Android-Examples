//
//  JinaudViewController.h
//  ButtonFun
//
//  Created by Michael Ogren on 5/20/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JinaudViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

- (IBAction)buttonpressed:(UIButton *)sender;

@end
