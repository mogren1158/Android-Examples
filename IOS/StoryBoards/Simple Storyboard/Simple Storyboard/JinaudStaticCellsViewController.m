//
//  JinaudStaticCellsViewController.m
//  Simple Storyboard
//
//  Created by Michael Ogren on 5/27/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import "JinaudStaticCellsViewController.h"

@interface JinaudStaticCellsViewController ()

@end

@implementation JinaudStaticCellsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSDate * now = [NSDate date];
    self.datelabel.text = [NSDateFormatter localizedStringFromDate:now
                                                         dateStyle:NSDateFormatterLongStyle
                                                         timeStyle:NSDateFormatterNoStyle];
    
    self.timeLabel.text = [NSDateFormatter localizedStringFromDate:now
                                                         dateStyle:NSDateFormatterNoStyle
                                                         timeStyle:NSDateFormatterLongStyle];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
