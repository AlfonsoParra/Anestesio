//
//  mAboutViewController.h
//  DualmobileCongress
//
//  Created by luis Gonzalez on 13-05-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "ECSlidingViewController.h"
#import "mDetalleAboutViewController.h"
#import "GAITrackedViewController.h"

@interface mAboutViewController :  UIViewController<MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UIBarButtonItem *BotonMenu;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *BotonNotificaciones;

- (IBAction)RevelarMenuLateral:(id)sender;
- (IBAction)RevelarNotificaciones:(id)sender;

@end
