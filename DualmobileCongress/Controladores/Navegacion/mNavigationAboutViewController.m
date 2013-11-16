//
//  mNavigationAboutViewController.m
//  DualmobileCongress
//
//  Created by luis Gonzalez on 31-05-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import "mNavigationAboutViewController.h"
#import "mAppDelegate.h"

@interface mNavigationAboutViewController ()

@property(nonatomic,strong)mAppDelegate *dele;

@end

@implementation mNavigationAboutViewController

- (void)viewWillAppear:(BOOL)animated
{
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
    UIImage *navBackgroundImage = [UIImage imageNamed:@"navbar_about"];
    [[UINavigationBar appearance] setBackgroundImage:navBackgroundImage forBarMetrics:UIBarMetricsDefault];
    
float sysVer = [[[UIDevice currentDevice] systemVersion] floatValue];
    
    if (sysVer >= 7.0){
        
        _dele.window.tintColor = [UIColor lightGrayColor];
        
        //        [[UIBarButtonItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], UITextAttributeTextColor, [UIFont boldSystemFontOfSize:16.0f], UITextAttributeFont, [UIColor darkGrayColor], UITextAttributeTextShadowColor, [NSValue valueWithCGSize:CGSizeMake(0.0,-1.0)], UITextAttributeTextShadowOffset, nil] forState:UIControlStateNormal];
        
    }
    else {
        
        UIImage *backButtonImage = [[UIImage imageNamed:@"boton_volver"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 1, 0, 2)];
        
        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:backButtonImage];
        
    }

    
    
    
}




@end
