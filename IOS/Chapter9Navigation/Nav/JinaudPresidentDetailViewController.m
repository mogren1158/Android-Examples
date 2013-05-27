//
//  JinaudPresidentDetailViewController.m
//  Nav
//
//  Created by Michael Ogren on 5/24/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import "JinaudPresidentDetailViewController.h"
#import "JinaudPresident.h"

#define kNumberOfEditableRows 4
#define kNameRowIndex 0
#define kFromYearRowIndex 1
#define kToYearRowIndex 2
#define kPartyIndex 3
#define kLabelTag 2048
#define kTextFieldTag 3094

@implementation JinaudPresidentDetailViewController
{
    NSString * initialText;
    BOOL hasChanges;
}


-(void) cancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)save:(id)sender
{
    [self.view endEditing:YES];
    if(hasChanges)
    {
        [self.delegate presidentDetailViewController:self
                                  didUpdatePresident:self.president];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) textFieldDone:(id)sender
{
    [sender resignFirstResponder];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        self.fieldLabels = @[@"Name:", @"From:", @"To:", @"Party:"];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                                 initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                 target:self
                                                 action:@selector(cancel:)];
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                                  initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                  target:self
                                                  action:@selector(save:)];
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
    
    self.tableView.allowsSelection = NO;
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
    return kNumberOfEditableRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 75, 25)];
        label.tag = kLabelTag;
        label.textAlignment = NSTextAlignmentRight;
        label.font = [UIFont boldSystemFontOfSize:14];
        [cell.contentView addSubview: label];
        
        UITextField * textField = [[UITextField alloc] initWithFrame:CGRectMake(90, 12, 200, 25)];
        textField.tag = kTextFieldTag;
        textField.clearsOnBeginEditing = NO;
        textField.delegate = self;
        textField.returnKeyType = UIReturnKeyDone;
        [textField addTarget:self
                      action:@selector(textFieldDone:)
            forControlEvents:UIControlEventEditingDidEndOnExit];
        
        [cell.contentView addSubview:textField];
    }
    
    UILabel * label = (id) [cell viewWithTag:kLabelTag];
    label.text = self.fieldLabels[indexPath.row];
    
    UITextField * textField = (id)[cell viewWithTag:kTextFieldTag];
    textField.superview.tag = indexPath.row;
    switch(indexPath.row)
    {
        case kNameRowIndex:
            textField.text = self.president.name;
            break;
        case kFromYearRowIndex:
            textField.text = self.president.fromYear;
            break;
        case kToYearRowIndex:
            textField.text = self.president.toYear;
            break;
        case kPartyIndex:
            textField.text = self.president.party;
            break;
        default:
            break;
            
    }
    
    return cell;
}

-(void) textFieldDidBeginEditing:(UITextField *)textField
{
    initialText = textField.text;
}

-(void) textFieldDidEndEditing:(UITextField *)textField
{
    if(![textField.text isEqualToString:initialText])
    {
        hasChanges = YES;
        switch(textField.superview.tag)
        {
            case kNameRowIndex:
                self.president.name = textField.text;
                break;
            case kFromYearRowIndex:
                self.president.fromYear = textField.text;
                break;
            case kToYearRowIndex:
                self.president.toYear = textField.text;
                break;
            case kPartyIndex:
                self.president.party = textField.text;
                break;
            default:
                break;
        }
    }
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
