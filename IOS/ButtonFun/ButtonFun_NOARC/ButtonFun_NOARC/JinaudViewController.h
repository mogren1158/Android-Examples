//
//  JinaudViewController.h
//  ButtonFun_NOARC
//
//  Created by Michael Ogren on 5/20/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JinaudViewController : UIViewController
@property (retain, nonatomic) IBOutlet UILabel *statusLabel;
- (IBAction)buttonPressed:(UIButton *)sender;

@end
