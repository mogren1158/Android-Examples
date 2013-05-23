//
//  JinaudViewController.m
//  Simple Table
//
//  Created by Michael Ogren on 5/23/13.
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
    self.dwarves = @[@"Sleepy", @"Sneezy",
                     @"Bashful", @"Happy", @"Doc", @"Grumpy", @"Dopey", @"Thorin",
                     @"Dorin", @"Nori", @"Ori", @"Balin", @"Dwalin", @"Fili", @"Kili",
                     @"Oin", @"Gloin", @"Bifur", @"Bofur", @"Bombur"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TableView methods
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dwarves count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * simpletableIdentifier = @"SimpleTableIdentifier";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:simpletableIdentifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:simpletableIdentifier];
    }
    
    cell.imageView.image = [UIImage imageNamed:@"Default.png"];
    
    cell.textLabel.text = self.dwarves[indexPath.row];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:50];
    
    //not going to show up in default
    if(indexPath.row < 7)
    {
        cell.detailTextLabel.text = @"Mr. Disney";
    }
    else
    {
        cell.detailTextLabel.text = @"Mr. Tolkein";
    }
    
    return cell;
}

- (NSInteger) tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row;
}

-(NSIndexPath * ) tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
        return nil;
    }
    else
    {
        return indexPath;
    }
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rowValue = self.dwarves[indexPath.row];
    NSString * message = [NSString stringWithFormat:@"You selected %@", rowValue];
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"RowSelected"
                                                     message:message
                                                    delegate:nil
                                           cancelButtonTitle:@"Yes I did"
                                           otherButtonTitles: nil];
    
    [alert show];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

@end
