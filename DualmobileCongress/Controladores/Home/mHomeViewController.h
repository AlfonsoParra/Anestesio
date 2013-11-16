//
//  mHomeViewController.h
//  DualmobileCongress
//
//  Created by luis Gonzalez on 06-05-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "mCustomCell.h"
#import "mDetalleViewController.h"
#import "SSPullToRefresh.h"
#import "mConexionRed.h"
#import "Evento.h"
#import "Persona.h"
#import "Lugar.h"
#import "Imagen.h"
#import "Institucion.h"
#import "GAITrackedViewController.h"
#import "AnimatedImagesView.h"





@interface mHomeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,NSFetchedResultsControllerDelegate , SSPullToRefreshViewDelegate>{
    
    BOOL EstadoDeLaconexion;
    BOOL TimerActivo;
}

@property (strong, nonatomic) IBOutlet UITableView *HomeTableview;
@property (strong, nonatomic) SSPullToRefreshView *pullToRefreshView ;
@property (strong, nonatomic) UIRefreshControl *refresh;

@property NSUInteger *numeroObjetos;



@property(nonatomic,strong)NSMutableArray *ProximasActividades;
@property(nonatomic,strong)NSMutableArray *EnesteMomento;
@property(nonatomic,strong)NSArray *ResultadosCoreData;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *BotonMenu;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *BotonNotificaciones;
@property (nonatomic, strong) NSArray *nombresEntidad;
@property (nonatomic, strong) IBOutlet AnimatedImagesView *animationImageView;



- (IBAction)RevelarMenuLateral:(id)sender;
- (IBAction)RevelarNotificaciones:(id)sender;



@end
