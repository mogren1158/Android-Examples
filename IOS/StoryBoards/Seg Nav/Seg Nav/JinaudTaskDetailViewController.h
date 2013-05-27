//
//  JinaudTaskDetailViewController.h
//  Seg Nav
//
//  Created by Michael Ogren on 5/27/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JinaudTaskDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property(copy, nonatomic) NSDictionary * selection;
@property(weak, nonatomic) id delegate;

@end
