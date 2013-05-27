//
//  JinaudTaskListViewController.m
//  Simple Storyboard
//
//  Created by Michael Ogren on 5/27/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import "JinaudTaskListViewController.h"

@interface JinaudTaskListViewController ()

@end

@implementation JinaudTaskListViewController

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
    self.tasks = [@[@"Walk the dog",
                   @"URGENT: Buy milk",
                   @"Clean hidden lair",
                   @"Invent miniature dolphins",
                   @"Find new henchmen",
                   @"Get revenge on do-gooder heroes",
                   @"URGENT: Fold laundry",
                   @"Hold entire world hostage",
                   @"Manicure"] mutableCopy];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = nil;
    
    NSString * task = [self.tasks objectAtIndex:indexPath.row];
    NSRange urgentRange = [task rangeOfString:@"URGENT"];
    if(urgentRange.location == NSNotFound)
    {
        CellIdentifier = @"plainCell";
    }
    else
    {
        CellIdentifier = @"attentionCell";
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    
    
    UILabel * cellLabel = (UILabel *) [cell viewWithTag:1];
    NSMutableAttributedString * richTask = [[NSMutableAttributedString alloc] initWithString:task];
    NSDictionary * urgentAttributes = @{
                                        NSFontAttributeName: [UIFont fontWithName:@"Courier" size:23],
                                        NSStrokeWidthAttributeName: @3.0
                                        };
    
    [richTask setAttributes:urgentAttributes range:urgentRange];
    cellLabel.attributedText = richTask;
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController * destination = segue.destinationViewController;
    if([destination respondsToSelector:@selector(setDelegate:)])
    {
        [destination setValue:self forKey: @"delegate"];
    }
    
    if([destination respondsToSelector:@selector(setSelection:)])
    {
        NSIndexPath * indexPath = [self.tableView indexPathForCell:sender];
        id object = self.tasks[indexPath.row];
        NSDictionary * selection = @{
                                     @"indexPath" : indexPath,
                                     @"object": object
                                     };
        
        [destination setValue:selection forKey:@"selection"];
    }
}

-(void) setEditedSelection:(NSDictionary *)editedSelection
{
    NSLog(@"setEditedSelection = %@", editedSelection);
    if(![editedSelection isEqualToDictionary:self.editedSelection])
    {
        _editedSelection = editedSelection;
        NSIndexPath *indexPath = editedSelection[@"indexPath"];
        id newValue = editedSelection[@"object"];
        [self.tasks replaceObjectAtIndex:indexPath.row withObject:newValue];
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                              withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

@end
