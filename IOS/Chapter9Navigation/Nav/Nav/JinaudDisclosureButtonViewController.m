//
//  JinaudDisclosureButtonViewController.m
//  Nav
//
//  Created by Michael Ogren on 5/24/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import "JinaudDisclosureButtonViewController.h"
#import "JinaudDisclosureDetailViewController.h"

static NSString * DisclosureCellIdentifer = @"disclosureCellIdentifier";

@implementation JinaudDisclosureButtonViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Disclosure Buttons";
        self.rowImage = [UIImage imageNamed:@"Default.png"];
        self.movies = @[@"Toy Story", @"A Bug’s Life", @"Toy Story 2",
                        @"Monsters, Inc.", @"Finding Nemo", @"The Incredibles",
                        @"Cars", @"Ratatouille", @"WALL-E", @"Up",
                        @"Toy Story 3", @"Cars 2", @"Brave"];
        
        self.detailController = [[JinaudDisclosureDetailViewController alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:DisclosureCellIdentifer];
}


#pragma mark - Table View Data Source Methods

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.movies count];
}

-(UITableViewCell * ) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:DisclosureCellIdentifer];
    
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    cell.textLabel.text = self.movies[indexPath.row];
    
    return cell;
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Hey, do you see the disclosure Button?"
                                                    message:@"Touch that to drill down instead."
                                                   delegate:nil
                                          cancelButtonTitle:@"Won't happen again"
                                          otherButtonTitles: nil];
    
    [alert show];
}

-(void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    self.detailController.title = @"DisclosureButtonPressed";
    NSString * selectedMovies = self.movies[indexPath.row];
    
    NSString * detailMessage = [NSString stringWithFormat:@"This is details for %@.", selectedMovies];
    self.detailController.message = detailMessage;
    self.detailController.title = selectedMovies;
    
    [self.navigationController pushViewController:self.detailController animated:YES];
}

@end
