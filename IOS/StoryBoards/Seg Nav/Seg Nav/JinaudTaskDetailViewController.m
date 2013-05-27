//
//  JinaudTaskDetailViewController.m
//  Seg Nav
//
//  Created by Michael Ogren on 5/27/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import "JinaudTaskDetailViewController.h"

@interface JinaudTaskDetailViewController ()

@end

@implementation JinaudTaskDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.textView.text = self.selection[@"object"];
    [self.textView becomeFirstResponder];
}

-(void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    NSLog(@"calling view will disappear");
    if([self.delegate respondsToSelector:@selector(setEditedSelection:)])
    {
        [self.textView endEditing:YES];
        NSIndexPath * indexpath = self.selection[@"indexPath"];
        id object = self.textView.text;
        NSDictionary * editedSelection = @{
                                           @"indexPath":indexpath,
                                           @"object": object
                                           };
        
        NSLog(@"attempting to call editedSelection");
        [self.delegate setValue:editedSelection forKey:@"editedSelection"];
    }
}

@end
