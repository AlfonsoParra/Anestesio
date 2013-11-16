//
//  mBusquedaCloseViewController.m
//  DualmobileCongress
//
//  Created by luis Gonzalez on 05-06-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import "mBusquedaCloseViewController.h"

@interface mBusquedaCloseViewController ()

@end

@implementation mBusquedaCloseViewController
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
