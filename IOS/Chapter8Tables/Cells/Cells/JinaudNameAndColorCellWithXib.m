//
//  JinaudNameAndColorCellWithXib.m
//  Cells
//
//  Created by Michael Ogren on 5/23/13.
//  Copyright (c) 2013 Michael Ogren. All rights reserved.
//

#import "JinaudNameAndColorCellWithXib.h"

@implementation JinaudNameAndColorCellWithXib
{
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


-(void) setName: (NSString*) n
{
    if(![n isEqualToString:_name])
    {
        _name = [n copy];
        _nameValue.text = _name;
    }
}

-(void) setColor: (NSString*) c
{
    if(![ c isEqualToString:_color])
    {
        _color = [c copy];
        _colorValue.text = _color;
    }
}

@end
