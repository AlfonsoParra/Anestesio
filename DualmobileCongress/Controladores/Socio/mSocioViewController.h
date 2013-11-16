//
//  mSocioViewController.h
//  DualmobileCongress
//
//  Created by Alfonso Parra on 11-10-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mAppDelegate.h"
#import <QuartzCore/QuartzCore.h>
#import "ECSlidingViewController.h"
#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import <MessageUI/MessageUI.h>
#import "AnimatedImagesView.h"

@interface mSocioViewController : UIViewController <MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UIBarButtonItem *BotonMenu;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *BotonNotificaciones;
@property (nonatomic, strong) IBOutlet AnimatedImagesView *animationImageView;

- (IBAction)enviarCorreo:(id)sender;
- (IBAction)RevelarMenuLateral:(id)sender;
- (IBAction)RevelarNotificaciones:(id)sender;

@end
