//
//  JinaudRowControlsViewController.m
//  Nav
//
//  Created by Michael Ogren on 5/24/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import "JinaudRowControlsViewController.h"

static NSString * RowsCellIdentifier = @"RowsCell";

@implementation JinaudRowControlsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Rows Controls";
        
        self.rowImage = [UIImage imageNamed:@"Default.png"];
        self.characters = @[@"R2-D2", @"C3PO", @"Tik-Tok", @"Robby",
                            @"Rosie", @"Uniblab", @"Bender", @"Marvin",
                            @"Lt. Commander Data", @"Evil Brother Lore", @"Optimus Prime",
                            @"Tobor", @"HAL", @"Orgasmatron"];
    }
    return self;
}

-(void) tappedButton:(UIButton *)sender
{
    NSInteger row = sender.tag;
    NSString * character = self.characters[row];
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"You Tapped the button"
                                                     message:[NSString stringWithFormat:@"You tapped the button for %@", character]
                                                    delegate:nil
                                           cancelButtonTitle:@"ok"
                                           otherButtonTitles: nil];
    
    [alert show];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:RowsCellIdentifier];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.characters count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:RowsCellIdentifier];
    cell.textLabel.text = self.characters[indexPath.row];
    if(cell.accessoryView == nil)
    {
        UIImage * buttonUpImage = [UIImage imageNamed:@"Default.png"];
        UIImage * buttonDownImage = [UIImage imageNamed:@"Default.png"];
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:buttonUpImage forState:UIControlStateNormal];
        [button setBackgroundImage:buttonDownImage forState:UIControlStateHighlighted];
        [button setTitle:@"Tap" forState:UIControlStateNormal];
        [button sizeToFit];
        [button addTarget:self action:@selector(tappedButton:) forControlEvents:UIControlEventTouchUpInside];
        cell.accessoryView = button;
    }
    
    cell.accessoryView.tag = indexPath.row;
    
    return cell;
}

#pragma mark - Table View DelegateM Methods

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * character = self.characters[indexPath.row];
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"You tapped the row"
                                                     message:[NSString stringWithFormat:@"You tapped %@", character]
                                                    delegate:nil
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:  nil];
    
    [alert show];
}

@end
