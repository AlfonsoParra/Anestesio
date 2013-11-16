//
//  mSpeakerCloseViewController.m
//  DualmobileCongress
//
//  Created by luis Gonzalez on 05-06-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import "mSpeakerCloseViewController.h"

@interface mSpeakerCloseViewController ()

@end

@implementation mSpeakerCloseViewController
@synthesize rvController;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	[rvController CerrarTeclado];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
