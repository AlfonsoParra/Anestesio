//
//  mNavigationMasterViewController.m
//  DualmobileCongress
//
//  Created by luis Gonzalez on 07-05-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import "mNavigationMasterViewController.h"
#import "mAppDelegate.h"
#import "Evento.h"
#import "Persona.h"
#import "Notificacion.h"


@interface mNavigationMasterViewController ()

@property(nonatomic,strong)mAppDelegate *dele;

@end

@implementation mNavigationMasterViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.hidesBackButton = YES;
    
    [super viewWillAppear:animated];
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 4.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;

    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[mMenuLateralViewController class]]) {
        self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuLateral"];
    }
    
    if (![self.slidingViewController.underRightViewController isKindOfClass:[mNotificacionesViewController class]]) {
        self.slidingViewController.underRightViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Notificaciones"];
    }
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    
float sysVer = [[[UIDevice currentDevice] systemVersion] floatValue];
    
    if (sysVer >= 7.0) {
        UIImage *navBackgroundImage = [UIImage imageNamed:@"navbar128"];
        [[UINavigationBar appearance] setBackgroundImage:navBackgroundImage forBarMetrics:UIBarMetricsDefault];
    }
    else {
        UIImage *navBackgroundImage = [UIImage imageNamed:@"navbar"];
        [[UINavigationBar appearance] setBackgroundImage:navBackgroundImage forBarMetrics:UIBarMetricsDefault];
    }
    
    if (sysVer >= 7.0){
        
        _dele.window.tintColor = [UIColor lightGrayColor];
        
    }
    
    else {
        
        UIImage *backButtonImage = [[UIImage imageNamed:@"boton_volver"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 1, 0, 2)];
        
        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:backButtonImage];
        
    }
}




@end
