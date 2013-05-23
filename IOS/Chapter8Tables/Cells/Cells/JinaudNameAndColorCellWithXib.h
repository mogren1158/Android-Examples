//
//  JinaudNameAndColorCellWithXib.h
//  Cells
//
//  Created by Michael Ogren on 5/23/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JinaudNameAndColorCellWithXib : UITableViewCell

@property (copy, nonatomic) NSString * name;
@property (copy, nonatomic) NSString * color;

@property (strong, nonatomic) IBOutlet UILabel * nameValue;
@property (strong, nonatomic) IBOutlet UILabel * colorValue;
@end
