//
//  JinaudPresidentDetailViewController.h
//  Nav
//
//  Created by Michael Ogren on 5/24/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JinaudPresident;
@protocol JinaudPresidentDetailViewControllerDelegate;

@interface JinaudPresidentDetailViewController : UITableViewController<UITextFieldDelegate>

@property(copy, nonatomic) JinaudPresident * president;
@property(weak, nonatomic) id<JinaudPresidentDetailViewControllerDelegate> delegate;
@property(assign, nonatomic) NSInteger row;
@property(strong, nonatomic) NSArray * fieldLabels;

-(IBAction)cancel:(id)sender;
-(IBAction)save:(id)sender;
-(IBAction)textFieldDone:(id)sender;
@end

@protocol JinaudPresidentDetailViewControllerDelegate <NSObject>

-(void) presidentDetailViewController:(JinaudPresidentDetailViewController * ) controller
                   didUpdatePresident:(JinaudPresident *) president;

@end
