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
#import "mHotelesTabla.h"
#import "GAITrackedViewController.h"
#import "AnimatedImagesView.h"
#import "Evento.h"
#import "Eventopadre.h"
#import "mDetalleHotel.h"

@interface mHotelesTabla : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) IBOutlet UITableView *CustomTableview;
@property (nonatomic,strong) IBOutlet UIBarButtonItem *BotonMenu;
@property (nonatomic,strong) IBOutlet UIBarButtonItem *BotonNotificaciones;
@property (nonatomic,strong) NSArray *Hoteles;
@property (nonatomic,strong) NSArray *descripcionHotel;
@property (nonatomic,strong) NSArray *fonoHotel;
@property (nonatomic,strong) NSArray *coordenadasHotelesY;
@property (nonatomic,strong) NSArray *coordenadasHotelesX;
@property (nonatomic,strong) NSArray *paginaHoteles;
@property (nonatomic, strong) IBOutlet AnimatedImagesView *animationImageView;


- (IBAction)RevelarMenuLateral:(id)sender;
- (IBAction)RevelarNotificaciones:(id)sender;

@end
