//
//  mSeleccionJornadaViewController.h
//  DualmobileCongress
//
//  Created by luis Gonzalez on 12-05-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "mCustomCell.h"
#import "mJornadaViewController.h"
#import "GAITrackedViewController.h"
#import "AnimatedImagesView.h"
#import "Evento.h"
#import "Eventopadre.h"

@interface mSeleccionJornadaViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) IBOutlet UITableView *CustomTableview;
@property (nonatomic,strong) IBOutlet UIBarButtonItem *BotonMenu;
@property (nonatomic,strong) IBOutlet UIBarButtonItem *BotonNotificaciones;
@property (nonatomic,strong) NSArray *Jornadas;
@property (nonatomic,strong) NSArray *InicioJornadas;
@property (nonatomic,strong) NSArray *FinJornadas;

@property (nonatomic, strong) IBOutlet AnimatedImagesView *animationImageView;


- (IBAction)RevelarMenuLateral:(id)sender;
- (IBAction)RevelarNotificaciones:(id)sender;

@end
