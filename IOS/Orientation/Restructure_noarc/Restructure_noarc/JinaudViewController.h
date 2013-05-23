//
//  JinaudViewController.h
//  Restructure_noarc
//
//  Created by Michael Ogren on 5/22/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JinaudViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIButton *bigButton;
@property (retain, nonatomic) IBOutlet UIButton *actionButton1;
@property (retain, nonatomic) IBOutlet UIButton *actionButton2;
@property (retain, nonatomic) IBOutlet UIButton *actionButton3;
@property (retain, nonatomic) IBOutlet UIButton *actionButton4;

-(void) doLayoutForOrientation:(UIInterfaceOrientation) orientation;

@end
