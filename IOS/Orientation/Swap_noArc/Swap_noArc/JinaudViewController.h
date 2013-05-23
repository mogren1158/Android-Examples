//
//  JinaudViewController.h
//  Swap_noArc
//
//  Created by Michael Ogren on 5/22/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JinaudViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIView *portrait;
@property (retain, nonatomic) IBOutlet UIView *landscape;
@property (retain, nonatomic) IBOutletCollection(UIButton) NSArray *foos;
@property (retain, nonatomic) IBOutletCollection(UIButton) NSArray *bars;
- (IBAction)ButtonTapped:(UIButton *)sender;

@end
