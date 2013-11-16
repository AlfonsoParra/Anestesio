//
//  mMapasViewController.h
//  DualmobileCongress
//
//  Created by luis Gonzalez on 11-05-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ECSlidingViewController.h"
#import "mCustomCell.h"
#import "AnimatedImagesView.h"

@interface mMapasViewController : UIViewController


@property (strong, nonatomic) IBOutlet UIBarButtonItem *BotonMenu;
- (IBAction)RevelarMenuLateral:(id)sender;
- (IBAction)RevelarNotificaciones:(id)sender;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *BotonNotificaciones;
@property (nonatomic, strong) IBOutlet AnimatedImagesView *animationImageView;
@end
