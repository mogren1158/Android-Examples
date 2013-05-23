//
//  JinaudViewController.m
//  Cells
//
//  Created by Michael Ogren on 5/23/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import "JinaudViewController.h"
#import "JinaudNameAndColorCell.h"

@interface JinaudViewController ()

@end

@implementation JinaudViewController

static NSString * cellTableIdentifier = @"CellTableIdentifier";

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.computers = @[
                       @{@"Name" : @"MacBook", @"Color" : @"White"},
                       @{@"Name" : @"MacBook Pro", @"Color" : @"Silver"},
                       @{@"Name" : @"iMac", @"Color" : @"Silver"},
                       @{@"Name" : @"Mac Mini", @"Color" : @"Silver"},
                       @{@"Name" : @"Mac Pro", @"Color" : @"Silver"}];
    
    UITableView * tableView = (id)[self.view viewWithTag:1];
    tableView.rowHeight = 65;
//    [tableView registerClass:[JinaudNameAndColorCell class] forCellReuseIdentifier:cellTableIdentifier];
    [tableView registerNib:[UINib nibWithNibName:@"JinaudNameAndColorCellWithXib" bundle:nil]
    forCellReuseIdentifier:cellTableIdentifier];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Table Data Source Methods
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.computers count];
}

-(UITableViewCell * ) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JinaudNameAndColorCell * cell  = [tableView dequeueReusableCellWithIdentifier:cellTableIdentifier];
    
    NSDictionary * rowData = self.computers[indexPath.row];
    cell.name = rowData[@"Name"];
    cell.color = rowData[@"Color"];
    
    return cell;
}

@end
