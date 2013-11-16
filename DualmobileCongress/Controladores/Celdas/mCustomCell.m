//
//  mCustomCell.m
//  DualmobileCongress
//
//  Created by luis Gonzalez on 07-05-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import "mCustomCell.h"

@implementation mCustomCell

@synthesize dayOfMonthLabel,dayOfWeekLabel,monthLabel,timeLabel;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setTime:(NSDate *)horaInicio
{
    static NSDateFormatter *_dateTimeFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _dateTimeFormatter = [[NSDateFormatter alloc] init];
    });
    
    [_dateTimeFormatter setDateFormat:@"EEE"];
    self.dayOfWeekLabel.text = [[_dateTimeFormatter stringFromDate:horaInicio] uppercaseString];
    
    [_dateTimeFormatter setDateFormat:@"MMM"];
    self.monthLabel.text = [[_dateTimeFormatter stringFromDate:horaInicio] uppercaseString];
    
    [_dateTimeFormatter setDateFormat:@"d"];
    self.dayOfMonthLabel.text = [_dateTimeFormatter stringFromDate:horaInicio];
    
    [_dateTimeFormatter setDateFormat:@"h:mm a"];
    self.timeLabel.text = [_dateTimeFormatter stringFromDate:horaInicio];
    
    NSLog(@"%@",self.timeLabel.text);
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
