//
//  JinaudViewController.m
//  ButtonFun
//
//  Created by Michael Ogren on 5/20/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import "JinaudViewController.h"

@interface JinaudViewController ()

@end

@implementation JinaudViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonpressed:(UIButton *)sender {
    NSString *title = [sender titleForState:UIControlStateNormal];
    NSString *plainText= [NSString stringWithFormat:@"%@ button pressed.", title];
    //self.statusLabel.text = plainText;
    
    NSMutableAttributedString * styledText = [[NSMutableAttributedString alloc] initWithString:plainText];
    
    NSDictionary * attributes = @{
                                  NSFontAttributeName: [UIFont boldSystemFontOfSize: self.statusLabel.font.pointSize]
                                  };
    
    NSRange nameRange = [plainText rangeOfString:title];
    [styledText setAttributes:attributes range:nameRange];
    self.statusLabel.attributedText = styledText;
}
@end
