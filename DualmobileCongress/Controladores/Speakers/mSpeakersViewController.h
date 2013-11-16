//
//  mSpeakersViewController.h
//  DualmobileCongress
//
//  Created by luis Gonzalez on 07-05-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "mSpeakerDetViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ECSlidingViewController.h"
#import "mDetalleViewController.h"
#import "mCustomCell.h"
#import "mAppDelegate.h"
#import "Evento.h"
#import "Lugar.h"
#import "Institucion.h"
#import "AnimatedImagesView.h"
#import "Notificacion.h"

@class mSpeakerCloseViewController;
@interface mSpeakersViewController : UIViewController<UITableViewDataSource,UITableViewDelegate , UISearchBarDelegate>{
    mSpeakerCloseViewController  *ovController;
    BOOL searching;
}


#pragma -mark Propiedades 


@property (strong, nonatomic) IBOutlet UIBarButtonItem *BotonNotificaciones;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *BotonMenu;


@property(nonatomic,strong) NSArray *coredatinos;
@property(nonatomic,strong) NSMutableArray *hueasQueSeDepliegan;


@property (strong, nonatomic) IBOutlet UISearchBar *buscar;

@property (strong, nonatomic) IBOutlet UITableView *SpeakerTableview;

@property (nonatomic, strong) IBOutlet AnimatedImagesView *animationImageView;

#pragma -mark eventos

- (IBAction)RevelarMenuLateral:(id)sender;


- (IBAction)RevelarNotificaciones:(id)sender;

-(void)CerrarTeclado;
@end
