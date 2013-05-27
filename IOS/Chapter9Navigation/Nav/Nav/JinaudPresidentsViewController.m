//
//  JinaudPresidentsViewController.m
//  Nav
//
//  Created by Michael Ogren on 5/24/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import "JinaudPresidentsViewController.h"
#import "JinaudPresident.h"
#import "JinaudPresidentDetailViewController.h"

static NSString * PresidentCellIdentifier = @"PresidentCell";

@implementation JinaudPresidentsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Detail Edit";
        self.rowImage = [UIImage imageNamed:@"Default.png"];
        NSString * path = [[NSBundle mainBundle] pathForResource:@"Presidents" ofType:@"plist"];
        NSData * data = [[NSData alloc] initWithContentsOfFile:path];
      
        NSKeyedUnarchiver * unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        self.presidents = [unarchiver decodeObjectForKey:@"Presidents"];
        
        NSLog(@"presidents = %@", self.presidents);
        [unarchiver finishDecoding];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:PresidentCellIdentifier];
}

#pragma mark - Table View Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.presidents count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PresidentCellIdentifier];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    JinaudPresident *president = self.presidents[indexPath.row];
    cell.textLabel.text = president.name;
    return cell;
}

#pragma mark - Table View Delegate Methods

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JinaudPresident * president = self.presidents[indexPath.row];
    JinaudPresidentDetailViewController * controller = [[JinaudPresidentDetailViewController alloc]init];
    controller.president = president;
    controller.delegate = self;
    controller.row = indexPath.row;
    [self.navigationController pushViewController:controller animated:YES];
}

-(void) presidentDetailViewController:(JinaudPresidentDetailViewController *)controller
                   didUpdatePresident:(JinaudPresident *)president
{
    [self.presidents replaceObjectAtIndex:controller.row withObject:president];
    [self.tableView reloadData];
}

@end
